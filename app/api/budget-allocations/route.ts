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
  const result = await db.query('SELECT * FROM budget_allocations');
  return NextResponse.json(result.rows);
}
