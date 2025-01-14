// app/api/invoices/[id]/reject/route.ts
import { pool } from '@/app/lib/db';
import { NextRequest, NextResponse } from 'next/server';

export async function POST(
  request: NextRequest,
  { params }: { params: { id: string } },
) {
  const { id } = params;
  if (!id) {
    return NextResponse.json(
      { message: 'Invoice ID is required' },
      { status: 400 },
    );
  }

  try {
    const queryText = `
      UPDATE invoices
      SET status = 'rechazado'
      WHERE id = $1
    `;
    const result = await pool.query(queryText, [id]);
    if (result.rowCount === 0) {
      return NextResponse.json(
        { message: 'Invoice not found' },
        { status: 404 },
      );
    }
    return NextResponse.json({ message: 'Invoice rejected successfully' });
  } catch (error) {
    console.error('Error rejecting invoice:', error);
    return NextResponse.json(
      { message: 'Failed to reject invoice' },
      { status: 500 },
    );
  }
}
