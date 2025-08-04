import { NextResponse } from 'next/server';
import { Pool } from 'pg';

const pool = new Pool({
  connectionString: process.env.POSTGRES_URL,
});

export async function POST(request: Request) {
  try {
    const body = await request.json();
    const { nombre, codigo, descripcion } = body;

    const insertQuery = `
      INSERT INTO contable_items (nombre, codigo, descripcion)
      VALUES ($1, $2, $3)
      RETURNING id, nombre, codigo, descripcion
    `;
    const params = [nombre, codigo || null, descripcion || null];

    const result = await pool.query(insertQuery, params);
    const newItem = result.rows[0];

    return NextResponse.json(newItem, { status: 201 });
  } catch (error) {
    console.error('Error creando artículo contable:', error);
    return NextResponse.json(
      { error: 'Error creando artículo contable' },
      { status: 500 },
    );
  }
}

export async function GET(request: Request) {
  try {
    const result = await pool.query(
      'SELECT id, nombre, codigo, descripcion FROM contable_items ORDER BY nombre ASC',
    );
    return NextResponse.json(result.rows);
  } catch (error) {
    console.error('Error obteniendo artículos contables:', error);
    return NextResponse.json(
      { error: 'Error obteniendo artículos contables' },
      { status: 500 },
    );
  }
}
