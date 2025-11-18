import { NextResponse } from 'next/server';
import { Pool } from 'pg';

const pool = new Pool({
  connectionString: process.env.POSTGRES_URL,
});

export async function GET(
  req: Request,
  { params }: { params: { customer_id: string } },
) {
  try {
    const { searchParams } = new URL(req.url);
    const year = searchParams.get('year');
    const status = searchParams.get('status');

    let query = `
      SELECT 
        i.id,
        i.amount,
        i.status,
        i.date,
        i.file,
        i.year,
        a.name AS area_name,
        ba.program,
        b.project_name
      FROM invoices i
      LEFT JOIN budget_allocations ba ON i.budget_allocation_id = ba.id
      LEFT JOIN areas a ON ba.area_id = a.id
      LEFT JOIN budgets b ON ba.project_id = b.id
      WHERE i.customer_id = $1
    `;

    const paramsArray = [params.customer_id];
    let paramIndex = 2;

    if (year) {
      query += ` AND i.year = $${paramIndex}`;
      paramsArray.push(year);
      paramIndex++;
    }

    if (status) {
      query += ` AND i.status = $${paramIndex}`;
      paramsArray.push(status);
    }

    query += ` ORDER BY i.date DESC`;

    const { rows } = await pool.query(query, paramsArray);
    return NextResponse.json(rows);
  } catch (error) {
    console.error('Error fetching invoices:', error);
    return NextResponse.json(
      { error: 'No se pudieron obtener las facturas' },
      { status: 500 },
    );
  }
}
