'use server';
// import { signIn } from 'next-auth/react';
import { revalidatePath } from 'next/cache';
import { Pool } from 'pg';
import { z } from 'zod';
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

const CustomerFormSchema = z.object({
  name: z.string().min(1, { message: 'Por favor ingrese un nombre válido.' }),
  email: z.string().email({ message: 'Por favor ingrese un email válido.' }),
  cuit_cuil: z
    .string()
    .regex(/^\d{11}$/, { message: 'CUIT/CUIL debe tener 11 dígitos.' })
    .optional(),
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
});
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
  observations: z.string().optional(),
  invoice_number: z.string().regex(/^\d{5}-\d{8}$/, {
    message: 'Formato de número de factura inválido.',
  }),
  issue_date: z
    .string()
    .regex(/^\d{4}-\d{2}-\d{2}$/, { message: 'Fecha inválida (YYYY-MM-DD)' }),
}).omit({ id: true, date: true });

const pool = new Pool({
  connectionString: process.env.POSTGRES_URL,
});

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
}) {
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
  } = validatedFields.data;

  // Check for duplicated invoice number
  const duplicate = await pool.query(
    'SELECT 1 FROM invoices WHERE invoice_number = $1',
    [invoice_number],
  );
  if (duplicate.rows.length > 0) {
    return {
      success: false,
      message: 'Factura cargada previamente. El número de factura ya existe.',
    };
  }

  const amountInCents = amount * 1;

  try {
    const queryText = `
      INSERT INTO invoices (
        customer_id, amount, status, date, area_id, year, budget_allocation_id, file, company_id, observations, invoice_number, issue_date
      )
      VALUES ($1, $2, $3, CURRENT_DATE, $4, $5, $6, $7, $8, $9, $10, $11)
    `;
    const params = [
      customerId,
      amountInCents,
      status,
      areaId,
      year,
      budgetAllocationId,
      file,
      company_id,
      observations,
      invoice_number,
      issue_date,
    ];
    await pool.query(queryText, params);

    await sendInvoiceEmail(pool, customerId, amountInCents, status, issue_date);
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
      // Usamos ON CONFLICT para que no cree duplicados
      // si ya existe la fila con (area_id, year, half).
      await pool.query(
        `
        INSERT INTO area_funds (area_id, allocated_funds, year, half)
        VALUES ($1, $2, $3, $4)
        ON CONFLICT (area_id, year, half)
        DO UPDATE SET
          allocated_funds = EXCLUDED.allocated_funds
      `,
        [areaId, amount, year, half],
      );
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
  const { name, email, cuit_cuil, cbu_cvu, phone, iva_condition } =
    validatedFields.data;

  try {
    const queryText = `
      INSERT INTO customers (name, email, cuit_cuil, cbu_cvu, image_url, phone, iva_condition)
      VALUES ($1, $2, $3, $4, $5, $6, $7)
    `;

    const params = [
      name,
      email ?? null,
      cuit_cuil ?? null,
      cbu_cvu ?? null,
      '/customers/default.png',
      phone ?? null,
      iva_condition ?? 'Pendiente',
    ];

    await pool.query(queryText, params);

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
    const duplicate = await pool.query(
      'SELECT id FROM invoices WHERE invoice_number = $1 AND id <> $2',
      [invoice_number, id],
    );
    if (duplicate.rows.length > 0) {
      return {
        success: false,
        message: 'Factura cargada previamente. El número de factura ya existe.',
      };
    }
  }

  try {
    // Obtener la factura actual para otros procesos
    const invoice = await getInvoiceData(pool, id);
    console.log('Invoice data from DB:', invoice);
    const currentStatus = invoice.status;
    const currentAmount = invoice.amount; // ya en centavos

    // Chequeo de fondos (según reglas existentes)
    const fundsAvailable = await checkProjectFundsByInoviceId(
      pool,
      parseFloat(formData.get('amount') as string),
      id,
    );

    if (!fundsAvailable && data.newStatus === 'aprobado') {
      return {
        success: false,
        message: 'Fondos Insuficientes para aprobar la factura.',
      };
    } else {
      console.log('currentStatus:', currentStatus);
      console.log('newStatus:', data.newStatus);
      if (currentStatus !== data.newStatus) {
        if (data.newStatus === 'pending') {
          await updateAvailableAreaFounds(
            pool,
            currentAmount,
            invoice.budgetAllocationId,
            data.newStatus,
          );
        } else {
          await updateAvailableAreaFounds(
            pool,
            parseFloat(formData.get('amount') as string),
            invoice.budgetAllocationId,
            data.newStatus,
          );
        }
      }
    }

    // Actualizar la factura
    const updateQuery = `
      UPDATE invoices
      SET customer_id = $1, amount = $2, status = $3, file = $4, company_id = $5, observations = $6,
          invoice_number = $7, issue_date = $8, contable_item_id = $9
      WHERE id = $10
    `;
    const updateParams = [
      data.customerId,
      data.amount,
      data.newStatus,
      file,
      company_id,
      data.observations,
      data.invoice_number,
      data.issue_date,
      contable_item_id ? Number(contable_item_id) : null,
      id,
    ];
    await pool.query(updateQuery, updateParams);

    console.log('Invoice updated with params:', updateParams);

    // Revalida la ruta para que se vean los datos actualizados
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

// ----------------------------------------------------------------------------------
// 1. createProject
// ----------------------------------------------------------------------------------
export async function createProject(
  project_name: string,
  year: number,
  company_id: number,
) {
  try {
    const queryText = `
      INSERT INTO budgets (project_name, year, company_id)
      VALUES ($1, $2, $3)
      RETURNING id
    `;
    const params = [project_name, year, company_id];
    const result = await pool.query(queryText, params);

    // Obtenemos el nuevo ID
    const newProjectId = result.rows[0].id as string;

    return {
      success: true,
      projectId: newProjectId,
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

// ----------------------------------------------------------------------------------
// 2. createBudgetAllocation
// ----------------------------------------------------------------------------------
export async function createBudgetAllocation(
  project_id: string,
  area_id: string,
  allocated_amount: number,
  half: number,
  program: string,
  year: number, // <---- Añadimos el year aquí
) {
  try {
    // Notar que ahora incluimos también la columna "year"
    const queryText = `
      INSERT INTO budget_allocations 
        (project_id, area_id, year, allocated_amount, executed_amount, half, program)
      VALUES ($1, $2, $3, $4, 0, $5, $6)
    `;
    // Orden de parámetros: [project_id, area_id, year, allocated_amount, half, program]
    const params = [
      project_id,
      area_id,
      year, // <---- Insertamos year en la tercera posición
      allocated_amount,
      half,
      program,
    ];
    await pool.query(queryText, params);

    return {
      success: true,
      message: 'Asignación de proyecto creada exitosamente.',
    };
  } catch (error) {
    if (error instanceof Error) {
      console.error(
        'Error al crear la asignación del proyecto:',
        error.message,
      );
    } else {
      console.error('Error al crear la asignación del proyecto:', error);
    }
    if (error instanceof Error) {
      console.error(error.stack);
    } else {
      console.error(error);
    }
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
  company_id, // Añadimos company_id aquí
}: {
  id: string;
  projectId: string;
  areaId: string;
  allocated_amount: number;
  year: number;
  half: number;
  program: string;
  company_id: string; // Tipo de company_id
}) {
  try {
    if (id === 'new') {
      // Primero creamos el proyecto en la tabla 'budgets'
      const queryText = `
        INSERT INTO budgets (project_name, year, company_id)
        VALUES ($1, $2, $3) RETURNING id
      `;
      const params = [, year, company_id]; // Incluimos company_id en los parámetros
      const result = await pool.query(queryText, params);
      const projectId = result.rows[0].id; // Obtenemos el ID del nuevo proyecto.

      // Ahora asignamos los fondos y áreas en 'budget_allocations'
      const queryTextInsert = `
        INSERT INTO budget_allocations (project_id, area_id, allocated_amount, executed_amount, program, half, year)
        VALUES ($1, $2, $3, 0, $4, $5, $6)
      `;
      const paramsAllocations = [
        projectId,
        areaId,
        allocated_amount,
        program,
        half,
        year, // Año incluido aquí
      ];
      await pool.query(queryTextInsert, paramsAllocations);
      console.log('Budget created and areas assigned:', paramsAllocations);

      return {
        success: true,
        message: 'Proyecto y área asignados exitosamente.',
      };
    } else {
      // Si no es un proyecto nuevo, actualizamos
      const queryText = `
        UPDATE budgets
        SET project_name = $1, year = $2, company_id = $3
        WHERE id = $4
      `;
      const params = [projectId, year, company_id, id]; // Incluimos company_id en los parámetros
      await pool.query(queryText, params);

      // Actualizamos los fondos
      const queryTextUpdate = `
        UPDATE budget_allocations
        SET allocated_amount = $3, executed_amount = 0, program = $4, half = $5, year = $6
        WHERE project_id = $1 AND area_id = $2
      `;
      const paramsUpdate = [
        projectId,
        areaId,
        allocated_amount,
        program,
        half,
        year, // Año incluido aquí
      ];
      await pool.query(queryTextUpdate, paramsUpdate);

      console.log('Project and area updated:', paramsUpdate);

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
  changedBy: string,
) {
  // Datos que realmente vienen del formulario de edición
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

  const client = await pool.connect();

  try {
    await client.query('BEGIN');

    // 1) Actualizar datos básicos del proyecto
    await client.query(
      `
        UPDATE budgets
        SET year = $1,
            project_name = $2,
            status = $3
        WHERE id = $4
      `,
      [year, projectName, status, id],
    );

    // 2) Actualizar la asignación principal del proyecto
    //    (si tenés más de una allocation por proyecto, esto las actualiza a todas)
    await client.query(
      `
        UPDATE budget_allocations
        SET allocated_amount = $1,
            executed_amount = $2
        WHERE project_id = $3
      `,
      [allocatedAmount, amount, id],
    );

    // TODO opcional: si querés loguear auditoría, acá podrías llamar a logBudgetAudit
    // await logBudgetAudit(pool, id, "update", amount, changedBy);

    await client.query('COMMIT');

    return {
      success: true,
      message: 'Proyecto actualizado exitosamente.',
    };
  } catch (error) {
    await client.query('ROLLBACK');
    console.error('Database Error updating budget:', error);
    return {
      success: false,
      message: 'No se pudo actualizar el proyecto.',
    };
  } finally {
    client.release();
  }
}

export async function deleteBudget(id: string) {
  try {
    const res = await fetch(`/api/budget/${id}`, {
      method: 'DELETE',
    });
    if (!res.ok) throw new Error('No se pudo eliminar el presupuesto');
    return await res.json();
  } catch (error) {
    console.error(error);
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
  },
) {
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

  const { name, email, cuit_cuil, cbu_cvu, phone, iva_condition } =
    validatedFields.data;

  const queryText = `
    UPDATE customers
    SET
      name = $1,
      email = $2,
      cuit_cuil = $3,
      cbu_cvu = $4,
      phone = $5,
      iva_condition = $6
    WHERE id = $7
  `;

  const params = [
    name,
    email ?? null,
    cuit_cuil ?? null,
    cbu_cvu ?? null,
    phone ?? null,
    iva_condition ?? 'Pendiente',
    id,
  ];

  try {
    const result = await pool.query(queryText, params);

    if (result.rowCount === 0) {
      return {
        success: false,
        message: 'No se encontró el proveedor para actualizar.',
      };
    }

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
  try {
    const queryText = 'DELETE FROM invoices WHERE id = $1';
    const params = [id];
    await pool.query(queryText, params);
    revalidatePath('/dashboard/invoices');
    return { message: 'Eliminar Factura.' };
  } catch (error) {
    console.error('Database Error:', error);
    return {
      message: 'Error en la base de datos: No se pudo eliminar la factura.',
    };
  }
}

export async function sumApprovedBudgetsByAreaAndQuarter(
  pool: Pool,
  areaId: string,
  year: string,
  quarter: number,
): Promise<number> {
  const queryText = `
    SELECT SUM(amount) AS total_amount
    FROM budgets
    WHERE area_id = $1 AND year = $2 AND quarter = $3 AND status = 'approved'
  `;
  const queryParams = [areaId, year, quarter];

  try {
    const result = await pool.query(queryText, queryParams);
    const totalAmount = result.rows[0].total_amount || 0;
    return totalAmount;
  } catch (error) {
    console.error('Error summing approved budgets:', error);
    throw new Error('Error summing approved budgets');
  }
}

export async function checkProjectFunds(
  pool: Pool,
  budgetAllocationId: string,
  amount: number,
): Promise<boolean> {
  try {
    const queryText = `
      SELECT 
        executed_amount AS budget_executed_amount
      FROM 
        budget_allocations
      WHERE 
        id = $1
    `;
    const queryParams = [budgetAllocationId];
    const result = await pool.query(queryText, queryParams);

    if (result.rows.length === 0) {
      throw new Error('No se encontraron registros coincidentes');
    }

    const budgetExecutedAmount = result.rows[0].budget_executed_amount || 0;
    return budgetExecutedAmount > amount;
  } catch (error) {
    console.error('Error checking project funds:', error);
    return false;
  }
}

export async function checkProjectFundsByInoviceId(
  pool: Pool,
  amount: number,
  invoice_id: string,
): Promise<boolean> {
  try {
    const queryText = `
    SELECT 
      ba.executed_amount AS budget_executed_amount,
      ba.allocated_amount AS budget_allocated_amount
    FROM 
      budget_allocations ba
    JOIN 
      invoices i ON i.budget_allocation_id = ba.id
    WHERE 
      i.id = $1
  `;
    const queryParams = [invoice_id];
    const result = await pool.query(queryText, queryParams);

    if (result.rows.length === 0) {
      throw new Error('No se encontraron registros coincidentes');
    }
    const budgetExecutedAmount = result.rows[0].budget_executed_amount;
    const budgetAllocatedAmount = result.rows[0].budget_allocated_amount;
    console.log(budgetExecutedAmount);
    return budgetAllocatedAmount > amount + budgetExecutedAmount;
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
  pool: Pool,
  year: string,
  areaId: string,
  program: string,
  project: string,
  customerId: string,
  concept: string,
  amount: number,
  status: string,
) {
  const queryMailData = `
    SELECT a.name as area_name, c.name as customer_name
    FROM areas a
    JOIN customers c ON c.id = $2
    WHERE a.id = $1
  `;

  const mailDataValues = [areaId, customerId];

  try {
    const result = await pool.query(queryMailData, mailDataValues);
    const areaName = result.rows[0].area_name;
    const customerName = result.rows[0].customer_name;

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
  pool: Pool,
  customerId: string,
  amountInCents: number,
  status: string,
  date: string,
) {
  const queryMailData = `
    SELECT name as customer_name
    FROM customers
    WHERE id = $1
  `;

  const mailDataValues = [customerId];

  try {
    const result = await pool.query(queryMailData, mailDataValues);
    const customerName = result.rows[0].customer_name;

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

export async function validateFunds(
  pool: Pool,
  areaId: String,
  requiredAmount: number,
  year: string,
  quarter: number,
): Promise<boolean> {
  const queryText = `
    SELECT executed_funds
    FROM area_funds
    WHERE area_id = $1 AND year = $2 AND quarter = $3 
  `;
  const values = [areaId, year, quarter];

  try {
    const result = await pool.query(queryText, values);
    if (result.rows.length === 0) {
      throw new Error(`Area encontrada id buscado: ${areaId}`);
    }

    const remaining_funds = result.rows[0].executed_funds;
    return remaining_funds >= requiredAmount;
  } catch (error) {
    console.error('Error al validar fondos:', error);
    throw new Error('Error error al validar fondos.');
  }
}

async function updateAvailableAreaFounds(
  pool: Pool,
  amount: number,
  budgetAllocationId: string,
  status: string,
) {
  try {
    updateBudgetAllocation(pool, budgetAllocationId, amount, status);
  } catch (error) {
    console.error('Error updating area funds:', error);
    throw new Error('Error updating area funds');
  }
}

async function updateBudgetAllocation(
  pool: Pool,
  budgetAllocationId: string,
  amount: number,
  status: string,
) {
  const updateAllocationQuery = `
    UPDATE budget_allocations
    SET 
      executed_amount = executed_amount + 
        CASE 
          WHEN $3 = 'aprobado' THEN CAST($1 AS NUMERIC) 
          WHEN $3 = 'pagado' THEN 0 
          ELSE -CAST($1 AS NUMERIC) 
        END
    WHERE id = $2
  `;
  const updateAllocationParams = [amount, budgetAllocationId, status];

  try {
    console.log('Budget allocation updated:', updateAllocationParams);
    await pool.query(updateAllocationQuery, updateAllocationParams);
    console.log('Budget allocation updated:', updateAllocationParams);
  } catch (error) {
    console.error('Error updating budget allocation:', error);
    throw new Error('Error updating budget allocation');
  }
}

export async function getInvoiceData(
  pool: Pool,
  invoiceId: string,
): Promise<{
  status: string;
  amount: number;
  year: number;
  half: number;
  areaId: string;
  budgetAllocationId: string;
  invoice_number: string;
  issue_date: string;
}> {
  const getStatusQuery = `
  SELECT 
    i.status,
    i.amount,
    i.year,
    i.area_id,
    i.budget_allocation_id,
    ba.half,
    i.invoice_number, 
    i.issue_date      
  FROM 
    invoices i
  JOIN 
    budget_allocations ba ON i.budget_allocation_id = ba.id
  WHERE 
  i.id = $1
  `;
  const getStatusParams = [invoiceId];

  try {
    const statusResult = await pool.query(getStatusQuery, getStatusParams);
    if (statusResult.rows.length === 0) {
      throw new Error(`Invoice not found with id: ${invoiceId}`);
    }

    return {
      status: statusResult.rows[0].status,
      amount: statusResult.rows[0].amount,
      year: statusResult.rows[0].year,
      half: statusResult.rows[0].half,
      areaId: statusResult.rows[0].areaId,
      budgetAllocationId: statusResult.rows[0].budget_allocation_id,
      invoice_number: statusResult.rows[0].invoice_number,
      issue_date: statusResult.rows[0].issue_date,
    };
  } catch (error) {
    console.error('Error getting invoice status:', error);
    throw new Error('Error getting invoice status');
  }
}

async function logInvoiceAudit(
  pool: Pool,
  invoiceId: string,
  customerId: string,
  amount: number,
  status: string,
  action: string,
  changedBy: string,
) {
  const auditQuery = `
    INSERT INTO invoice_audit (invoice_id, customer_id, amount, status, action, changed_by)
    VALUES ($1, $2, $3, $4, $5, $6)
  `;
  const auditParams = [
    invoiceId,
    customerId,
    amount,
    status,
    action,
    changedBy,
  ];

  try {
    await pool.query(auditQuery, auditParams);
    console.log('Invoice audit logged:', auditParams);
  } catch (error) {
    console.error('Error logging invoice audit:', error);
    throw new Error('Error logging invoice audit');
  }
}

async function logBudgetAudit(
  pool: Pool,
  budgetId: string,
  year: number,
  areaId: string,
  program: string,
  project: string,
  customerId: string,
  concept: string,
  amount: number,
  status: string,
  action: string,
  changedBy: string,
) {
  const auditQuery = `
    INSERT INTO budget_audit (budget_id, year, area_id, program, project, customer_id, concept, amount, status, action, changed_by)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
  `;
  const auditParams = [
    budgetId,
    year,
    areaId,
    program,
    project,
    customerId,
    concept,
    amount,
    status,
    action,
    changedBy,
  ];

  try {
    await pool.query(auditQuery, auditParams);
    console.log('Budget audit logged:', auditParams);
  } catch (error) {
    console.error('Error logging budget audit:', error);
    throw new Error('Error logging budget audit');
  }
}

export async function getHalfByBudgetAllocationId(
  pool: Pool,
  budgetAllocationId: string,
): Promise<number> {
  const queryText = `
    SELECT ba.half
    FROM budget_allocations ba
    WHERE ba.id = $1
  `;
  const queryParams = [budgetAllocationId];
  try {
    const result = await pool.query(queryText, queryParams);
    if (result.rows.length === 0) {
      throw new Error(
        `No budget allocation found with id: ${budgetAllocationId}`,
      );
    }
    return result.rows[0].half;
  } catch (error) {
    console.error('Error fetching half:', error);
    throw new Error('Error al obtener el semestre');
  }
}

export async function createProgram(name: string) {
  try {
    const queryText = `
      INSERT INTO programs (name)
      VALUES ($1)
      ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name
      RETURNING id
    `;
    const params = [name];
    const result = await pool.query(queryText, params);
    const programId = result.rows[0].id as string;
    return programId;
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
  const amount = normalizeMoneyInput(formData.get('amount') ?? '0');
  const status = String(formData.get('status') ?? 'pending');

  if (!year || !projectName) {
    return {
      success: false,
      message: 'Datos inválidos: año y nombre de proyecto son obligatorios.',
    };
  }

  const client = await pool.connect();

  try {
    await client.query('BEGIN');

    // 👇🏼 ACA QUITAMOS status DEL UPDATE
    await client.query(
      `
        UPDATE budgets
        SET year = $1,
            project_name = $2
        WHERE id = $3
      `,
      [year, projectName, id],
    );

    await client.query(
      `
        UPDATE budget_allocations
        SET allocated_amount = $1,
            executed_amount = $2
        WHERE project_id = $3
      `,
      [allocatedAmount, amount, id],
    );

    await client.query('COMMIT');

    return {
      success: true,
      message: 'Proyecto actualizado exitosamente.',
    };
  } catch (error) {
    await client.query('ROLLBACK');
    console.error('Database Error updating budget:', error);
    return {
      success: false,
      message: 'No se pudo actualizar el proyecto.',
    };
  } finally {
    client.release();
  }
}
