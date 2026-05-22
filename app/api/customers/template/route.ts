import { authOptions } from '@/authOptions';
import ExcelJS from 'exceljs';
import { getServerSession } from 'next-auth/next';
import { NextResponse } from 'next/server';

const IVA_OPTIONS = [
  'Responsable Inscripto',
  'Monotributista',
  'Exento',
  'Consumidor Final',
  'No Responsable',
];

const EMPRESA_OPTIONS = ['FODECO', 'CAMARCO'];

export async function GET() {
  const session = await getServerSession(authOptions);
  if (!session) {
    return NextResponse.json({ error: 'No autorizado' }, { status: 401 });
  }

  const workbook = new ExcelJS.Workbook();
  workbook.creator = 'CAMARCO';
  workbook.created = new Date();

  // ── Main sheet ──────────────────────────────────────────────
  const sheet = workbook.addWorksheet('Proveedores');

  sheet.columns = [
    { header: 'Nombre *', key: 'nombre', width: 38 },
    { header: 'Email', key: 'email', width: 32 },
    { header: 'Teléfono', key: 'telefono', width: 18 },
    { header: 'CUIT/CUIL', key: 'cuit_cuil', width: 18 },
    { header: 'Condición IVA', key: 'iva_condition', width: 26 },
    { header: 'CBU/CVU', key: 'cbu_cvu', width: 28 },
    { header: 'Empresa *', key: 'empresa', width: 14 },
  ];

  // Header style
  const headerRow = sheet.getRow(1);
  headerRow.height = 22;
  headerRow.eachCell((cell) => {
    cell.font = { bold: true, color: { argb: 'FFFFFFFF' }, size: 11 };
    cell.fill = {
      type: 'pattern',
      pattern: 'solid',
      fgColor: { argb: 'FF1E3A5F' },
    };
    cell.alignment = { vertical: 'middle', horizontal: 'center' };
    cell.border = {
      bottom: { style: 'thin', color: { argb: 'FFAAAAAA' } },
    };
  });

  // Example row
  sheet.addRow({
    nombre: 'Empresa Ejemplo S.A.',
    email: 'contacto@empresa.com',
    telefono: '0351-4123456',
    cuit_cuil: '30123456789',
    iva_condition: 'Responsable Inscripto',
    cbu_cvu: '0000003100012345678901',
    empresa: 'CAMARCO',
  });

  const exampleRow = sheet.getRow(2);
  exampleRow.eachCell((cell) => {
    cell.fill = {
      type: 'pattern',
      pattern: 'solid',
      fgColor: { argb: 'FFE8F4FD' },
    };
    cell.font = { italic: true, color: { argb: 'FF555555' }, size: 10 };
  });

  // Data validations for rows 2–2000
  for (let i = 2; i <= 2000; i++) {
    sheet.getCell(`E${i}`).dataValidation = {
      type: 'list',
      allowBlank: true,
      showErrorMessage: true,
      errorTitle: 'Valor inválido',
      error: `Usá uno de: ${IVA_OPTIONS.join(', ')}`,
      formulae: [`"${IVA_OPTIONS.join(',')}"`],
    };
    sheet.getCell(`G${i}`).dataValidation = {
      type: 'list',
      allowBlank: false,
      showErrorMessage: true,
      errorTitle: 'Empresa requerida',
      error: `Elegí ${EMPRESA_OPTIONS.join(' o ')}`,
      formulae: [`"${EMPRESA_OPTIONS.join(',')}"`],
    };
  }

  // Freeze header row
  sheet.views = [{ state: 'frozen', ySplit: 1 }];

  // ── Instructions sheet ────────────────────────────────────
  const info = workbook.addWorksheet('Instrucciones');
  info.getColumn('A').width = 70;

  const instructions = [
    ['INSTRUCCIONES DE IMPORTACIÓN DE PROVEEDORES'],
    [''],
    ['Completá la hoja "Proveedores" con los datos de cada proveedor.'],
    ['La fila 2 es un ejemplo — podés reemplazarla o eliminarla.'],
    [''],
    ['COLUMNAS:'],
    ['  Nombre *       → Razón social o nombre. OBLIGATORIO.'],
    ['  Email          → Correo electrónico (opcional).'],
    ['  Teléfono       → Número de teléfono (opcional).'],
    ['  CUIT/CUIL      → 11 dígitos sin guiones ni espacios (opcional).'],
    ['  Condición IVA  → Elegí de la lista desplegable (opcional).'],
    ['  CBU/CVU        → 22 dígitos (opcional).'],
    ['  Empresa *      → FODECO o CAMARCO. OBLIGATORIO.'],
    [''],
    ['NOTAS:'],
    ['  • Los proveedores con CUIT/CUIL duplicado serán omitidos.'],
    ['  • Las filas sin Nombre serán ignoradas.'],
    ['  • El CUIT/CUIL es validado con el dígito verificador.'],
  ];

  instructions.forEach(([text], idx) => {
    const row = info.getRow(idx + 1);
    const cell = row.getCell(1);
    cell.value = text;
    if (idx === 0) {
      cell.font = { bold: true, size: 13, color: { argb: 'FF1E3A5F' } };
    } else if (text?.startsWith('  ')) {
      cell.font = { size: 10, color: { argb: 'FF333333' } };
    } else if (text && !text.startsWith(' ')) {
      cell.font = { bold: true, size: 10 };
    }
  });

  const buffer = await workbook.xlsx.writeBuffer();

  return new NextResponse(buffer as Buffer, {
    headers: {
      'Content-Type':
        'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
      'Content-Disposition':
        'attachment; filename="template_proveedores.xlsx"',
    },
  });
}
