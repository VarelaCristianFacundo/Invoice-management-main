'use server';
// import { signIn } from 'next-auth/react';
import { revalidatePath } from 'next/cache';
import { z } from 'zod';
import { and, eq, sql } from 'drizzle-orm';
import { getServerSession } from 'next-auth/next';
import { authOptions } from '@/authOptions';
import { drizzleDb, type Tx } from './drizzle/db';
import {
  areaFunds,
  areas,
  budgetAllocations,
  budgets,
  customers,
  invoices,
  programs,
} from './drizzle/schema';
import { sendEmail } from './SendMail';
import { isValidCuitCuil } from './utils';

const FormSchema = z.object({
  id: z.string(),
  customerId: z.string({
    invalid_type_error: 'Por favor selecciona un proveedor.',
  }),
  amount: z.coerce
    .number()
    .gt(0, { message: 'Por favor ingresa un monto mayor a $0.' }),
  status: z.enum(['presentado', 'aprobado', 'pagado', 'rechazado'], {
    invalid_type_error: 'Por favor selecciona un estado de factura.',
  }),
  date: z.string(),
  invoice_number: z.string().regex(/^\d{5}-\d{8}$/, {
    message: 'Formato de número de factura inválido. Ej: 00000-00000000',
  }),
  issue_date: z.string().regex(/^\d{4}-\d{2}-\d{2}$/, {
    message: 'Fecha inválida (debe ser YYYY-MM-DD)',
  }),
});
const ivaConditionValues = [
  'Responsable Inscripto',
  'Monotributista',
  'Exento',
  'Consumidor Final',
  'No Responsable',
];

const emptyToUndefined = (val: unknown) => {
  if (typeof val !== 'string') return val;
  const trimmed = val.trim();
  return trimmed === '' ? undefined : trimmed;
};

const CustomerUpdateSchemaLoose = z.object({
  id: z.string().uuid({ message: 'The ID must be a valid UUID.' }),
  name: z.string().min(1, { message: 'Please enter a valid name.' }),

  email: z.preprocess(
    emptyToUndefined,
    z.string().email({ message: 'Please enter a valid email.' }).optional(),
  ),

  cuit_cuil: z.preprocess(
    emptyToUndefined,
    z
      .string()
      .regex(/^\d{11}$/, { message: 'CUIT/CUIL must have 11 digits.' })
      .optional(),
  ),

  cbu_cvu: z.preprocess(
    emptyToUndefined,
    z
      .string()
      .regex(/^\d{22}$/, { message: 'CBU/CVU must have 22 digits.' })
      .optional(),
  ),

  phone: z.preprocess(
    emptyToUndefined,
    z
      .string()
      .min(7, { message: 'Phone must have at least 7 digits.' })
      .max(15, { message: 'Phone must not exceed 15 digits.' })
      .regex(/^\d+$/, { message: 'Phone must contain only numbers.' })
      .optional(),
  ),

  iva_condition: z.preprocess(emptyToUndefined, z.string().optional()),
  company_id: z.coerce.number().optional(),
});

const CreateInvoice = FormSchema.extend({
  customerId: z.string(),
  amount: z.number(),
  status: z.string(),
  areaId: z.string(),
  year: z.number(),
  budgetAllocationId: z.string(),
  file: z.string(),
  company_id: z.number(),
  contable_item_id: z.coerce.number().optional(),
  observations: z.string().optional(),
  invoice_number: z.string().regex(/^\d{5}-\d{8}$/, {
    message: 'Formato de número de factura inválido.',
  }),
  issue_date: z
    .string()
    .regex(/^\d{4}-\d{2}-\d{2}$/, { message: 'Fecha inválida (YYYY-MM-DD)' }),
}).omit({ id: true, date: true });

export type State = {
  errors?: {
    customerId?: string[];
    amount?: string[];
    status?: string[];
  };
  message?: string | null;
};

export type CustomerState = {
  errors?: {
    name?: string[];
    email?: string[];
  };
  message?: string | null;
};

// Returns true if the role is an area-scoped user (not admin/contable/legacy).
function isAreaScopedRole(role: string | null | undefined): boolean {
  if (!role) return false;
  return (
    role.startsWith('usuario_') &&
    role !== 'usuario' &&
    role !== 'usuario_presupuestos' &&
    role !== 'usuario_contable'
  );
}

