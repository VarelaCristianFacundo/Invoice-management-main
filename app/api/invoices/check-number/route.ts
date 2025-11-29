import { pool } from '@/app/lib/db';
import { NextRequest, NextResponse } from 'next/server';

export async function GET(request: NextRequest) {
  const { searchParams } = new URL(request.url);
  const invoiceNumber = searchParams.get('invoice_number');
  const excludeId = searchParams.get('excludeId');

  if (!invoiceNumber) {
    return NextResponse.json(
      { message: 'invoice_number is required', exists: false },
      { status: 400 },
    );
  }

  try {
    let query = 'SELECT id FROM invoices WHERE invoice_number = $1';
    const params: string[] = [invoiceNumber];

    if (excludeId) {
      query += ' AND id <> $2';
      params.push(excludeId);
    }

    const result = await pool.query(query, params);
    const exists = result.rows.length > 0;

    return NextResponse.json({ exists });
  } catch (error) {
    console.error('Error checking invoice number:', error);
    return NextResponse.json(
      { message: 'Error checking invoice number', exists: false },
      { status: 500 },
    );
  }
}
