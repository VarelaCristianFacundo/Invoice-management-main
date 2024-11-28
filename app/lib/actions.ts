'use server';
import { signIn } from 'next-auth/react';
import { revalidatePath } from 'next/cache';
import { redirect } from 'next/navigation';
import { Pool } from 'pg';
import { z } from 'zod';

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

type BudgetParams = {
  year: string; // O number si prefieres
  area: string;
  program: string;
  project: string;
  customerId: string;
  concept: string;
  amount: number;
  status: 'pending' | 'approved';
};

const BudgetSchema = z.object({
  year: z.string(),
  area: z.string().nonempty({ message: 'Area is required.' }),
  program: z.string(),
  project: z.string(),
  customerId: z.string(),
  concept: z.string(),
  amount: z.coerce.number().positive(),
  status: z.enum(['pending', 'approved']),
});

const CreateInvoice = FormSchema.omit({ id: true, date: true });
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

export async function createInvoice(prevState: State, formData: FormData) {
  const validatedFields = CreateInvoice.safeParse({
    customerId: formData.get('customerId'),
    amount: formData.get('amount'),
    status: formData.get('status'),
  });

  if (!validatedFields.success) {
    return {
      errors: validatedFields.error.flatten().fieldErrors,
      message: 'Missing Fields. Failed to Create Invoice.',
    };
  }

  const { customerId, amount, status } = validatedFields.data;
  console.log(validatedFields.data);
  const amountInCents = amount * 100;
  const date = new Date().toISOString().split('T')[0];
  console.log(date);

  try {
    console.log('Inserting data into database');
    const queryText = `
        INSERT INTO invoices (customer_id, amount, status, date)
        VALUES ($1, $2, $3, $4)
      `;
    const params = [customerId, amountInCents, status, date];
    await pool.query(queryText, params);
  } catch (error) {
    console.error('Database Error:', error);
    return {
      message: 'Database Error: Failed to Create Invoice.',
    };
  }

  revalidatePath('/dashboard/invoices');
  redirect('/dashboard/invoices');
}

// app/lib/actions.ts

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

export async function addCustomer(
  prevState: CustomerState,
  formData: FormData,
) {
  console.log(prevState, 'prev state goes here');
  const validatedFields = AddCustomer.safeParse({
    name: formData.get('name'),
    email: formData.get('email'),
  });

  if (!validatedFields.success) {
    return {
      errors: validatedFields.error.flatten().fieldErrors,
      message: 'Missing Fields. Failed to Add Customer.',
    };
  }

  const { name, email } = validatedFields.data;
  console.log(validatedFields.data);

  try {
    console.log('Inserting data into database');
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
const UpdateCustomer = CustomerFormSchema.omit({ id: true, date: true });

export async function updateInvoice(id: string, formData: FormData) {
  const validatedFields = UpdateInvoice.safeParse({
    customerId: formData.get('customerId'),
    amount: formData.get('amount'),
    status: formData.get('status'),
  });

  if (!validatedFields.success) {
    return {
      errors: validatedFields.error.flatten().fieldErrors,
      message: 'Missing Fields. Failed to Update Invoice.',
    };
  }

  const { customerId, amount, status } = validatedFields.data;
  const amountInCents = amount * 100;

  try {
    const queryText = `
      UPDATE invoices
      SET customer_id = $1, amount = $2, status = $3
      WHERE id = $4
    `;
    const params = [customerId, amountInCents, status, id];
    await pool.query(queryText, params);
  } catch (error) {
    console.error('Database Error:', error);
    return { message: 'Database Error: Failed to Update Invoice.' };
  }

  revalidatePath('/dashboard/invoices');
  redirect('/dashboard/invoices');
}

export async function createBudget({
  year,
  area,
  program,
  project,
  customerId,
  concept,
  amount,
  status,
}: BudgetParams) {
  console.log('Datos recibidos:', {
    year,
    area,
    program,
    project,
    customerId,
    concept,
    amount,
    status,
  });

  // Verificar y validar los datos de entrada
  if (!area || typeof area !== 'string') {
    throw new Error('El área es obligatoria y debe ser una cadena válida.');
  }

  const queryText = `
  INSERT INTO budgets (year, area, program, project, customer_id, concept, amount, status, date)
  VALUES ($1, $2, $3, $4, $5, $6, $7, $8, CURRENT_DATE)
`;
  const values = [
    year,
    area,
    program,
    project,
    customerId,
    concept,
    amount,
    status,
  ];

  try {
    await pool.query(queryText, values);
    console.log('Presupuesto creado:', values);
  } catch (error) {
    console.error('Error al insertar presupuesto:', error);
    throw new Error('No se pudo crear el presupuesto.');
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
  const values = [
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
    const result = await pool.query(queryText, values);
    if (result.rowCount === 0) {
      console.error('No budget found with the specified ID');
      throw new Error('No budget found to update');
    }
    revalidatePath('/dashboard/budgets'); // Mantén solo la revalidación de la caché
  } catch (error) {
    console.error('Error updating budget:', error);
    throw new Error('Database update failed');
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

export async function updateCustomer(id: string, formData: FormData) {
  const validatedFields = UpdateCustomer.safeParse({
    name: formData.get('name'),
    email: formData.get('email'),
  });

  if (!validatedFields.success) {
    return {
      errors: validatedFields.error.flatten().fieldErrors,
      message: 'Missing Fields. Failed to Update Customer.',
    };
  }

  const { name, email } = validatedFields.data;

  try {
    const queryText = `
      UPDATE customers
      SET name = $1, email = $2
      WHERE id = $3
    `;
    const params = [name, email, id];
    await pool.query(queryText, params);
  } catch (error) {
    console.error('Database Error:', error);
    return { message: 'Database Error: Failed to Update Customer.' };
  }

  revalidatePath('/dashboard/customers');
  redirect('/dashboard/customers');
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

export async function authenticate(
  prevState: string | undefined,
  formData: FormData,
) {
  try {
    const res = await signIn('credentials', {
      redirect: false,
      email: formData.get('email') as string,
      password: formData.get('password') as string,
    });

    if (res?.error) {
      console.error('Authentication failed:', res.error);
      switch (res.error) {
        case 'CredentialsSignin':
          return 'Invalid credentials.';
        default:
          return 'Something went wrong. Please try again.';
      }
    }

    // Redirige al dashboard o realiza otras acciones
    redirect('/dashboard');
  } catch (error) {
    console.error('Unexpected error during authentication:', error);
    throw new Error('Authentication process failed.');
  }
}