export async function createInvoice(formData: {
  customerId: string;
  amount: number;
  status: 'presentado' | 'aprobado' | 'pagado' | 'rechazado';
  areaId: string;
  year: number;
  budgetAllocationId: string;
  file: string;
  company_id: number;
  observations?: string;
  invoice_number: string;
  issue_date: string;
  contable_item_id?: number;
}) {
  const session = await getServerSession(authOptions);
  if (!session?.user) return { success: false, message: 'No autorizado.' };

  // Area-scoped users can only submit invoices for their own area.
  if (isAreaScopedRole(session.user.role)) {
    if (!session.user.area_id || session.user.area_id !== formData.areaId) {
      return { success: false, message: 'Solo podés cargar facturas de tu propia área.' };
    }
  }

  const validatedFields = CreateInvoice.safeParse(formData);

  if (!validatedFields.success) {
    return {
      success: false,
      errors: validatedFields.error.flatten().fieldErrors,
      message: 'Faltan campos. No se pudo crear la factura.',
    };
  }

  const {
    customerId,
    amount,
    status,
    areaId,
    year,
    budgetAllocationId,
    file,
    company_id,
    observations,
    invoice_number,
    issue_date,
    contable_item_id,
  } = validatedFields.data;

  // Check for duplicated invoice number per customer (proveedor)
  const duplicate = await drizzleDb
    .select({ id: invoices.id })
    .from(invoices)
    .where(
      and(
        eq(invoices.invoiceNumber, invoice_number),
        eq(invoices.customerId, customerId),
      ),
    )
    .limit(1);
  if (duplicate.length > 0) {
    return {
      success: false,
      message: 'Factura cargada previamente. El número de factura ya existe para este proveedor.',
    };
  }

  const amountInCents = amount * 1;

  try {
    await drizzleDb.insert(invoices).values({
      customerId,
      amount: String(amountInCents),
      status,
      date: sql`CURRENT_DATE`,
      areaId,
      year,
      budgetAllocationId,
      file,
      companyId: company_id,
      observations,
      invoiceNumber: invoice_number,
      issueDate: issue_date,
      contableItemId: contable_item_id ?? null,
    });

    await sendInvoiceEmail(customerId, amountInCents, status, issue_date);
    return {
      success: true,
      message: 'Factura creada satisfactoriamente.',
    };
  } catch (error) {
    console.error('Database Error:', error);
    return {
      success: false,
      message: 'Error de base de datos: No se pudo crear la factura.',
    };
  }
}
export async function updateAreaFunds(
  updates: {
    areaId: string;
    amount: number;
    year: number;
    half: number;
  }[],
) {
  try {
    for (const { areaId, amount, year, half } of updates) {
      if (isNaN(amount) || amount < 0) {
        console.warn(`Monto inválido para el área ${areaId}: ${amount}`);
        continue;
      }
      console.debug(`Actualizando fondos para el área ${areaId}: ${amount}`);
      await drizzleDb
        .insert(areaFunds)
        .values({
          areaId,
          allocatedFunds: String(amount),
          year,
          half,
        })
        .onConflictDoUpdate({
          target: [areaFunds.areaId, areaFunds.year, areaFunds.half],
          set: { allocatedFunds: String(amount) },
        });
    }
    console.log('Fondos actualizados exitosamente');
  } catch (error) {
    console.error('Error al actualizar los fondos de las áreas:', error);
    throw new Error('No se pudo actualizar los fondos de las áreas.');
  }
}

export async function addCustomer(formData: {
  name: string;
  email?: string | null;
  cuit_cuil?: string | null;
  cbu_cvu?: string | null;
  phone?: string | null;
  iva_condition?: string | null;
  company_id: number;
  mode?: 'strict' | 'loose';
}) {
  const schema =
    formData.mode === 'loose'
      ? CustomerFormSchemaLoose
      : CustomerFormSchemaStrict;
  const validatedFields = schema.safeParse(formData);

  if (!validatedFields.success) {
    return {
      errors: validatedFields.error.flatten().fieldErrors,
      message:
        'Falla en agregar proveedor. Algún campo es inválido o está faltante.',
    };
  }
  if (
    validatedFields.data.cuit_cuil &&
    !isValidCuitCuil(validatedFields.data.cuit_cuil)
  ) {
    return {
      errors: {
        cuit_cuil: ['CUIT/CUIL inválido. Revise el número ingresado.'],
      },
      message: 'Falla en agregar proveedor. CUIT/CUIL inválido.',
    };
  }
  const { name, email, cuit_cuil, cbu_cvu, phone, iva_condition, company_id } =
    validatedFields.data;

  try {
    await drizzleDb.insert(customers).values({
      name,
      email: email ?? null,
      cuitCuil: cuit_cuil ?? null,
      cbuCvu: cbu_cvu ?? null,
      phone: phone ?? null,
      ivaCondition: iva_condition ?? 'Pendiente',
      imageUrl: '/customers/placeholder.png',
      companyId: company_id || 1,
    });

    revalidatePath('/dashboard/customers');
    revalidatePath('/dashboard/invoices/create');
    return { success: true, message: 'Proveedor agregado exitosamente.' };
  } catch (error) {
    console.error('Database Error:', error);
    return {
      success: false,
      message: 'Error de base de datos: No se pudo agregar el proveedor.',
    };
  }
}

