import { NextResponse } from 'next/server';
import { Pool } from 'pg';
import * as XLSX from 'xlsx';
import {
  AreaFund,
  AreaType,
  CustomerField,
  CustomerForm,
  CustomersTableType,
  Invoice,
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
  // 1) Contar cuántas facturas hay de cada estado
  const countResult = await pool.query(`
    SELECT
      COUNT(*) FILTER (WHERE status = 'pagado')     AS countPaid,
      COUNT(*) FILTER (WHERE status = 'aprobado')   AS countApproved,
      COUNT(*) FILTER (WHERE status = 'presentado') AS countPending,
      COUNT(*)                                     AS totalInvoices,
      COUNT(*) OVER ()                             AS totalCountAll  -- solo para ilustrar
    FROM invoices
  `)

  // 2) Sumar montos de cada estado
  const sumResult = await pool.query(`
    SELECT
      COALESCE(SUM(CASE WHEN status = 'pagado'     THEN amount END), 0)       AS sumPaid,
      COALESCE(SUM(CASE WHEN status = 'aprobado'   THEN amount END), 0)       AS sumApproved,
      COALESCE(SUM(CASE WHEN status = 'presentado' THEN amount END), 0)       AS sumPending,
      COALESCE(SUM(amount), 0)                                               AS sumAll
    FROM invoices
  `)

  // 3) Contar clientes y facturas totales
  const [custRows, invRows] = await Promise.all([
    pool.query(`SELECT COUNT(*)::int AS count FROM customers`),
    pool.query(`SELECT COUNT(*)::int AS count FROM invoices`),
  ])

  const {
    countpaid:     countPaid,
    countapproved: countApproved,
    countpending:  countPending,
    totalinvoices: totalInvoices,
  } = countResult.rows[0] as Record<string, number>

  const {
    sumpaid:     sumPaid,
    sumapproved: sumApproved,
    sumpending:  sumPending,
    sumall:      sumAll,
  } = sumResult.rows[0] as Record<string, number>

  const numberOfCustomers = custRows.rows[0].count
  const numberOfInvoices  = invRows.rows[0].count

  return {
    numberOfCustomers,
    numberOfInvoices,

    // Para “Abonado”
    countPaid:     countPaid     ?? 0,
    sumPaid:       formatCurrency(sumPaid     ?? 0),

    // Para “Aprobado”
    countApproved: countApproved ?? 0,
    sumApproved:   formatCurrency(sumApproved ?? 0),

    // Para “Pendiente”
    countPending:  countPending  ?? 0,
    sumPending:    formatCurrency(sumPending  ?? 0),
  }
}

const ITEMS_PER_PAGE = 6;
export async function fetchFilteredInvoices(
  query: string,
  currentPage: number,
): Promise<Invoice[]> {
  // Aseguramos el tipo de retorno
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
      i.file,

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
      ba.program    AS program, -- Renombramos para mayor claridad
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
    program: r.program, // Añadido para incluir el programa
    observations: r.observations, // Añadido para incluir las observaciones
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
    amount: invoice.amount, // Convertir de centavos a dólares
  }));
  return invoice[0];
}
export async function fetchCustomers() {
  const queryText = `
    SELECT
      id,
      name,
      cuit_cuil
    FROM customers
    ORDER BY name ASC
  `;
  return await queryDatabase<CustomerField>(queryText);
}

