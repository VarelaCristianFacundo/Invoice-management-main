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
  areaId: z.string(),
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
}) {
  const validatedFields = CreateInvoice.safeParse(formData);

  if (!validatedFields.success) {
    return {
      success: false,
      errors: validatedFields.error.flatten().fieldErrors,
      message: 'Missing Fields. Failed to Create Invoice.',
    };
  }

  const { customerId, amount, status, areaId } = validatedFields.data;
  const amountInCents = amount * 100;
  const date = new Date().toISOString().split('T')[0];

  try {
    const queryText = `
      INSERT INTO invoices (customer_id, amount, status, date, areaId)
      VALUES ($1, $2, $3, $4, $5)
    `;
    const params = [customerId, amountInCents, status, date, areaId];
    await pool.query(queryText, params);
    console.log('Invoice created:', params);
    
    if(status === 'paid') {
      updateAvailableAreaFounds(pool, areaId, amountInCents, status);
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
  updates: { areaId: string; amount: number }[],
) {
  try {
    for (const update of updates) {
      const { areaId, amount } = update;

      // Opcional: Validar que amount es un número válido
      if (isNaN(amount) || amount < 0) {
        console.warn(`Monto inválido para el área ${areaId}: ${amount}`);
        continue; // Saltar esta actualización
      }

      const queryText = `
        INSERT INTO area_funds (area_id, allocated_funds)
        VALUES ($1, $2)
        ON CONFLICT (area_id) DO UPDATE SET allocated_funds = $2;
      `;
      await pool.query(queryText, [areaId, amount]);
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

export async function updateInvoice(pool: Pool, invoiceId: string, customerId: string, amount: number, newStatus: string, date: string) {
  try {
    // Obtener el estado actual de la factura
    const currentStatus = await getInvoiceStatus(pool, invoiceId);

    // Validar si el estado ha cambiado
    if (currentStatus !== newStatus) {
      // Actualizar los fondos del área basado en el nuevo estado
      await updateAvailableAreaFounds(pool, customerId, amount, newStatus);
    }

    // Actualizar la factura
    const updateQuery = `
      UPDATE invoices
      SET customer_id = $1, amount = $2, status = $3, date = $4
      WHERE id = $5
    `;
    const updateParams = [customerId, amount, newStatus, date, invoiceId];
    await pool.query(updateQuery, updateParams);
    console.log('Invoice updated:', updateParams);

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

export async function createBudget({
  year,
  areaId,
  quarter,
  program,
  project,
  customerId,
  concept,
  amount,
  status,
  fileUrl,
}: {
  year: string;
  areaId: string;
  program: string;
  project: string;
  customerId: string;
  concept: string;
  amount: number;
  status: string;
  fileUrl?: string;
  quarter: number;
}) {
  if (!areaId || typeof areaId !== 'string') {
    return {
      success: false,
      message: 'The area is required and must be valid.',
    };
  }
  const requiredAmount = amount;
  const fundsAvailable = await validateFunds(pool, areaId, requiredAmount, year, quarter);

  if (!fundsAvailable) {
    return {
      success: false,
      message: 'Insufficient funds for the specified area.',
    };
  }
  const queryText = `
    INSERT INTO budgets (year, area_id, program, project, customer_id, concept, amount, status, date, file_url)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, CURRENT_DATE, $9)
  `;
  const values = [
    year,
    areaId,
    program,
    project,
    customerId,
    concept,
    amount,
    status,
    fileUrl,
  ];
  const queryMailData = `
  SELECT a.name as area_name, c.name as customer_name
  FROM areas a
  JOIN customers c ON c.id = $2
  WHERE a.id = $1
`;  

  const mailDataValues = [areaId, customerId];
  try {
    await pool.query(queryText, values);
    console.log('Presupuesto creado:', values);
    await sendBudgetEmail(pool, year, areaId, program, project, customerId, concept, amount, status);
    return { success: true, message: 'Budget created successfully.' };
  } catch (error) {
    console.error('Error creating budget:', error);
    return {
      success: false,
      message: 'Database error: Failed to create budget.',
    };
  }
}

export async function updateBudget(id: string, formData: FormData) {
  const data = {
    year: Number(formData.get('year')),
    program: formData.get('program') as string,
    project: formData.get('project') as string,
    concept: formData.get('concept') as string,
    customerId: formData.get('customerId') as string,
    amount: parseFloat(formData.get('amount') as string),
    status: formData.get('status') as string,
  };

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

async function updateAvailableAreaFounds(pool: Pool, areaId: string, amount: number, status: string) {
  const updateFundsQuery = `
    UPDATE area_funds
    SET 
      remaining_funds = remaining_funds + CASE WHEN $3 = 'pending' THEN $1 ELSE -$1 END,
      executed_funds = executed_funds + CASE WHEN $3 = 'pending' THEN -$1 ELSE $1 END
    WHERE area_id = $2
  `;
  const updateFundsParams = [amount, areaId, status];
  try {
    await pool.query(updateFundsQuery, updateFundsParams);
    console.log('Area funds updated:', updateFundsParams);
  } catch (error) {
    console.error('Error updating area funds:', error);
    throw new Error('Error updating area funds');
  }
}

export async function getInvoiceStatus(pool: Pool, invoiceId: string): Promise<string> {
  const getStatusQuery = `
    SELECT status
    FROM invoices
    WHERE id = $1
  `;
  const getStatusParams = [invoiceId];

  try {
    const statusResult = await pool.query(getStatusQuery, getStatusParams);
    if (statusResult.rows.length === 0) {
      throw new Error(`Invoice not found with id: ${invoiceId}`);
    }

    return statusResult.rows[0].status;
  } catch (error) {
    console.error('Error getting invoice status:', error);
    throw new Error('Error getting invoice status');
  }
}