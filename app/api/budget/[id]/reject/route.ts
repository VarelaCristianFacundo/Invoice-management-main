import { pool } from '@/app/lib/db';
import { NextRequest, NextResponse } from 'next/server';

export async function POST(request: NextRequest, props: { params: Promise<{ id: string }> }) {
  const params = await props.params;
  const { id } = params;

  if (!id || id === 'undefined') {
    return NextResponse.json(
      { message: 'ID inválido proporcionado' },
      { status: 400 },
    );
  }

  try {
    const queryText = `
      UPDATE budgets
      SET status = 'rejected'
      WHERE id = $1
    `;
    const result = await pool.query(queryText, [id]);

    if (result.rowCount === 0) {
      return NextResponse.json(
        { message: 'Budget not found' },
        { status: 404 },
      );
    }

    return NextResponse.json(
      { message: 'Budget rejected successfully' },
      { status: 200 },
    );
  } catch (error) {
    console.error('Falló en rechazar el presupuesto:', error);
    return NextResponse.json(
      { message: 'Falló en rechazar el presupuesto', error: error },
      { status: 500 },
    );
  }
}
