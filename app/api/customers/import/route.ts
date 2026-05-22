import { authOptions } from '@/authOptions';
import { drizzleDb } from '@/app/lib/drizzle/db';
import { company, customers } from '@/app/lib/drizzle/schema';
import ExcelJS from 'exceljs';
import { inArray, or, and, eq, sql } from 'drizzle-orm';
import { getServerSession } from 'next-auth/next';
import { NextRequest, NextResponse } from 'next/server';

const IVA_VALID = new Set([
  'Responsable Inscripto',
  'Monotributista',
  'Exento',
  'Consumidor Final',
  'No Responsable',
]);

function isValidCuitCuil(cuit: string): boolean {
  if (!/^\d{11}$/.test(cuit)) return false;
  const multipliers = [5, 4, 3, 2, 7, 6, 5, 4, 3, 2];
  const digits = cuit.split('').map(Number);
  const check = digits
    .slice(0, 10)
    .reduce((acc, digit, idx) => acc + digit * multipliers[idx], 0);
  let verif = 11 - (check % 11);
  if (verif === 11) verif = 0;
  if (verif === 10) verif = 9;
  return digits[10] === verif;
}

function cellStr(value: ExcelJS.CellValue): string {
  if (value === null || value === undefined) return '';
  if (typeof value === 'object' && 'text' in (value as object)) {
    return String((value as { text: string }).text ?? '').trim();
  }
  return String(value).trim();
}

