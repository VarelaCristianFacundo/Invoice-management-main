import { NextResponse } from 'next/server';
import { Pool } from 'pg';

const pool = new Pool({ connectionString: process.env.POSTGRES_URL });

export async function GET() {
  const query = `
    SELECT 
      i.invoice_number,
      i.issue_date,
      c.name as proveedor,
      i.amount,
      i.status,
      i.observations
    FROM invoices i
    LEFT JOIN customers c ON i.customer_id = c.id
    ORDER BY i.issue_date DESC
  `;
  try {
    const { rows } = await pool.query(query);

    // Encabezados del CSV
    const header = [
      'Número de Factura',
      'Fecha de Emisión',
      'Proveedor',
      'Monto',
      'Estado',
      'Observaciones',
    ];
    const csvRows = [
      header.join(','), // cabecera
      ...rows.map((row) =>
        [
          row.invoice_number,
          row.issue_date,
          `"${row.proveedor}"`,
          row.amount,
          row.status,
          `"${(row.observations || '').replace(/"/g, '""')}"`,
        ].join(','),
      ),
    ];
    const csv = csvRows.join('\n');

    return new NextResponse(csv, {
      headers: {
        'Content-Disposition': 'attachment; filename="facturas.txt"',
        'Content-Type': 'text/plain; charset=utf-8',
      },
    });
  } catch (err) {
    return new NextResponse('Error generando TXT', { status: 500 });
  }
}
