import { NextResponse } from 'next/server';
import { Pool } from 'pg';

// Configuración de la base de datos
const pool = new Pool({
  connectionString: process.env.POSTGRES_URL,
});

// Obtener facturas de un proveedor específico
export async function GET(
  req: Request,
  { params }: { params: { customer_id: string } },
) {
  try {
    const { customer_id } = params;

    const sql = `
      SELECT 
        i.id AS invoice_id,
        i.amount,
        i.status,
        i.date,
        i.file,
        ba.project_id,
        ba.area_id,
        ba.program,
        ba.year,
        a.name AS area_name,
        b.project_name
      FROM invoices i
      LEFT JOIN budget_allocations ba ON i.budget_allocation_id = ba.id
      LEFT JOIN areas a ON ba.area_id = a.id
      LEFT JOIN budgets b ON ba.project_id = b.id
      WHERE i.customer_id = $1
      ORDER BY i.date DESC;
    `;

    const { rows } = await pool.query(sql, [customer_id]);

    return NextResponse.json(rows);
  } catch (error) {
    console.error('Error fetching invoices:', error);
    return NextResponse.json(
      { error: 'Failed to fetch invoices.' },
      { status: 500 },
    );
  }
}
