import { NextResponse } from 'next/server';
import { Pool } from 'pg';
const pool = new Pool({ connectionString: process.env.POSTGRES_URL });

export async function GET() {
  const { rows } = await pool.query(
    'SELECT * FROM contable_items ORDER BY nombre ASC',
  );
  return NextResponse.json(rows);
}

export async function POST(req: { json: () => PromiseLike<{ nombre: any; codigo: any; descripcion: any; }> | { nombre: any; codigo: any; descripcion: any; }; }) {
    const { nombre, codigo, descripcion } = await req.json();
    const { rows } = await pool.query(
      'INSERT INTO contable_items (nombre, codigo, descripcion) VALUES ($1, $2, $3) RETURNING *',
      [nombre, codigo, descripcion]
    );
    return NextResponse.json(rows[0]);
  }
  