export async function updateInvoice(
  id: string,
  formData: FormData,
  company_id: number = 0,
) {
  const session = await getServerSession(authOptions);
  if (!session?.user) return { success: false, message: 'No autorizado.' };
  if (isAreaScopedRole(session.user.role)) {
    return { success: false, message: 'No tenés permisos para editar facturas.' };
  }

  // Normalizar el monto para aceptar "," como separador decimal
  const normalizeMoneyInput = (raw: string): string => {
    const value = raw.trim().replace(/\s+/g, '');
    if (!value) return '';

    const hasComma = value.includes(',');
    const hasDot = value.includes('.');

    if (hasComma && hasDot) {
      const lastComma = value.lastIndexOf(',');
      const lastDot = value.lastIndexOf('.');
      const decimalSep = lastComma > lastDot ? ',' : '.';
      const thousandsSep = decimalSep === ',' ? '.' : ',';
      const noThousands = value.split(thousandsSep).join('');
      return decimalSep === ',' ? noThousands.replace(',', '.') : noThousands;
    }

    if (hasComma) return value.replace(',', '.');
    return value;
  };

  // Obtener el valor del campo "pdfFile"
  let file = '';
  const pdfVal = formData.get('pdfFile');

  if (pdfVal instanceof Blob) {
    // Si se envió un nuevo archivo, lo convertimos a base64 con prefijo
    const arrayBuffer = await pdfVal.arrayBuffer();
    file =
      'data:application/pdf;base64,' +
      Buffer.from(arrayBuffer).toString('base64');
  } else if (typeof pdfVal === 'string' && pdfVal.trim() !== '') {
    // Si se recibió una cadena, nos aseguramos de que tenga el prefijo
    file = pdfVal.startsWith('data:application/pdf;base64,')
      ? pdfVal
      : 'data:application/pdf;base64,' + pdfVal;
  }

  // Si file sigue vacío, usamos el valor enviado en el campo oculto "oldPdfFile"
  if (!file || file === 'data:application/pdf;base64,') {
    const oldPdf = formData.get('oldPdfFile');
    if (typeof oldPdf === 'string' && oldPdf.trim() !== '') {
      file = oldPdf;
    }
  }
  const contable_item_id = formData.get('contable_item_id') || null;
  const invoice_number = (formData.get('invoice_number') as string) || null;
  const rawIssueDate = formData.get('issue_date') as string;
  const issue_date =
    rawIssueDate && rawIssueDate.trim().length > 0 ? rawIssueDate : null;

  // Extraer datos del formulario y normalizar el monto
  const amountRaw = (formData.get('amount') as string) || '0';
  const normalizedAmount = normalizeMoneyInput(amountRaw);
  const data = {
    customerId: formData.get('customerId') as string,
    amount: parseFloat(normalizedAmount),
    newStatus: formData.get('status') as string,
    observations: (formData.get('observations') as string) || '',
    invoice_number,
    issue_date,
  };

  console.log('Updating invoice id:', id);
  console.log('FormData:', formData);
  console.log('Normalized amount:', normalizedAmount, 'Parsed:', data.amount);

  // Avoid duplicated invoice numbers when updating
  if (invoice_number) {
    const duplicate = await drizzleDb
      .select({ id: invoices.id })
      .from(invoices)
      .where(
        and(
          eq(invoices.invoiceNumber, invoice_number),
          eq(invoices.customerId, data.customerId),
          sql`${invoices.id} <> ${id}`,
        ),
      )
      .limit(1);
    if (duplicate.length > 0) {
      return {
        success: false,
        message: 'Factura cargada previamente. El número de factura ya existe para este proveedor.',
      };
    }
  }

  try {
    const invoice = await getInvoiceData(id);
    const currentStatus = invoice.status;
    const currentAmount = invoice.amount;

    const fundsAvailable = await checkProjectFundsByInoviceId(
      parseFloat(formData.get('amount') as string),
      id,
    );

    if (!fundsAvailable && data.newStatus === 'aprobado') {
      return {
        success: false,
        message: 'Fondos Insuficientes para aprobar la factura.',
      };
    } else {
      if (currentStatus !== data.newStatus && invoice.budgetAllocationId) {
        const fundAmount =
          data.newStatus === 'pending'
            ? currentAmount
            : parseFloat(formData.get('amount') as string);
        await updateAvailableAreaFounds(
          fundAmount,
          invoice.budgetAllocationId,
          data.newStatus,
        );
      }
    }

    await drizzleDb
      .update(invoices)
      .set({
        customerId: data.customerId,
        amount: String(data.amount),
        status: data.newStatus,
        file,
        companyId: company_id || invoice.company_id,
        observations: data.observations,
        invoiceNumber: data.invoice_number,
        issueDate: data.issue_date,
        contableItemId: contable_item_id ? Number(contable_item_id) : null,
      })
      .where(eq(invoices.id, id));

    revalidatePath('/dashboard/invoices');

    return {
      success: true,
      message: 'Factura actualizada exitosamente.',
    };
  } catch (error) {
    console.error('Database Error:', error);
    return {
      success: false,
      message: 'Error de base de datos: No se pudo actualizar la factura.',
    };
  }
}