export async function fetchAreas(): Promise<AreaType[]> {
  const query = 'SELECT id, name FROM areas ORDER BY name ASC';
  const { rows } = await pool.query(query);

  return rows.map((row: { id: number; name: string }) => ({
    id: String(row.id), // conversion
    name: row.name,
  }));
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
      customers.image_url,
      cuit_cuil, 
      cbu_cvu
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

export async function fetchPrograms(): Promise<{ id: string; name: string }[]> {
  const query = 'SELECT id, name FROM programs ORDER BY name ASC';
  const { rows } = await pool.query(query);
  return rows;
}

export async function sumBudgetAllocationsByAreaYearHalf(): Promise<
  {
    area_id: string;
    area_name: string;
    year: number;
    half: number;
    executed_funds: number;
    allocated_funds: number;
  }[]
> {
  const queryText = `
  SELECT 
    ba.area_id,
    a.name AS area_name,
    ba.year,
    ba.half,
    SUM(ba.executed_amount) AS executed_funds,
    SUM(ba.allocated_amount) AS allocated_funds
  FROM 
    budget_allocations ba
  INNER JOIN 
    areas a ON ba.area_id = a.id
  GROUP BY 
    ba.area_id, a.name, ba.year, ba.half
  `;

  try {
    const result = await pool.query(queryText);
    if (result.rows.length === 0) {
      throw new Error('No budget allocations found');
    }
    return result.rows.map((row) => ({
      area_id: row.area_id,
      area_name: row.area_name,
      year: row.year,
      half: row.half,
      executed_funds: row.executed_funds || 0,
      allocated_funds: row.allocated_funds || 0,
    }));
  } catch (error) {
    console.error('Error fetching budget allocations:', error);
    throw new Error('Error fetching budget allocations');
  }
}

export async function fetchBudgetsByCompany(
  companyId: number,
  query: string,
  currentPage: number,
) {
  const offset = (currentPage - 1) * 10; // 10 elementos por página
  const sql = `
    SELECT 
      budgets.id,
      budgets.project_name,
      budgets.year,
      budgets.company_id,
      COALESCE(SUM(budget_allocations.allocated_amount), 0) AS total_allocated_amount,
      COALESCE(SUM(budget_allocations.executed_amount), 0) AS total_executed_amount,
      STRING_AGG(DISTINCT areas.name, ', ') AS area_names
    FROM budgets
    LEFT JOIN budget_allocations ON budgets.id = budget_allocations.project_id
    LEFT JOIN areas ON budget_allocations.area_id = areas.id
    WHERE 
      budgets.company_id = $1 AND 
      (budgets.project_name ILIKE $2 OR budgets.year::text ILIKE $2)
    GROUP BY budgets.id
    ORDER BY budgets.year DESC
    LIMIT 10 OFFSET $3;
  `;
  const values = [companyId, `%${query}%`, offset];

  try {
    const result = await pool.query(sql, values);
    return result.rows;
  } catch (error) {
    console.error('Error fetching budgets by company:', error);
    throw new Error('Failed to fetch budgets.');
  }
}

export async function generateExcelReport(): Promise<NextResponse> {
  const queryText = `
    SELECT 
      iv.id, 
      ci.name AS "Proveedor", 
      iv.amount AS "Monto", 
      iv.status AS "Estado", 
      iv.date AS "Fecha", 
      iv.year AS "Año", 
      ba.half AS "Semestre", 
      ar.name AS "Area", 
      co.name AS "Cliente", 
      ba.program AS "Programa",
      bu.project_name AS "Proyecto"
    FROM 
      invoices iv
    LEFT JOIN 
      customers ci ON iv.customer_id = ci.id
    LEFT JOIN 
      companies co ON iv.company_id = co.id
    LEFT JOIN 
      budget_allocations ba ON iv.budget_allocation_id = ba.id
    LEFT JOIN 
      budgets bu ON ba.project_id = bu.id
    LEFT JOIN 
      areas ar ON iv.area_id = ar.id;
  `;

  try {
    const result = await pool.query(queryText);
    const rows = result.rows;

    // Crear un nuevo workbook y worksheet
    const wb = XLSX.utils.book_new();
    const ws = XLSX.utils.json_to_sheet(rows);

    // Agregar la worksheet al workbook
    XLSX.utils.book_append_sheet(wb, ws, 'Report');

    // Escribir el workbook a un buffer
    const buffer = XLSX.write(wb, { type: 'buffer', bookType: 'xlsx' });

    // Crear una respuesta con el buffer
    const response = new NextResponse(buffer, {
      headers: {
        'Content-Disposition': 'attachment; filename=report.xlsx',
        'Content-Type':
          'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
      },
    });

    return response;
  } catch (error) {
    console.error('Error generating Excel report:', error);
    return new NextResponse('Error generating Excel report', { status: 500 });
  }
}
