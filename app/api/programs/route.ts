// app/api/programs/route.ts
import { NextResponse } from 'next/server';
import { Pool } from 'pg';

const pool = new Pool({
  connectionString: process.env.POSTGRES_URL,
});

export async function GET() {
  const result = await pool.query(
    'SELECT id, name FROM programs ORDER BY name',
  );
  return NextResponse.json(result.rows);
}

export async function POST(request: Request) {
  const { name } = await request.json();
  if (!name) {
    return NextResponse.json({ error: 'Name is required' }, { status: 400 });
  }
  try {
    const result = await pool.query(
      `INSERT INTO programs (name) VALUES ($1) RETURNING id, name`,
      [name],
    );
    // No se realiza redirect, solo se retorna el programa creado.
    return NextResponse.json(result.rows[0]);
  } catch (error) {
    console.error('Error creating program:', error);
    return NextResponse.json(
      { error: 'Failed to create program' },
      { status: 500 },
    );
  }
}
