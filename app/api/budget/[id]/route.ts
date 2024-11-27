import { pool } from '@/app/lib/db'; // Asegúrate de que la ruta sea correcta y que 'pool' esté exportado adecuadamente.
import { NextRequest, NextResponse } from 'next/server';

export async function DELETE(
  request: NextRequest,
  { params }: { params: { id: string } },
) {
  const { id } = params;

  try {
    // Ejecutar la consulta para eliminar el presupuesto
    const queryText = 'DELETE FROM budgets WHERE id = $1';
    const result = await pool.query(queryText, [id]);

    if (result.rowCount === 0) {
      return NextResponse.json(
        { message: 'Budget not found' },
        { status: 404 },
      );
    }

    return NextResponse.json(
      { message: 'Budget deleted successfully' },
      { status: 200 },
    );
  } catch (error) {
    console.error('Error deleting budget:', error);
    return NextResponse.json(
      { message: 'Failed to delete budget' },
      { status: 500 },
    );
  }
}
