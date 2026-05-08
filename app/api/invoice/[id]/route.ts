import { pool } from '@/app/lib/db'; // Confirma que este path sea correcto
import { NextRequest, NextResponse } from 'next/server';

export async function DELETE(request: NextRequest, props: { params: Promise<{ id: string }> }) {
  const params = await props.params;
  const { id } = params;

  if (!id) {
    return NextResponse.json(
      { message: 'El ID de la factura es obligatorio' },
      { status: 400 },
    );
  }

  try {
    const queryText = 'DELETE FROM invoices WHERE id = $1';
    const result = await pool.query(queryText, [id]);

    if (result.rowCount === 0) {
      return NextResponse.json(
        { message: 'Invoice not found' },
        { status: 404 },
      );
    }

    return NextResponse.json(
      { message: 'Factura eliminada con éxito' },
      { status: 200 },
    );
  } catch (error) {
    console.error('Error deleting invoice:', error);
    return NextResponse.json(
      { message: 'No se pudo eliminar la factura' },
      { status: 500 },
    );
  }
}
