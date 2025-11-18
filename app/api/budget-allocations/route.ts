import { db } from '@/app/lib/db';
import { NextResponse } from 'next/server';

export async function POST(req: Request) {
  const { area, year, allocatedAmount, program, half } = await req.json();

  if (!area || !year || !allocatedAmount || !program || !half) {
    return NextResponse.json(
      { error: 'Todos los campos son obligatorios' },
      { status: 400 },
    );
  }

  const result = await db.query(
    `
    INSERT INTO budget_allocations (area_id, year, allocated_amount, program, half)
    VALUES ($1, $2, $3, $4, $5)
    ON CONFLICT (area_id, year, half)
    DO UPDATE SET allocated_amount = EXCLUDED.allocated_amount,
                  program = EXCLUDED.program
    RETURNING *;
    `,
    [area, year, allocatedAmount, program, half],
  );

  return NextResponse.json(result.rows[0]);
}

export async function GET() {
  try {
    // Actualizamos la consulta para tomar company_id desde la tabla budgets (alias b)
    const result = await db.query(`
      SELECT
        ba.id,
        ba.area_id,
        a.name AS area_name,
        ba.year,
        ba.allocated_amount,
        ba.executed_amount,
        ba.program,
        ba.half,
        ba.project_id,
        b.project_name,
        b.company_id
      FROM budget_allocations ba
      LEFT JOIN areas a ON ba.area_id = a.id
      LEFT JOIN budgets b ON ba.project_id = b.id
      ORDER BY b.project_name, a.name;
    `);

    return NextResponse.json(result.rows);
  } catch (error) {
    console.error('Error fetching budget_allocations with joins:', error);
    return NextResponse.json(
      { error: 'No se pudieron obtener las asignaciones del presupuesto.' },
      { status: 500 },
    );
  }
}
