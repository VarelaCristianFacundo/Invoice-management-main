import { pool } from '@/app/lib/db';
import { NextRequest, NextResponse } from 'next/server';

export async function POST(
  request: NextRequest,
  { params }: { params: { id: string } },
) {
  const { id } = params;

  if (!id || id === 'undefined') {
    return NextResponse.json(
      { message: 'Invalid ID provided' },
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
    console.error('Error rejecting budget:', error);
    return NextResponse.json(
      { message: 'Failed to reject budget', error: error },
      { status: 500 },
    );
  }
}