export async function createProject(
  project_name: string,
  year: number,
  company_id: number,
) {
  try {
    const [{ id }] = await drizzleDb
      .insert(budgets)
      .values({ projectName: project_name, year, companyId: company_id })
      .returning({ id: budgets.id });

    return {
      success: true,
      projectId: id,
      message: 'Proyecto creado satisfactoriamente.',
    };
  } catch (error) {
    console.error('Error al crear el proyecto:', error);
    return {
      success: false,
      message:
        'Error de base de datos: No se pudo crear el proyecto en presupuestos.',
    };
  }
}

export async function createBudgetAllocation(
  project_id: string,
  area_id: string,
  allocated_amount: number,
  half: number,
  program: string,
  year: number,
) {
  try {
    const existing = await drizzleDb
      .select({ id: budgetAllocations.id })
      .from(budgetAllocations)
      .where(
        and(
          eq(budgetAllocations.areaId, area_id),
          eq(budgetAllocations.year, year),
          eq(budgetAllocations.half, half),
        ),
      )
      .limit(1);

    if (existing.length > 0) {
      return {
        success: false,
        message: `Ya existe un proyecto asignado a esta área para el ${half}° semestre de ${year}. Cada área sólo puede tener un proyecto por semestre.`,
      };
    }

    await drizzleDb.insert(budgetAllocations).values({
      projectId: project_id,
      areaId: area_id,
      year,
      allocatedAmount: String(allocated_amount),
      executedAmount: '0',
      half,
      program,
    });

    return {
      success: true,
      message: 'Asignación de proyecto creada exitosamente.',
    };
  } catch (error) {
    console.error('Error al crear la asignación del proyecto:', error);
    return {
      success: false,
      message:
        'Error de base de datos: No se pudo crear la asignación del presupuesto.',
    };
  }
}

export async function createBudget({
  id,
  projectId,
  areaId,
  allocated_amount,
  year,
  half,
  program,
  company_id,
}: {
  id: string;
  projectId: string;
  areaId: string;
  allocated_amount: number;
  year: number;
  half: number;
  program: string;
  company_id: string;
}) {
  try {
    if (id === 'new') {
      const existing = await drizzleDb
        .select({ id: budgetAllocations.id })
        .from(budgetAllocations)
        .where(
          and(
            eq(budgetAllocations.areaId, areaId),
            eq(budgetAllocations.year, year),
            eq(budgetAllocations.half, half),
          ),
        )
        .limit(1);

      if (existing.length > 0) {
        return {
          success: false,
          message: `Ya existe un proyecto asignado a esta área para el ${half}° semestre de ${year}. Cada área sólo puede tener un proyecto por semestre.`,
        };
      }

      const [{ id: newProjectId }] = await drizzleDb
        .insert(budgets)
        .values({
          projectName: projectId,
          year,
          companyId: Number(company_id),
        })
        .returning({ id: budgets.id });

      await drizzleDb.insert(budgetAllocations).values({
        projectId: newProjectId,
        areaId,
        allocatedAmount: String(allocated_amount),
        executedAmount: '0',
        program,
        half,
        year,
      });

      return {
        success: true,
        message: 'Proyecto y área asignados exitosamente.',
      };
    } else {
      await drizzleDb
        .update(budgets)
        .set({
          projectName: projectId,
          year,
          companyId: Number(company_id),
        })
        .where(eq(budgets.id, id));

      await drizzleDb
        .update(budgetAllocations)
        .set({
          allocatedAmount: String(allocated_amount),
          executedAmount: '0',
          program,
          half,
          year,
        })
        .where(
          and(
            eq(budgetAllocations.projectId, projectId),
            eq(budgetAllocations.areaId, areaId),
          ),
        );

      return {
        success: true,
        message: 'Proyecto y asignación actualizados exitosamente.',
      };
    }
  } catch (error) {
    console.error('Database Error:', error);
    return {
      success: false,
      message: 'No se pudo crear o actualizar el proyecto.',
    };
  }
}

