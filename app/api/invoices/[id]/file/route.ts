import { pool } from '@/app/lib/db';
import { NextRequest, NextResponse } from 'next/server';

/** Detect MIME type and data-URI prefix from the stored base64 string */
function detectFileType(file: string): { mime: string; prefix: string; ext: string } {
  const types: { prefix: string; mime: string; ext: string }[] = [
    { prefix: 'data:application/pdf;base64,', mime: 'application/pdf', ext: 'pdf' },
    { prefix: 'data:image/png;base64,', mime: 'image/png', ext: 'png' },
    { prefix: 'data:image/jpeg;base64,', mime: 'image/jpeg', ext: 'jpg' },
    { prefix: 'data:image/jpg;base64,', mime: 'image/jpg', ext: 'jpg' },
    { prefix: 'data:image/webp;base64,', mime: 'image/webp', ext: 'webp' },
  ];

  for (const t of types) {
    if (file.startsWith(t.prefix)) return t;
  }

  // Fallback: assume PDF
  return { prefix: 'data:application/pdf;base64,', mime: 'application/pdf', ext: 'pdf' };
}

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
    const { mime, prefix, ext } = detectFileType(file);

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
        'Content-Type': mime,
        'Content-Length': buffer.length.toString(),
        'Content-Disposition': `inline; filename="invoice.${ext}"`,
      },
    });
  } catch (error) {
    console.error('Error serving invoice file:', error);
    return new NextResponse('Internal Server Error', { status: 500 });
  }
}