export async function POST(request: NextRequest) {
  const session = await getServerSession(authOptions);
  if (!session) {
    return NextResponse.json({ error: 'No autorizado' }, { status: 401 });
  }

  // Load companies from DB (case-insensitive name lookup)
  const companiesFromDb = await drizzleDb.select().from(company);
  const companyMap: Record<string, number> = {};
  for (const c of companiesFromDb) {
    companyMap[c.name.toUpperCase().trim()] = c.id;
  }

  let formData: FormData;
  try {
    formData = await request.formData();
  } catch {
    return NextResponse.json(
      { error: 'No se pudo leer el formulario.' },
      { status: 400 },
    );
  }

  const file = formData.get('file') as File | null;
  if (!file) {
    return NextResponse.json(
      { error: 'No se proporcionó archivo.' },
      { status: 400 },
    );
  }

  const buffer = Buffer.from(await file.arrayBuffer());
  const workbook = new ExcelJS.Workbook();

  try {
    await workbook.xlsx.load(buffer);
  } catch {
    return NextResponse.json(
      { error: 'El archivo no es un Excel válido (.xlsx).' },
      { status: 400 },
    );
  }

  const sheet = workbook.worksheets[0];
  if (!sheet) {
    return NextResponse.json(
      { error: 'El archivo no tiene ninguna hoja.' },
      { status: 400 },
    );
  }

  // Detect header row → build column-key map
  const headerRow = sheet.getRow(1);
  const colMap: Record<string, number> = {};
  headerRow.eachCell((cell, colNumber) => {
    const key = cellStr(cell.value)
      .toLowerCase()
      .replace(/\s*\*/g, '')
      .trim();
    colMap[key] = colNumber;
  });

  const col = (row: ExcelJS.Row, key: string): string => {
    const idx = colMap[key] ?? -1;
    if (idx === -1) return '';
    return cellStr(row.getCell(idx).value);
  };

  type ImportRow = {
    rowNumber: number;
    name: string;
    email: string | null;
    phone: string | null;
    cuit_cuil: string | null;
    iva_condition: string | null;
    cbu_cvu: string | null;
    company_id: number;
  };

  const toInsert: ImportRow[] = [];
  const skipped: { row: number; reason: string }[] = [];

  sheet.eachRow((row, rowNumber) => {
    if (rowNumber === 1) return; // header

    const nombre = col(row, 'nombre');
    if (!nombre) return; // blank row – skip silently

    const empresa = col(row, 'empresa').toUpperCase().trim();
    const companyId = companyMap[empresa];

    if (!companyId) {
      const validNames = Object.keys(companyMap).join(', ');
      skipped.push({
        row: rowNumber,
        reason: `Empresa "${col(row, 'empresa') || '(vacío)'}" inválida. Usá: ${validNames}.`,
      });
      return;
    }

    const rawCuit = col(row, 'cuit/cuil').replace(/\D/g, '');
    if (rawCuit && !isValidCuitCuil(rawCuit)) {
      skipped.push({
        row: rowNumber,
        reason: `CUIT/CUIL "${rawCuit}" inválido (dígito verificador incorrecto).`,
      });
      return;
    }

    const rawIva = col(row, 'condición iva') || col(row, 'condicion iva');
    const ivaCondition =
      rawIva && IVA_VALID.has(rawIva) ? rawIva : rawIva || null;

    toInsert.push({
      rowNumber,
      name: nombre,
      email: col(row, 'email') || null,
      phone: col(row, 'teléfono') || col(row, 'telefono') || null,
      cuit_cuil: rawCuit || null,
      iva_condition: ivaCondition,
      cbu_cvu: col(row, 'cbu/cvu').replace(/\D/g, '') || null,
      company_id: companyId,
    });
  });

  if (toInsert.length === 0) {
    return NextResponse.json({
      inserted: 0,
      skipped,
      message: 'No se encontraron filas válidas para importar.',
    });
  }

  // ── Duplicate pre-check ────────────────────────────────────
  // 1) By CUIT/CUIL (authoritative dedup key when present)
  const cuitsToCheck = toInsert
    .map((r) => r.cuit_cuil)
    .filter((c): c is string => !!c);

  const existingCuits = new Set<string>();
  if (cuitsToCheck.length > 0) {
    const rows = await drizzleDb
      .select({ cuitCuil: customers.cuitCuil })
      .from(customers)
      .where(inArray(customers.cuitCuil, cuitsToCheck));
    rows.forEach((r) => r.cuitCuil && existingCuits.add(r.cuitCuil));
  }

  // 2) For rows WITHOUT cuit, dedup by (lower(name), company_id)
  const noCuitRows = toInsert.filter((r) => !r.cuit_cuil);
  const existingNameCompanyKeys = new Set<string>();
  if (noCuitRows.length > 0) {
    const existingNamed = await drizzleDb
      .select({ name: customers.name, companyId: customers.companyId })
      .from(customers)
      .where(
        or(
          ...noCuitRows.map((r) =>
            and(
              eq(sql`lower(${customers.name})`, r.name.toLowerCase()),
              eq(customers.companyId, r.company_id),
            ),
          ),
        ),
      );
    existingNamed.forEach((r) =>
      existingNameCompanyKeys.add(`${r.name?.toLowerCase()}|${r.companyId}`),
    );
  }

  // ── Insert (skip duplicates) ────────────────────────────────
  let inserted = 0;
  const errors: { row: number; reason: string }[] = [];

  for (const item of toInsert) {
    // Check CUIT duplicate
    if (item.cuit_cuil && existingCuits.has(item.cuit_cuil)) {
      errors.push({
        row: item.rowNumber,
        reason: `Ya existe un proveedor con CUIT/CUIL ${item.cuit_cuil}.`,
      });
      continue;
    }

    // Check name+company duplicate (only for rows without CUIT)
    if (!item.cuit_cuil) {
      const key = `${item.name.toLowerCase()}|${item.company_id}`;
      if (existingNameCompanyKeys.has(key)) {
        errors.push({
          row: item.rowNumber,
          reason: `Ya existe "${item.name}" en la misma empresa (sin CUIT para distinguirlos).`,
        });
        continue;
      }
    }

    try {
      await drizzleDb.insert(customers).values({
        name: item.name,
        email: item.email,
        phone: item.phone,
        cuitCuil: item.cuit_cuil,
        ivaCondition: item.iva_condition ?? 'Pendiente',
        cbuCvu: item.cbu_cvu,
        imageUrl: '/customers/default.png',
        companyId: item.company_id,
      });
      inserted++;
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : String(err);
      // Unique constraint on cuit_cuil
      if (msg.includes('unique') || msg.includes('duplicate')) {
        errors.push({
          row: item.rowNumber,
          reason: `CUIT/CUIL duplicado (${item.cuit_cuil}).`,
        });
      } else {
        errors.push({ row: item.rowNumber, reason: msg });
      }
    }
  }

  return NextResponse.json({
    inserted,
    skipped: [...skipped, ...errors],
    message: `Se importaron ${inserted} proveedores.`,
  });
}