export async function updateBudget(
  id: string,
  formData: FormData,
  _changedBy: string,
) {
  const session = await getServerSession(authOptions);
  if (!session?.user) return { success: false, message: 'No autorizado.' };
  if (isAreaScopedRole(session.user.role)) {
    return { success: false, message: 'No tenés permisos para editar proyectos.' };
  }

  const year = Number(formData.get('year'));
  const projectName = (formData.get('project_name') ?? '').toString().trim();
  const allocatedAmount = Number(formData.get('allocated_amount') ?? 0);
  const amount = Number(formData.get('amount') ?? 0);
  const status = (formData.get('status') ?? 'pending').toString();

  if (!year || !projectName) {
    return {
      success: false,
      message: 'Datos inválidos: año y nombre de proyecto son obligatorios.',
    };
  }

  try {
    await drizzleDb.transaction(async (tx: Tx) => {
      await tx
        .update(budgets)
        .set({ year, projectName, status })
        .where(eq(budgets.id, id));

      await tx
        .update(budgetAllocations)
        .set({
          allocatedAmount: String(allocatedAmount),
          executedAmount: String(amount),
        })
        .where(eq(budgetAllocations.projectId, id));
    });

    return {
      success: true,
      message: 'Proyecto actualizado exitosamente.',
    };
  } catch (error) {
    console.error('Database Error updating budget:', error);
    return {
      success: false,
      message: 'No se pudo actualizar el proyecto.',
    };
  }
}

export async function deleteBudget(id: string) {
  const session = await getServerSession(authOptions);
  if (!session?.user) return { success: false, message: 'No autorizado.' };
  if (isAreaScopedRole(session.user.role)) {
    return { success: false, message: 'No tenés permisos para eliminar proyectos.' };
  }

  try {
    await drizzleDb.delete(budgets).where(eq(budgets.id, id));
    revalidatePath('/dashboard/budgets');
    return { success: true, message: 'Proyecto eliminado exitosamente.' };
  } catch (error) {
    console.error(error);
    return { success: false, message: 'No se pudo eliminar el proyecto.' };
  }
}

export async function updateCustomer(
  id: string,
  formData: {
    name: string;
    email?: string | null;
    cuit_cuil?: string | null;
    cbu_cvu?: string | null;
    phone?: string | null;
    iva_condition?: string | null;
    company_id?: number;
  },
) {
  const session = await getServerSession(authOptions);
  if (!session?.user) return { success: false, message: 'No autorizado.' };
  if (isAreaScopedRole(session.user.role)) {
    return { success: false, message: 'No tenés permisos para editar proveedores.' };
  }

  const validatedFields = CustomerUpdateSchemaLoose.safeParse({
    ...formData,
    id,
  });

  if (!validatedFields.success) {
    return {
      success: false,
      errors: validatedFields.error.flatten().fieldErrors,
      message:
        'Falla en actualizar proveedor. Algún campo es inválido o está faltante.',
    };
  }

  if (
    validatedFields.data.cuit_cuil &&
    !isValidCuitCuil(validatedFields.data.cuit_cuil)
  ) {
    return {
      success: false,
      errors: {
        cuit_cuil: ['CUIT/CUIL inválido. Revise el número ingresado.'],
      },
      message: 'Falla en actualizar proveedor. CUIT/CUIL inválido.',
    };
  }

  const { name, email, cuit_cuil, cbu_cvu, phone, iva_condition, company_id } =
    validatedFields.data;

  try {
    const updates: Record<string, unknown> = {
      name,
      email: email ?? null,
      cuitCuil: cuit_cuil ?? null,
      cbuCvu: cbu_cvu ?? null,
      phone: phone ?? null,
      ivaCondition: iva_condition ?? 'Pendiente',
    };
    if (company_id != null) {
      updates.companyId = company_id;
    }

    const result = await drizzleDb
      .update(customers)
      .set(updates)
      .where(eq(customers.id, id))
      .returning({ id: customers.id });

    if (result.length === 0) {
      return {
        success: false,
        message: 'No se encontró el proveedor para actualizar.',
      };
    }

    revalidatePath('/dashboard/customers');
    revalidatePath('/dashboard/invoices/create');
    return { success: true, message: 'Proveedor actualizado exitosamente.' };
  } catch (error) {
    console.error('Database Error:', error);
    return {
      success: false,
      message: 'Error de base de datos: No se pudo actualizar el proveedor.',
    };
  }
}

