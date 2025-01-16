'use server';
// import { signIn } from 'next-auth/react';
import { revalidatePath } from 'next/cache';
import { redirect } from 'next/navigation';
import { Pool } from 'pg';
import { z } from 'zod';
import { sendEmail } from './SendMail';

const FormSchema = z.object({
  id: z.string(),
  customerId: z.string({
    invalid_type_error: 'Please select a customer.',
  }),
  amount: z.coerce
    .number()
    .gt(0, { message: 'Please enter an amount greater than $0.' }),
  status: z.enum(['presentado', 'aprobado', 'pagado', 'rechazado'], {
    invalid_type_error: 'Please select an invoice status.',
  }),
  date: z.string(),
});

const CustomerFormSchema = z.object({
  id: z.string(),
  name: z.string({
    invalid_type_error: 'Please enter a customer name.',
  }),
  email: z.string({
    invalid_type_error: 'Please enter an email.',
  }),
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
}).omit({ id: true, date: true });
const AddCustomer = CustomerFormSchema.omit({ id: true, date: true });

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
}) {
  const validatedFields = CreateInvoice.safeParse(formData);

  if (!validatedFields.success) {
    return {
      success: false,
      errors: validatedFields.error.flatten().fieldErrors,
      message: 'Missing Fields. Failed to Create Invoice.',
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
  } = validatedFields.data;
  const amountInCents = amount * 100;
  const date = new Date().toISOString().split('T')[0];

  const half = await getHalfByBudgetAllocationId(pool, budgetAllocationId);

  try {
    const queryText = `
      INSERT INTO invoices (customer_id, amount, status, date, area_id, year, budget_allocation_id,file, company_id)
      VALUES ($1, $2, $3, $4, $5, $6, $7,$8,$9)
    `;
    const params = [
      customerId,
      amountInCents,
      status,
      date,
      areaId,
      year,
      budgetAllocationId,
      file,
      company_id,
    ];
    await pool.query(queryText, params);
    console.log('Invoice created:', params);

    await sendInvoiceEmail(pool, customerId, amountInCents, status, date);
    return {
      success: true,
      message: 'Invoice created successfully.',
    };
  } catch (error) {
    console.error('Database Error:', error);
    return {
      success: false,
      message: 'Database Error: Failed to Create Invoice.',
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

export async function addCustomer(formData: { name: string; email: string }) {
  const validatedFields = AddCustomer.safeParse(formData);

  if (!validatedFields.success) {
    return {
      errors: validatedFields.error.flatten().fieldErrors,
      message: 'Missing Fields. Failed to Add Customer.',
    };
  }

  const { name, email } = validatedFields.data;

  try {
    const queryText = `
      INSERT INTO customers (name, email, image_url)
      VALUES ($1, $2, $3)
    `;
    const params = [name, email, '/customers/emil-kowalski.png'];
    await pool.query(queryText, params);
  } catch (error) {
    console.error('Database Error:', error);
    return {
      message: 'Database Error: Failed to Add Customer.',
    };
  }

  revalidatePath('/dashboard/customers');
  redirect('/dashboard/customers');
}

const UpdateInvoice = FormSchema.omit({ id: true, date: true });
const UpdateCustomer = CustomerFormSchema.omit({ id: true });

export async function updateInvoice(
  id: string,
  formData: FormData,
  company_id: number = 0,
) {
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

  // Extraer datos del formulario y convertir el monto a centavos
  const data = {
    customerId: formData.get('customerId') as string,
    amount: parseFloat(formData.get('amount') as string) * 100,
    newStatus: formData.get('status') as string,
  };

  console.log('Updating invoice id:', id);
  console.log('FormData:', formData);

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
        message: 'Insufficent funds available',
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
      SET customer_id = $1, amount = $2, status = $3, file = $4, company_id = $5
      WHERE id = $6
    `;
    const updateParams = [
      data.customerId,
      data.amount,
      data.newStatus,
      file,
      company_id,
      id,
    ];
    await pool.query(updateQuery, updateParams);
    console.log('Invoice updated with params:', updateParams);

    // Revalida la ruta para que se vean los datos actualizados
    revalidatePath('/dashboard/invoices');

    return {
      success: true,
      message: 'Invoice updated successfully.',
    };
  } catch (error) {
    console.error('Database Error:', error);
    return {
      success: false,
      message: 'Database Error: Failed to Update Invoice.',
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
      message: 'Project created successfully.',
    };
  } catch (error) {
    console.error('Error creating project:', error);
    return {
      success: false,
      message: 'Database Error: Failed to create project in budgets.',
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
      message: 'Budget allocation created successfully.',
    };
  } catch (error) {
    if (error instanceof Error) {
      console.error('Error creating budget allocation:', error.message);
    } else {
      console.error('Error creating budget allocation:', error);
    }
    if (error instanceof Error) {
      console.error(error.stack);
    } else {
      console.error(error);
    }
    return {
      success: false,
      message: 'Database Error: Failed to create budget allocation.',
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
        message: 'Project and area allocated successfully.',
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
        message: 'Project and allocation updated successfully.',
      };
    }
  } catch (error) {
    console.error('Database Error:', error);
    return { success: false, message: 'Failed to create or update project.' };
  }
}

export async function updateBudget(
  id: string,
  formData: FormData,
  changedBy: string,
) {
  const data = {
    year: Number(formData.get('year')),
    program: formData.get('program') as string,
    project: formData.get('project') as string,
    concept: formData.get('concept') as string,
    customerId: formData.get('customerId') as string,
    amount: parseFloat(formData.get('amount') as string),
    areaId: formData.get('areaId') as string,
    status: formData.get('status') as string,
    quarter: Number(formData.get('quarter')),
  };
  const fundsAvailable = await validateFunds(
    pool,
    data.areaId,
    data.amount,
    String(data.year),
    data.quarter,
  );
  const sumOfApproveds = await sumApprovedBudgetsByAreaAndQuarter(
    pool,
    data.areaId,
    String(data.year),
    data.quarter,
  );
  if (!fundsAvailable || sumOfApproveds < data.amount) {
    return { success: false, message: 'Insufficent funds available' };
  }
  const queryText = `
    UPDATE budgets
    SET year = $1, program = $2, project = $3, concept = $4, customer_id = $5, amount = $6, status = $7
    WHERE id = $8
  `;
  const params = [
    data.year,
    data.program,
    data.project,
    data.concept,
    data.customerId,
    data.amount,
    data.status,
    id,
  ];

  try {
    const result = await pool.query(queryText, params);
    await logBudgetAudit(
      pool,
      id,
      data.year,
      data.areaId,
      data.program,
      data.project,
      data.customerId,
      data.concept,
      data.amount,
      data.status,
      'UPDATE',
      changedBy,
    );
    if (result.rowCount === 0) {
      throw new Error('No budget found to update.');
    }
    return { success: true, message: 'Budget updated successfully.' };
  } catch (error) {
    console.error('Database Error:', error);
    return { success: false, message: 'Failed to update budget.' };
  }
}

export async function deleteBudget(id: string) {
  try {
    const res = await fetch(`/api/budget/${id}`, {
      method: 'DELETE',
    });
    if (!res.ok) throw new Error('Failed to delete budget');
    return await res.json();
  } catch (error) {
    console.error(error);
  }
}

export async function updateCustomer(
  id: string,
  data: { name: string; email: string },
) {
  const queryText = `
    UPDATE customers
    SET name = $1, email = $2
    WHERE id = $3
  `;
  const params = [data.name, data.email, id];

  try {
    const result = await pool.query(queryText, params);
    if (result.rowCount === 0) {
      throw new Error('No customer found to update.');
    }
    return { success: true, message: 'Customer updated successfully.' };
  } catch (error) {
    console.error('Database Error:', error);
    return { success: false, message: 'Failed to update customer.' };
  }
}
export async function deleteInvoice(id: string) {
  try {
    const queryText = 'DELETE FROM invoices WHERE id = $1';
    const params = [id];
    await pool.query(queryText, params);
    revalidatePath('/dashboard/invoices');
    return { message: 'Deleted Invoice.' };
  } catch (error) {
    console.error('Database Error:', error);
    return { message: 'Database Error: Failed to Delete Invoice.' };
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
      throw new Error('No matching records found');
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
      throw new Error('No matching records found');
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
}> {
  const getStatusQuery = `
    SELECT 
      i.status,
      i.amount,
      i.year,
      i.area_id,
      i.budget_allocation_id,
      ba.half
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
    throw new Error('Error fetching half');
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
    throw new Error('Failed to create or fetch program');
  }
}
