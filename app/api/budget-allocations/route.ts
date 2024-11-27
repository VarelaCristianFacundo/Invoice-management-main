import { db } from '@/app/lib/db';
import { NextResponse } from 'next/server';

export async function POST(req: Request) {
  const { area, year, allocatedAmount } = await req.json();

  if (!area || !year || !allocatedAmount) {
    return NextResponse.json(
      { error: 'Todos los campos son obligatorios' },
      { status: 400 },
    );
  }

  const result = await db.query(
    `
    INSERT INTO budget_allocations (area, year, allocated_amount)
    VALUES ($1, $2, $3)
    ON CONFLICT (area, year)
    DO UPDATE SET allocated_amount = EXCLUDED.allocated_amount
    RETURNING *;
    `,
    [area, year, allocatedAmount],
  );

  return NextResponse.json(result.rows[0]);
}

// GET: Listar partidas presupuestarias
export async function GET(req: Request) {
  const result = await db.query('SELECT * FROM budget_allocations');
  return NextResponse.json(result.rows);
}