export async function deleteInvoice(id: string) {
  const session = await getServerSession(authOptions);
  if (!session?.user) return { success: false, message: 'No autorizado.' };
  if (isAreaScopedRole(session.user.role)) {
    return { success: false, message: 'No tenés permisos para eliminar facturas.' };
  }

  try {
    const check = await drizzleDb
      .select({ status: invoices.status })
      .from(invoices)
      .where(eq(invoices.id, id))
      .limit(1);
    if (check[0]?.status === 'pagado' || check[0]?.status === 'aprobado') {
      return {
        success: false,
        message: 'No se puede eliminar una factura aprobada o pagada.',
      };
    }

    await drizzleDb.delete(invoices).where(eq(invoices.id, id));
    revalidatePath('/dashboard/invoices');
    return { success: true, message: 'Factura eliminada.' };
  } catch (error) {
    console.error('Database Error:', error);
    return {
      success: false,
      message: 'Error en la base de datos: No se pudo eliminar la factura.',
    };
  }
}

export async function checkProjectFundsByInoviceId(
  amount: number,
  invoice_id: string,
): Promise<boolean> {
  try {
    const rows = await drizzleDb
      .select({
        executed: budgetAllocations.executedAmount,
        allocated: budgetAllocations.allocatedAmount,
      })
      .from(budgetAllocations)
      .innerJoin(invoices, eq(invoices.budgetAllocationId, budgetAllocations.id))
      .where(eq(invoices.id, invoice_id))
      .limit(1);

    if (rows.length === 0) {
      throw new Error('No se encontraron registros coincidentes');
    }
    return Number(rows[0].allocated) > amount + Number(rows[0].executed);
  } catch (error) {
    console.error('Error checking project funds:', error);
    return false;
  }
}
// export async function authenticate(
//   prevState: string | undefined,
//   formData: FormData,
// ) {
//   try {
//     const res = await signIn('credentials', {
//       redirect: false,
//       email: formData.get('email') as string,
//       password: formData.get('password') as string,
//     });

//     if (res?.error) {
//       console.error('Authentication failed:', res.error);
//       switch (res.error) {
//         case 'CredentialsSignin':
//           return 'Invalid credentials.';
//         default:
//           return 'Something went wrong. Please try again.';
//       }
//     }

//     // Redirige al dashboard o realiza otras acciones
//     redirect('/dashboard');
//   } catch (error) {
//     console.error('Unexpected error during authentication:', error);
//     throw new Error('Authentication process failed.');
//   }
// }

export async function sendBudgetEmail(
  year: string,
  areaId: string,
  program: string,
  project: string,
  customerId: string,
  concept: string,
  amount: number,
  status: string,
) {
  try {
    const [{ areaName }] = await drizzleDb
      .select({ areaName: areas.name })
      .from(areas)
      .where(eq(areas.id, areaId))
      .limit(1);
    const [{ customerName }] = await drizzleDb
      .select({ customerName: customers.name })
      .from(customers)
      .where(eq(customers.id, customerId))
      .limit(1);

    const to = 'jmaragames@gmail.com';
    const body = `Nuevo Presupuesto Creado:\n\nAño: ${year}\nÁrea: ${areaName}\nPrograma: ${program}\nProyecto: ${project}\nCliente: ${customerName}\nConcepto: ${concept}\nMonto: ${amount}\nEstado: ${status}`;
    const subject = 'Nuevo Presupuesto Creado';
    const cc = 'jmaragames@gmail.com';

    await sendEmail(to, body, subject, cc);
  } catch (error) {
    console.error('Error al enviar el correo:', error);
    throw new Error('No se pudo enviar el correo.');
  }
}

export async function sendInvoiceEmail(
  customerId: string,
  amountInCents: number,
  status: string,
  date: string,
) {
  try {
    const [{ customerName }] = await drizzleDb
      .select({ customerName: customers.name })
      .from(customers)
      .where(eq(customers.id, customerId))
      .limit(1);

    const to = 'jmaragames@gmail.com';
    const body = `Nueva Factura Creada:\n\nCliente: ${customerName}\nMonto: ${amountInCents}\nEstado: ${status}\nFecha: ${date}`;
    const subject = 'Nueva Factura Creada';
    const cc = 'jmaragames@gmail.com';

    await sendEmail(to, body, subject, cc);
  } catch (error) {
    console.error('Error al enviar el correo:', error);
    throw new Error('No se pudo enviar el correo.');
  }
}

