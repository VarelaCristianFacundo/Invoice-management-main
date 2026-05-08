import { pool } from '@/app/lib/db';
import { NextRequest, NextResponse } from 'next/server';

export async function GET(request: NextRequest) {
  const { searchParams } = new URL(request.url);
  const invoiceNumber = searchParams.get('invoice_number');
  const excludeId = searchParams.get('excludeId');
  const customerId = searchParams.get('customerId');

  if (!invoiceNumber) {
    return NextResponse.json(
      { message: 'invoice_number is required', exists: false },
      { status: 400 },
    );
  }

  try {
    let query = 'SELECT id FROM invoices WHERE invoice_number = $1';
    const params: string[] = [invoiceNumber];

    // Unicidad por proveedor (customer_id)
    if (customerId) {
      params.push(customerId);
      query += ` AND customer_id = $${params.length}`;
    }

    if (excludeId) {
      params.push(excludeId);
      query += ` AND id <> $${params.length}`;
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
