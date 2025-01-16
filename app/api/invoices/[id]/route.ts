import { NextResponse } from 'next/server';
import { Pool } from 'pg';

// Configuración de la base de datos
const pool = new Pool({
  connectionString: process.env.POSTGRES_URL,
});

// Obtener una factura por ID
export async function GET(
  req: Request,
  { params }: { params: { id: string } },
) {
  try {
    const { id } = params;

    const sql = `
      SELECT 
        i.id AS invoice_id,
        i.customer_id,
        i.amount,
        i.status,
        i.date,
        i.budget_allocation_id,
        i.file,

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
      WHERE i.id = $1;
    `;

    const { rows } = await pool.query(sql, [id]);
    if (rows.length === 0) {
      return NextResponse.json({ error: 'Invoice not found' }, { status: 404 });
    }

    const invoice = rows[0];
    return NextResponse.json(invoice);
  } catch (error) {
    console.error('Error fetching invoice:', error);
    return NextResponse.json(
      { error: 'Failed to fetch invoice' },
      { status: 500 },
    );
  }
}