async function updateAvailableAreaFounds(
  amount: number,
  budgetAllocationId: string,
  status: string,
) {
  try {
    await drizzleDb
      .update(budgetAllocations)
      .set({
        executedAmount: sql`${budgetAllocations.executedAmount} + CASE
          WHEN ${status} = 'aprobado' THEN CAST(${amount} AS NUMERIC)
          WHEN ${status} = 'pagado' THEN 0
          ELSE -CAST(${amount} AS NUMERIC)
        END`,
      })
      .where(eq(budgetAllocations.id, budgetAllocationId));
  } catch (error) {
    console.error('Error updating budget allocation:', error);
    throw new Error('Error updating budget allocation');
  }
}

export async function getInvoiceData(invoiceId: string): Promise<{
  status: string;
  amount: number;
  year: number | null;
  half: number;
  areaId: string | null;
  budgetAllocationId: string | null;
  invoice_number: string | null;
  issue_date: string | null;
  company_id: number | null;
}> {
  const rows = await drizzleDb
    .select({
      status: invoices.status,
      amount: invoices.amount,
      year: invoices.year,
      areaId: invoices.areaId,
      budgetAllocationId: invoices.budgetAllocationId,
      half: budgetAllocations.half,
      invoice_number: invoices.invoiceNumber,
      issue_date: invoices.issueDate,
      company_id: invoices.companyId,
    })
    .from(invoices)
    .innerJoin(
      budgetAllocations,
      eq(invoices.budgetAllocationId, budgetAllocations.id),
    )
    .where(eq(invoices.id, invoiceId))
    .limit(1);

  if (rows.length === 0) {
    throw new Error(`Invoice not found with id: ${invoiceId}`);
  }

  return {
    ...rows[0],
    amount: Number(rows[0].amount),
  };
}

export async function createProgram(name: string) {
  try {
    const [{ id }] = await drizzleDb
      .insert(programs)
      .values({ name })
      .onConflictDoUpdate({ target: programs.name, set: { name } })
      .returning({ id: programs.id });
    return id;
  } catch (error) {
    console.error('Error creating program:', error);
    throw new Error('No se pudo crear u obtener el programa');
  }
}
const CustomerFormSchemaStrict = z.object({
  name: z.string().min(1, { message: 'Por favor ingrese un nombre válido.' }),
  email: z.string().email({ message: 'Por favor ingrese un email válido.' }),
  cuit_cuil: z
    .string()
    .regex(/^\d{11}$/, { message: 'CUIT/CUIL debe tener 11 dígitos.' }),
  cbu_cvu: z
    .string()
    .regex(/^\d{22}$/, { message: 'CBU/CVU debe tener 22 dígitos.' })
    .optional(),
  phone: z
    .string()
    .min(7, { message: 'El teléfono debe tener al menos 7 dígitos.' })
    .max(15, { message: 'El teléfono no debe superar los 15 dígitos.' })
    .regex(/^\d+$/, { message: 'El teléfono debe contener solo números.' }),
  iva_condition: z
    .enum(ivaConditionValues as [string, ...string[]])
    .or(z.string())
    .refine((val) => ivaConditionValues.includes(val), {
      message: 'Seleccione una condición válida.',
    }),
  company_id: z.coerce.number().min(1, { message: 'Por favor selecciona la empresa.' }),
});

const CustomerFormSchemaLoose = z.object({
  name: z.string().min(1, { message: 'Por favor ingrese un nombre válido.' }),

  email: z.preprocess(
    emptyToUndefined,
    z
      .string()
      .email({ message: 'Por favor ingrese un email válido.' })
      .optional(),
  ),

  cuit_cuil: z.preprocess(
    emptyToUndefined,
    z
      .string()
      .regex(/^\d{11}$/, { message: 'CUIT/CUIL debe tener 11 dígitos.' })
      .optional(),
  ),

  cbu_cvu: z.preprocess(
    emptyToUndefined,
    z
      .string()
      .regex(/^\d{22}$/, { message: 'CBU/CVU debe tener 22 dígitos.' })
      .optional(),
  ),

  phone: z.preprocess(
    emptyToUndefined,
    z
      .string()
      .min(7, { message: 'El teléfono debe tener al menos 7 dígitos.' })
      .max(15, { message: 'El teléfono no debe superar los 15 dígitos.' })
      .regex(/^\d+$/, { message: 'El teléfono debe contener solo números.' })
      .optional(),
  ),

  iva_condition: z.preprocess(emptyToUndefined, z.string().optional()),
  company_id: z.coerce.number().optional(),
});

