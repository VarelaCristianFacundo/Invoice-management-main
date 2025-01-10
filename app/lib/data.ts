import { Pool } from 'pg';
import {
  Area,
  AreaFund,
  CustomerField,
  CustomerForm,
  CustomersTableType,
  InvoiceForm,
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
  const ITEMS_PER_PAGE = 10;
  const offset = (currentPage - 1) * ITEMS_PER_PAGE;

  const sql = `
    SELECT 
      i.id AS invoice_id,
      i.customer_id,
      i.amount,
      i.status,
      i.date,
      i.budget_allocation_id,
      i.file,  -- Asegúrate de incluir el campo 'file'

      -- JOINEAMOS customers
      c.name        AS customer_name,
      c.email       AS customer_email,
      c.image_url   AS image_url,

      -- JOINEAMOS budget_allocations
      ba.project_id AS project_id,
      ba.area_id    AS allocation_area_id,
      ba.year       AS allocation_year,
      ba.allocated_amount,
      ba.executed_amount,
      ba.program    AS allocation_program,
      ba.half       AS allocation_half,

      -- JOINEAMOS areas
      a.name AS area_name,

      -- JOINEAMOS budgets (para sacar nombre del proyecto)
      b.project_name
      
    FROM invoices i
    LEFT JOIN customers c
      ON i.customer_id = c.id
    LEFT JOIN budget_allocations ba
      ON i.budget_allocation_id = ba.id
    LEFT JOIN areas a
      ON ba.area_id = a.id
    LEFT JOIN budgets b
      ON ba.project_id = b.id

    -- Filtrado simple (ajusta a tus campos)
    WHERE 
      c.name ILIKE $1
      OR i.amount::text ILIKE $1
      OR i.status ILIKE $1
      OR b.project_name ILIKE $1
      OR a.name ILIKE $1

    ORDER BY i.date DESC
    LIMIT $2 OFFSET $3
  `;

  const params = [`%${query}%`, ITEMS_PER_PAGE, offset];
  const { rows } = await pool.query(sql, params);

  // Devuelve el array de facturas con la data "unida"
  return rows.map((r) => ({
    id: r.invoice_id, // alias invoice_id
    customer_id: r.customer_id,
    name: r.customer_name,
    email: r.customer_email,
    image_url: r.image_url || '/default-user.png',

    amount: Number(r.amount) || 0,
    status: r.status,
    date: r.date,

    budget_allocation_id: r.budget_allocation_id,
    project_name: r.project_name, // de budgets
    area_name: r.area_name, // de areas
    year: r.allocation_year, // de budget_allocations

    file: r.file, // Añadido para incluir el archivo
  }));
}

export async function getFileBase64ByInvoiceId(
  pool: Pool,
  invoiceId: string,
): Promise<string> {
  const queryText = `
    SELECT file
    FROM invoices
    WHERE id = $1
  `;
  const queryParams = [invoiceId];

  try {
    const result = await pool.query(queryText, queryParams);
    if (result.rows.length === 0) {
      throw new Error(`No invoice found with id: ${invoiceId}`);
    }
    return result.rows[0].file;
  } catch (error) {
    console.error('Error fetching file:', error);
    throw new Error('Error fetching file');
  }
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
  const queryText = `
    SELECT COUNT(*)
    FROM budgets
    WHERE project_name ILIKE $1;
  `;
  const values = [`%${query}%`];
  const result = await pool.query(queryText, values);
  const total = parseInt(result.rows[0].count, 10);
  return Math.ceil(total / 10); // 10 ítems por página
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
export async function fetchFilteredBudgets(query: string, currentPage: number) {
  const offset = (currentPage - 1) * 10; // 10 items por página
  const queryText = `
    SELECT 
      budgets.id, 
      budgets.project_name, 
      budgets.year,
      budget_allocations.program,
      SUM(budget_allocations.allocated_amount) AS total_allocated_amount,
      SUM(budget_allocations.executed_amount) AS total_executed_amount,
      STRING_AGG(areas.name, ', ') AS area_names
    FROM budgets
    LEFT JOIN budget_allocations ON budgets.id = budget_allocations.project_id
    LEFT JOIN areas ON budget_allocations.area_id = areas.id
    WHERE 
      budgets.project_name ILIKE $1 OR 
      budgets.year::text ILIKE $1
    GROUP BY budgets.id, budget_allocations.program
    ORDER BY budgets.year DESC
    LIMIT 10 OFFSET $2;
  `;
  const values = [`%${query}%`, offset];

  console.log('SQL Query:', queryText);
  console.log('Query Values:', values);

  try {
    const result = await pool.query(queryText, values);
    console.log('Query Result:', result.rows);
    return result.rows;
  } catch (error) {
    console.error('Error executing SQL query:', error);
    throw new Error('Database error occurred');
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
    SELECT 
      budgets.id AS budget_id,
      budgets.year,
      budgets.project_name,
      budget_allocations.program,
      budget_allocations.allocated_amount,
      budget_allocations.executed_amount,
      budget_allocations.area_id,
      areas.name AS area_name
    FROM budgets
    LEFT JOIN budget_allocations ON budgets.id = budget_allocations.project_id
    LEFT JOIN areas ON budget_allocations.area_id = areas.id
    WHERE budgets.id = $1;
  `;
  const result = await pool.query(queryText, [id]);
  return result.rows[0];
}

export async function fetchRejectedBudgets() {
  /*   const queryText = `
    SELECT budgets.*, areas.name AS area_name
    FROM budgets
    LEFT JOIN areas ON budgets.area_id = areas.id
    WHERE budgets.status = 'rejected'
    ORDER BY areas.name ASC
  `; */
  const queryText = `
  SELECT *
  FROM budgets
`;
  const result = await pool.query(queryText);
  return result.rows;
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

export async function getAllYears(): Promise<number[]> {
  const queryText = `
    SELECT year
    FROM year
  `;
  try {
    const result = await pool.query(queryText);
    const years = result.rows.map((row) => row.year);
    return years;
  } catch (error) {
    console.error('Error fetching years:', error);
    throw new Error('Error fetching years');
  }
}
