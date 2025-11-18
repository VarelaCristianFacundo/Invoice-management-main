import { NextResponse } from 'next/server';
import { Pool } from 'pg';

// Configuración de la base de datos
const pool = new Pool({
  connectionString: process.env.POSTGRES_URL,
});

const ITEMS_PER_PAGE = 10;

// Función para obtener facturas filtradas
async function fetchFilteredInvoices(
  query: string,
  currentPage: number,
  companyId: number,
) {
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
      i.observations,

      c.name AS customer_name,
      c.email AS customer_email,
      c.image_url AS image_url,

      ba.project_id,
      ba.area_id AS allocation_area_id,
      ba.year AS allocation_year,
      ba.program,
      
      a.name AS area_name,
      b.project_name
    FROM invoices i
    LEFT JOIN customers c ON i.customer_id = c.id
    LEFT JOIN budget_allocations ba ON i.budget_allocation_id = ba.id
    LEFT JOIN areas a ON ba.area_id = a.id
    LEFT JOIN budgets b ON ba.project_id = b.id
    WHERE 
      b.company_id = $1 AND (
        $2 = '' OR 
        c.name ILIKE $2 OR 
        i.amount::text ILIKE $2 OR 
        i.status ILIKE $2 OR 
        b.project_name ILIKE $2 OR 
        a.name ILIKE $2
      )
    ORDER BY i.date DESC
    LIMIT $3 OFFSET $4;
  `;

  const params = [companyId, `%${query}%`, ITEMS_PER_PAGE, offset];
  const { rows } = await pool.query(sql, params);

  return rows.map((r) => ({
    id: r.invoice_id,
    customer_id: r.customer_id,
    name: r.customer_name,
    email: r.customer_email,
    image_url: r.image_url || '/default-user.png',
    amount: Number(r.amount) || 0,
    status: r.status,
    date: r.date,
    budget_allocation_id: r.budget_allocation_id,
    project_name: r.project_name,
    area_name: r.area_name,
    year: r.allocation_year,
    file: r.file,
    program: r.program,
    observations: r.observations,
  }));
}

// Endpoint para manejar las solicitudes GET de facturas
export async function GET(req: Request) {
  try {
    const { searchParams } = new URL(req.url);

    const query = searchParams.get('query') || '';
    const currentPage = Number(searchParams.get('currentPage')) || 1;
    const companyId = Number(searchParams.get('companyId')) || 1; // Default: CAMARCO

    const invoices = await fetchFilteredInvoices(query, currentPage, companyId);

    return NextResponse.json(invoices);
  } catch (error) {
    console.error('Error fetching invoices:', error);
    return NextResponse.json(
      { error: 'No se pudieron obtener las facturas' },
      { status: 500 },
    );
  }
}

export async function POST(req: Request) {
  const body = await req.json();
  const {
    customer_id,
    amount,
    status,
    date,
    area_id,
    year,
    budget_allocation_id,
    file,
    company_id,
    observations,
  } = body;

  const insert = `
    INSERT INTO invoices
      (customer_id, amount, status, date, area_id, year, budget_allocation_id, file, company_id, observations, fecha_ingreso)
    VALUES
      ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10, CURRENT_DATE)
    RETURNING *;
  `;
  const params = [
    customer_id,
    amount,
    status,
    date,
    area_id,
    year,
    budget_allocation_id,
    file,
    company_id,
    observations ?? null,
  ];

  const { rows } = await pool.query(insert, params);
  return NextResponse.json(rows[0], { status: 201 });
}