export async function updateBudgetProject(
  id: string,
  formData: FormData,
  changedBy: string,
) {
  // Normalizar montos para aceptar "," como separador decimal
  const normalizeMoneyInput = (raw: unknown): number => {
    const value = String(raw).trim().replace(/\s+/g, '');
    if (!value) return 0;

    const hasComma = value.includes(',');
    const hasDot = value.includes('.');

    let normalized = value;
    if (hasComma && hasDot) {
      const lastComma = value.lastIndexOf(',');
      const lastDot = value.lastIndexOf('.');
      const decimalSep = lastComma > lastDot ? ',' : '.';
      const thousandsSep = decimalSep === ',' ? '.' : ',';
      const noThousands = value.split(thousandsSep).join('');
      normalized =
        decimalSep === ',' ? noThousands.replace(',', '.') : noThousands;
    } else if (hasComma) {
      normalized = value.replace(',', '.');
    }

    return parseFloat(normalized) || 0;
  };

  const year = Number(formData.get('year'));
  const projectName = String(formData.get('project_name') ?? '').trim();
  const allocatedAmount = normalizeMoneyInput(
    formData.get('allocated_amount') ?? '0',
  );
  const status = String(formData.get('status') ?? 'pending');
  const programRaw = String(formData.get('program') ?? '').trim();
  const program = programRaw.length > 0 ? programRaw : null;
  const half = Number(formData.get('half'));
  const areaIdRaw = String(formData.get('area_id') ?? '').trim();
  const areaId = areaIdRaw.length > 0 ? areaIdRaw : null;

  if (!year || !projectName) {
    return {
      success: false,
      message: 'Datos inválidos: año y nombre de proyecto son obligatorios.',
    };
  }

  if (half !== 1 && half !== 2) {
    return {
      success: false,
      message: 'Semestre inválido: debe ser 1 o 2.',
    };
  }

  if (!areaId) {
    return {
      success: false,
      message: 'Área inválida: seleccioná un área para el proyecto.',
    };
  }

  try {
    await drizzleDb.transaction(async (tx: Tx) => {
      await tx
        .update(budgets)
        .set({ year, projectName, status })
        .where(eq(budgets.id, id));

      // Solo actualizar allocated_amount; executed_amount es calculado y no debe
      // modificarse desde este formulario.
      const updatedAllocations = await tx
        .update(budgetAllocations)
        .set({
          allocatedAmount: String(allocatedAmount),
          program,
          half,
          year,
          areaId,
        })
        .where(eq(budgetAllocations.projectId, id))
        .returning({ id: budgetAllocations.id });

      if (updatedAllocations.length === 0) {
        // No allocation existed for this budget — create it now (paso 2 incompleto en el create).
        await tx.insert(budgetAllocations).values({
          projectId: id,
          areaId,
          year,
          half,
          program,
          allocatedAmount: String(allocatedAmount),
        });
      }
    });

    revalidatePath('/dashboard/budgets');
    revalidatePath(`/dashboard/budgets/${id}/edit`);

    return {
      success: true,
      message: 'Proyecto actualizado exitosamente.',
    };
  } catch (error: unknown) {
    const code = (error as { code?: string })?.code;
    const message = error instanceof Error ? error.message : String(error);
    if (code === '23505' || /budget_allocations_area_id_year_half_key|unique/i.test(message)) {
      return {
        success: false,
        message:
          'Ya existe una asignación para esa área en ese año y semestre. Cambiá el año o el semestre.',
      };
    }
    console.error('Database Error updating budget:', error);
    return {
      success: false,
      message: 'No se pudo actualizar el proyecto.',
    };
  }
}

export async function deleteCustomer(id: string) {
  const session = await getServerSession(authOptions);
  if (!session?.user) return { success: false, message: 'No autorizado.' };
  if (isAreaScopedRole(session.user.role)) {
    return { success: false, message: 'No tenés permisos para eliminar proveedores.' };
  }

  try {
    await drizzleDb.delete(customers).where(eq(customers.id, id));
    revalidatePath('/dashboard/customers');
    return { success: true, message: 'Proveedor eliminado exitosamente.' };
  } catch (error) {
    console.error('Database Error:', error);
    return {
      success: false,
      message: 'Error de base de datos: No se pudo eliminar el proveedor.',
    };
  }
}
