import { unstable_noStore as noStore } from 'next/cache';
import { Pool } from 'pg';
import {
  Area,
  AreaFund,
  CustomerField,
  CustomerForm,
  CustomersTableType,
  InvoiceForm,
  InvoicesTable,
  LatestInvoiceRaw,
  Revenue,
  User,
} from './definitions';
import { formatCurrency } from './utils';

// Configurar el pool de conexiones
const pool = new Pool({
  connectionString: process.env.POSTGRES_URL,
});

// Función para ejecutar consultas y manejar errores
async function queryDatabase<T>(
  queryText: string,
  params?: any[],
): Promise<T[]> {
  noStore();
  try {
    const { rows } = await pool.query(queryText, params);
    return rows;
  } catch (error) {
    console.error('Database Error:', error);
    throw new Error('Failed to execute database query.');
  }
}

export async function fetchRevenue() {
  const queryText = 'SELECT * FROM revenue';
  return await queryDatabase<Revenue>(queryText);
}

export async function fetchLatestInvoices() {
  const queryText = `
    SELECT invoices.amount, customers.name, customers.image_url, customers.email, invoices.id
    FROM invoices
    JOIN customers ON invoices.customer_id = customers.id
    ORDER BY invoices.date DESC
    LIMIT 5
  `;
  const invoices = await queryDatabase<LatestInvoiceRaw>(queryText);
  return invoices.map((invoice) => ({
    ...invoice,
    amount: formatCurrency(invoice.amount),
  }));
}

export async function fetchCardData() {
  try {
    // Ejecutar consultas en paralelo
    const [invoiceCountResult, customerCountResult, invoiceStatusResult] =
      await Promise.all([
        pool.query('SELECT COUNT(*) FROM invoices'),
        pool.query('SELECT COUNT(*) FROM customers'),
        pool.query(`
        SELECT
          SUM(CASE WHEN status = 'paid' THEN amount ELSE 0 END) AS "paid",
          SUM(CASE WHEN status = 'pending' THEN amount ELSE 0 END) AS "pending"
        FROM invoices
      `),
      ]);

    const numberOfInvoices = Number(invoiceCountResult.rows[0].count ?? '0');
    const numberOfCustomers = Number(customerCountResult.rows[0].count ?? '0');
    const totalPaidInvoices = formatCurrency(
      invoiceStatusResult.rows[0].paid ?? '0',
    );
    const totalPendingInvoices = formatCurrency(
      invoiceStatusResult.rows[0].pending ?? '0',
    );

    return {
      numberOfCustomers,
      numberOfInvoices,
      totalPaidInvoices,
      totalPendingInvoices,
    };
  } catch (error) {
    console.error('Database Error:', error);
    throw new Error('Failed to fetch card data.');
  }
}

const ITEMS_PER_PAGE = 6;
export async function fetchFilteredInvoices(
  query: string,
  currentPage: number,
) {
  const offset = (currentPage - 1) * ITEMS_PER_PAGE;
  const queryText = `
    SELECT
      invoices.id,
      invoices.amount,
      invoices.date,
      invoices.status,
      customers.name,
      customers.email,
      customers.image_url
    FROM invoices
    JOIN customers ON invoices.customer_id = customers.id
    WHERE
      customers.name ILIKE $1 OR
      customers.email ILIKE $1 OR
      invoices.amount::text ILIKE $1 OR
      invoices.date::text ILIKE $1 OR
      invoices.status ILIKE $1
    ORDER BY invoices.date DESC
    LIMIT $2 OFFSET $3
  `;
  const params = [`%${query}%`, ITEMS_PER_PAGE, offset];
  return await queryDatabase<InvoicesTable>(queryText, params);
}

export async function fetchInvoicesPages(query: string) {
  const queryText = `
    SELECT COUNT(*)
    FROM invoices
    JOIN customers ON invoices.customer_id = customers.id
    WHERE
      customers.name ILIKE $1 OR
      customers.email ILIKE $1 OR
      invoices.amount::text ILIKE $1 OR
      invoices.date::text ILIKE $1 OR
      invoices.status ILIKE $1
  `;
  const params = [`%${query}%`];
  const countResult = await queryDatabase<{ count: string }>(queryText, params);
  const totalPages = Math.ceil(Number(countResult[0].count) / ITEMS_PER_PAGE);
  return totalPages;
}

export async function fetchInvoiceById(id: string) {
  const queryText = `
    SELECT
      invoices.id,
      invoices.customer_id,
      invoices.amount,
      invoices.status
    FROM invoices
    WHERE invoices.id = $1
  `;
  const params = [id];
  const invoices = await queryDatabase<InvoiceForm>(queryText, params);
  const invoice = invoices.map((invoice) => ({
    ...invoice,
    amount: invoice.amount / 100, // Convertir de centavos a dólares
  }));
  return invoice[0];
}

export async function fetchCustomers() {
  const queryText = `
    SELECT
      id,
      name
    FROM customers
    ORDER BY name ASC
  `;
  return await queryDatabase<CustomerField>(queryText);
}

export async function fetchAreas(): Promise<Area[]> {
  const queryText = 'SELECT * FROM areas ORDER BY name ASC';
  const result = await pool.query(queryText);
  return result.rows;
}

export async function fetchAreaFunds(): Promise<AreaFund[]> {
  const queryText = `
    SELECT af.*, a.name as area_name
    FROM area_funds af
    JOIN areas a ON af.area_id = a.id
    ORDER BY a.name ASC
  `;
  const result = await pool.query(queryText);
  return result.rows;
}

