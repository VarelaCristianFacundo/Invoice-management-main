import { pool } from '@/app/lib/db';
import { NextRequest, NextResponse } from 'next/server';

export async function GET(_req: NextRequest, props: { params: Promise<{ id: string }> }) {
  const params = await props.params;
  const { id } = params;

  try {
    const result = await pool.query('SELECT file FROM invoices WHERE id = $1', [
      id,
    ]);

    if (result.rows.length === 0 || !result.rows[0].file) {
      return new NextResponse('File not found', { status: 404 });
    }

    const file: string = result.rows[0].file;
    const prefix = 'data:application/pdf;base64,';

    let base64 = file;
    if (file.startsWith(prefix)) {
      base64 = file.slice(prefix.length);
    }

    if (!base64 || base64.trim() === '') {
      return new NextResponse('File empty', { status: 404 });
    }

    const buffer = Buffer.from(base64, 'base64');

    return new NextResponse(buffer, {
      status: 200,
      headers: {
        'Content-Type': 'application/pdf',
        'Content-Length': buffer.length.toString(),
        'Content-Disposition': 'inline; filename="invoice.pdf"',
      },
    });
  } catch (error) {
    console.error('Error serving invoice pdf:', error);
    return new NextResponse('Internal Server Error', { status: 500 });
  }
}
