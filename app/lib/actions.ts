'use server';
// import { signIn } from 'next-auth/react';
import { revalidatePath } from 'next/cache';
import { redirect } from 'next/navigation';
import { Pool } from 'pg';
import { z } from 'zod';
import { sendEmail } from './SendMail';
import { Yesteryear } from 'next/font/google';

const FormSchema = z.object({
  id: z.string(),
  customerId: z.string({
    invalid_type_error: 'Please select a customer.',
  }),
  amount: z.coerce
    .number()
    .gt(0, { message: 'Please enter an amount greater than $0.' }),
  status: z.enum(['pending', 'paid'], {
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
  status: 'pending' | 'paid';
  areaId: string;
  year: number;
  budgetAllocationId: string;
}) {
  const validatedFields = CreateInvoice.safeParse(formData);

  if (!validatedFields.success) {
    return {
      success: false,
      errors: validatedFields.error.flatten().fieldErrors,
      message: 'Missing Fields. Failed to Create Invoice.',
    };
  }

  const { customerId, amount, status, areaId, year, budgetAllocationId } = validatedFields.data;
  const amountInCents = amount * 100;
  const date = new Date().toISOString().split('T')[0];

  const half = await getHalfByBudgetAllocationId(pool, budgetAllocationId);

  try {
    const queryText = `
      INSERT INTO invoices (customer_id, amount, status, date, area_id, year, budget_allocation_id)
      VALUES ($1, $2, $3, $4, $5, $6, $7)
    `;
    const params = [customerId, amountInCents, status, date, areaId, year, budgetAllocationId];
    await pool.query(queryText, params);
    console.log('Invoice created:', params);

    if(status === 'paid') { 
      updateAvailableAreaFounds(pool, areaId, amount, year,half, budgetAllocationId, status);
    }
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
  updates: {id: string, areaId: string; amount: number, year: number, half: number }[],
) {
  try {
    for (const update of updates) {
      const { id, areaId, amount, year,half } = update;
      // Opcional: Validar que amount es un número válido
      if (isNaN(amount) || amount < 0) {
        console.warn(`Monto inválido para el área ${areaId}: ${amount}`);
        continue; // Saltar esta actualización
      }
      if(id === 'new') {
        const queryTextInsert = `
          INSERT INTO area_funds (area_id, allocated_funds, year, quarter)
          VALUES ($1, $2, $3, $4)
        `;
        const params = [areaId, amount, year, half];
        await pool.query(queryTextInsert, params);
      } else {
        const queryTextUpdate = `
          UPDATE area_funds
          SET allocated_funds = $2, year = $3, half = $4, area_id = $5
          WHERE id = $1
        `;
        await pool.query(queryTextUpdate, [id, amount, year, half, areaId]);  
      }
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

export async function updateInvoice(id: string, formData: FormData, changedBy: string) {
  const data = {
    customerId: formData.get('customerId') as string,
    amount: Number(formData.get('amount') as unknown as string),
    newStatus: formData.get('status') as string,
    areaId: formData.get('string') as string,
    year: Number(formData.get('year') as unknown as string),
    budgetAllocationId: formData.get('budgetAllocationId') as string,
  };

  try {
    const half = await getHalfByBudgetAllocationId(pool, data.budgetAllocationId);
    // Obtener el estado actual de la factura
    const invoice = await getInvoiceData(pool, id);
    const currentStatus = invoice.status;
    const currentAmount = invoice.amount;
    const fundsAvailable = await validateFunds(pool, data.areaId, data.amount, String(data.year),half);
    if(!fundsAvailable) {
      return {
        success: false,
        message: 'Insufficent funds available',
      };
    }
    // Validar si el estado ha cambiado
    if (currentStatus !== data.newStatus) {
      if(data.newStatus === 'pending') {
        
        await updateAvailableAreaFounds(pool, data.areaId, data.amount, data.year, half, data.budgetAllocationId, data.newStatus);
      } else {
        await updateAvailableAreaFounds(pool, data.areaId, data.amount, data.year, half, data.budgetAllocationId, data.newStatus);
      }     
    }

    // Actualizar la factura
    const updateQuery = `
      UPDATE invoices
      SET customer_id = $1, amount = $2, status = $3
      WHERE id = $4
    `;
    const updateParams = [data.customerId, data.amount, data.newStatus, id];
    await pool.query(updateQuery, updateParams);
    console.log('Invoice updated:', updateParams);
    await logInvoiceAudit(pool, id, data.customerId, data.amount, data.newStatus, 'UPDATE', changedBy);
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

//crear un proyecto
export async function createBudget({
  id,
  areaId,
  projectId,
  allocated_amount,
  year,
  half,
  program
}: {
  id: string;
  projectId: string;	
  areaId: string;
  allocated_amount: number;
  year: number;
  half: number;
  program: string;
  
}) {
  if (id === 'new') {
    try {
      const queryText = `
        INSERT INTO area_funds (area_id, allocated_funds, year, half, program, project_id)
        VALUES ($1, $2, $3, $4, $5, $6)
      `;
      const params = [areaId, allocated_amount, year, half, program, projectId];
      await pool.query(queryText, params);
      console.log('Project created:', params);
      return { success: true, message: 'Project created successfully.' };
    } catch (error) {
      console.error('Database Error:', error);
      return { success: false, message: 'Database Error: Failed to create project.' };
    }
  } else {
    try {
      const queryText = `
        UPDATE area_funds
        SET allocated_funds = $1, year = $2, half = $3, program = $4, project_id = $5
        WHERE id = $6
      `;
      const params = [allocated_amount, year, half, program, projectId, id];
      await pool.query(queryText, params);
      console.log('Project updated:', params);
      return { success: true, message: 'Project updated successfully.' };
    } catch (error) {
      console.error('Database Error:', error);
      return { success: false, message: 'Database Error: Failed to update project.' };
    }
  }

}

export async function updateBudget(id: string, formData: FormData,  changedBy: string) {
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
  const fundsAvailable = await validateFunds(pool, data.areaId, data.amount, String(data.year), data.quarter);
  const sumOfApproveds = await sumApprovedBudgetsByAreaAndQuarter(pool, data.areaId, String(data.year), data.quarter);
  if(!fundsAvailable || sumOfApproveds < data.amount) {
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
    await logBudgetAudit(pool, id, data.year, data.areaId, data.program, data.project, data.customerId, data.concept, data.amount, data.status, 'UPDATE', changedBy);
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

export async function sumApprovedBudgetsByAreaAndQuarter(pool: Pool, areaId: string, year: string, quarter: number): Promise<number> {
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
  project: string,
  amount: number,
): Promise<boolean> {
  try {
    const queryText = `
      SELECT SUM(amount) AS total_budget
      FROM budgets
      WHERE project = $1 AND status = 'approved'
    `;
    const result = await pool.query(queryText, [project]);

    const totalBudget = result.rows[0].total_budget || 0;
    return totalBudget >= amount;
  } catch (error) {
    console.error('Error checking project funds:', error);
    return false;
  }
}

export async function deleteCustomer(id: string) {
  try {
    const queryText = 'DELETE FROM customers WHERE id = $1';
    const params = [id];
    await pool.query(queryText, params);
    revalidatePath('/dashboard/customers');
    return { message: 'Deleted Customer.' };
  } catch (error) {
    console.error('Database Error:', error);
    return { message: 'Database Error: Failed to Delete Customer.' };
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



export async function sendBudgetEmail(pool: Pool, year: string, areaId: string, program: string, project: string, customerId: string, concept: string, amount: number, status: string) {
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

export async function sendInvoiceEmail(pool: Pool, customerId: string, amountInCents: number, status: string, date: string) {
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

export async function validateFunds(pool: Pool, areaId: String, requiredAmount: number, year: string, quarter: number): Promise<boolean> {
  const queryText = `
    SELECT remaining_funds
    FROM area_funds
    WHERE area_id = $1 AND year = $2 AND quarter = $3 
  `;
  const values = [areaId, year, quarter];

  try {
    const result = await pool.query(queryText, values);
    if (result.rows.length === 0) {
      throw new Error(`Area encontrada id buscado: ${areaId}`);
    }

    const remaining_funds = result.rows[0].remaining_funds;
    return remaining_funds >= requiredAmount;
  } catch (error) {
    console.error('Error al validar fondos:', error);
    throw new Error('Error error al validar fondos.');
  }
}

async function updateAvailableAreaFounds(pool: Pool, areaId: string, amount: number, year:number, half:number, budgetAllocationId: string, status: string) {
  updateBudgetAllocation(pool, budgetAllocationId, amount, status);
  const updateFundsQuery = `
    UPDATE area_funds
    SET 
      remaining_funds = allocated_funds + CASE WHEN $3 = 'pending' THEN $1 ELSE -$1 END,
      executed_funds = executed_funds + CASE WHEN $3 = 'pending' THEN -$1 ELSE $1 END
    WHERE area_id = $2 AND year = $4 AND half = $5
  `;
  const updateFundsParams = [amount, areaId, status, year, half];
  try {
    await pool.query(updateFundsQuery, updateFundsParams);
    console.log('Area funds updated:', updateFundsParams);
  } catch (error) {
    console.error('Error updating area funds:', error);
    throw new Error('Error updating area funds');
  }
}

async function updateBudgetAllocation(pool: Pool, budgetAllocationId: string, amount: number, status: string) {
  const updateAllocationQuery = `
    UPDATE budget_allocations
    SET 
      allocated_amount = allocated_amount + CASE WHEN $3 = 'pending' THEN $1 ELSE -$1 END,
      executed_amount = executed_amount + CASE WHEN $3 = 'pending' THEN -$1 ELSE $1 END
    WHERE id = $2
  `;
  const updateAllocationParams = [amount, budgetAllocationId, status];

  try {
    await pool.query(updateAllocationQuery, updateAllocationParams);
    console.log('Budget allocation updated:', updateAllocationParams);
  } catch (error) {
    console.error('Error updating budget allocation:', error);
    throw new Error('Error updating budget allocation');
  }
}


export async function getInvoiceData(pool: Pool, invoiceId: string): Promise<{ status: string, amount: number, year: number, quarter: number }> {
  const getStatusQuery = `
    SELECT status,amount,year,quarter
    FROM invoices
    WHERE id = $1
  `;
  const getStatusParams = [invoiceId];

  try {
    const statusResult = await pool.query(getStatusQuery, getStatusParams);
    if (statusResult.rows.length === 0) {
      throw new Error(`Invoice not found with id: ${invoiceId}`);
    }

    return { status: statusResult.rows[0].status, amount: statusResult.rows[0].amount, year: statusResult.rows[0].year, quarter: statusResult.rows[0].quarter };
  } catch (error) {
    console.error('Error getting invoice status:', error);
    throw new Error('Error getting invoice status');
  }
}

async function logInvoiceAudit(pool: Pool, invoiceId: string, customerId: string, amount: number, status: string, action: string, changedBy: string) {
  const auditQuery = `
    INSERT INTO invoice_audit (invoice_id, customer_id, amount, status, action, changed_by)
    VALUES ($1, $2, $3, $4, $5, $6)
  `;
  const auditParams = [invoiceId, customerId, amount, status, action, changedBy];

  try {
    await pool.query(auditQuery, auditParams);
    console.log('Invoice audit logged:', auditParams);
  } catch (error) {
    console.error('Error logging invoice audit:', error);
    throw new Error('Error logging invoice audit');
  }
}

async function logBudgetAudit(pool: Pool, budgetId: string, year: number, areaId: string, program: string, project: string, customerId: string, concept: string, amount: number, status: string, action: string, changedBy: string) {
  const auditQuery = `
    INSERT INTO budget_audit (budget_id, year, area_id, program, project, customer_id, concept, amount, status, action, changed_by)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
  `;
  const auditParams = [budgetId, year, areaId, program, project, customerId, concept, amount, status, action, changedBy];

  try {
    await pool.query(auditQuery, auditParams);
    console.log('Budget audit logged:', auditParams);
  } catch (error) {
    console.error('Error logging budget audit:', error);
    throw new Error('Error logging budget audit');
  }
}


export async function getHalfByBudgetAllocationId(pool: Pool, budgetAllocationId: string): Promise<number> {
  const queryText = `
    SELECT half
    FROM budget_allocations
    WHERE id = $1
  `;
  const queryParams = [budgetAllocationId];

  try {
    const result = await pool.query(queryText, queryParams);
    if (result.rows.length === 0) {
      throw new Error(`No budget allocation found with id: ${budgetAllocationId}`);
    }
    return result.rows[0].half;
  } catch (error) {
    console.error('Error fetching half:', error);
    throw new Error('Error fetching half');
  }
}