export async function updateAreaFund(
  area_id: number,
  amount: number,
): Promise<void> {
  const queryText = `
    INSERT INTO area_funds (area_id, allocated_funds)
    VALUES ($1, $2)
    ON CONFLICT (area_id) DO UPDATE SET allocated_funds = $2
  `;
  await pool.query(queryText, [area_id, amount]);
}

export async function fetchFilteredCustomers(
  query: string,
  currentPage: number,
) {
  const offset = (currentPage - 1) * ITEMS_PER_PAGE;
  const queryText = `
    SELECT *
    FROM (
        SELECT
            customers.id,
            customers.name,
            customers.email,
            customers.image_url,
            COUNT(invoices.id) AS total_invoices,
            SUM(CASE WHEN invoices.status = 'pending' THEN invoices.amount ELSE 0 END) AS total_pending,
            SUM(CASE WHEN invoices.status = 'paid' THEN invoices.amount ELSE 0 END) AS total_paid
        FROM customers
        LEFT JOIN invoices ON customers.id = invoices.customer_id
        GROUP BY customers.id, customers.name, customers.email, customers.image_url
    ) AS subquery
    WHERE 
        name ILIKE $1 OR
        email ILIKE $1 OR
        total_invoices::text ILIKE $1
    ORDER BY name ASC
    LIMIT $2 OFFSET $3
  `;
  const params = [`%${query}%`, ITEMS_PER_PAGE, offset];
  return await queryDatabase<CustomersTableType>(queryText, params);
}

export async function fetchCustomersPages(query: string) {
  const queryText = `
    SELECT COUNT(*)
    FROM customers
    WHERE
      name ILIKE $1 OR
      email ILIKE $1
  `;
  const params = [`%${query}%`];
  const countResult = await queryDatabase<{ count: string }>(queryText, params);
  const totalPages = Math.ceil(Number(countResult[0].count) / ITEMS_PER_PAGE);
  return totalPages;
}

export async function fetchCustomerById(id: string) {
  const queryText = `
    SELECT
      customers.id,
      customers.name,
      customers.email,
      customers.image_url
    FROM customers
    WHERE customers.id = $1
  `;
  const params = [id];
  const customers = await queryDatabase<CustomerForm>(queryText, params);
  return customers[0];
}

export async function fetchBudgetsPages(query: string): Promise<number> {
  try {
    const queryText = `
      SELECT COUNT(*)
      FROM budgets
      WHERE LOWER(status) LIKE $1
    `;
    const values = [`%${query.toLowerCase()}%`];
    const result = await pool.query(queryText, values);

    const count = parseInt(result.rows[0].count, 10);
    const itemsPerPage = 10;
    return Math.ceil(count / itemsPerPage);
  } catch (error) {
    console.error('Error fetching budgets pages:', error);
    return 1;
  }
}

export async function fetchAreasWithFunds() {
  const queryText = `
    SELECT
      areas.id,
      areas.name,
      area_funds.allocated_funds
    FROM areas
    LEFT JOIN area_funds ON areas.id = area_funds.area_id
    ORDER BY areas.name ASC
  `;
  const result = await pool.query(queryText);
  return result.rows;
}
export async function fetchFilteredBudgets(
  query: string,
  page: number = 1,
): Promise<any[]> {
  const itemsPerPage = 10;
  const offset = (page - 1) * itemsPerPage;

  try {
    const queryText = `
      SELECT
        budgets.id,
        budgets.year,
        budgets.program,
        budgets.project,
        budgets.area,
        customers.name AS provider_name,
        customers.image_url AS provider_image,
        budgets.concept,
        budgets.amount,
        budgets.date,
        budgets.status
      FROM budgets
      JOIN customers ON budgets.customer_id = customers.id
      WHERE LOWER(budgets.status) LIKE $1
      ORDER BY budgets.date DESC
      LIMIT $2 OFFSET $3  
    `;
    const values = [`%${query.toLowerCase()}%`, itemsPerPage, offset];
    const result = await pool.query(queryText, values);

    return result.rows;
  } catch (error) {
    console.error('Error fetching filtered budgets:', error);
    return [];
  }
}
export async function getAreaFunds(areaId: string) {
  const queryText = `
    SELECT allocated_funds
    FROM area_funds
    WHERE area_id = $1
  `;
  const result = await pool.query(queryText, [areaId]);
  return result.rows[0]?.allocated_funds || 0;
}
export async function fetchBudgetById(id: string) {
  const queryText = `
      SELECT id, year, program, project, customer_id, concept, amount, date, status
      FROM budgets
      WHERE id = $1
  `;
  const values = [id];
  const result = await pool.query(queryText, values);
  return result.rows[0];
}

export async function fetchCustomersData() {
  const queryText = `
    SELECT
      customers.id,
      customers.name,
      customers.email,
      customers.image_url,
      COUNT(invoices.id) AS total_invoices,
      SUM(CASE WHEN invoices.status = 'pending' THEN invoices.amount ELSE 0 END) AS total_pending,
      SUM(CASE WHEN invoices.status = 'paid' THEN invoices.amount ELSE 0 END) AS total_paid
    FROM customers
    LEFT JOIN invoices ON customers.id = invoices.customer_id
    GROUP BY customers.id, customers.name, customers.email, customers.image_url
    ORDER BY customers.name ASC
  `;
  const customers = await queryDatabase<CustomersTableType>(queryText);
  return customers.map((customer) => ({
    ...customer,
    total_pending: formatCurrency(customer.total_pending),
    total_paid: formatCurrency(customer.total_paid),
  }));
}

export async function getUser(email: string) {
  const queryText = 'SELECT * FROM users WHERE email = $1';
  const params = [email];
  const users = await queryDatabase<User>(queryText, params);
  return users[0];
}
