import { pool } from '@/app/lib/db';
import { NextResponse } from 'next/server';

export async function POST(
  request: Request,
  { params }: { params: { id: string } },
) {
  try {
    const budgetId = params.id;
    const queryText = `
      UPDATE budgets
      SET status = 'rejected'
      WHERE id = $1
    `;
    await pool.query(queryText, [budgetId]);
    return NextResponse.json({ message: 'Budget rejected successfully' });
  } catch (error) {
    console.error('Error rejecting budget:', error);
    return NextResponse.json(
      { error: 'Failed to reject budget' },
      { status: 500 },
    );
  }
}
