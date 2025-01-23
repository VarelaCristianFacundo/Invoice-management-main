import { pool } from '@/app/lib/db';
import { NextRequest, NextResponse } from 'next/server';

export async function DELETE(
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
    // Eliminar las asignaciones relacionadas en `budget_allocations`
    const deleteAllocationsQuery =
      'DELETE FROM budget_allocations WHERE project_id = $1';
    await pool.query(deleteAllocationsQuery, [id]);

    // Ahora elimina el presupuesto
    const deleteBudgetQuery = 'DELETE FROM budgets WHERE id = $1';
    const result = await pool.query(deleteBudgetQuery, [id]);

    if (result.rowCount === 0) {
      return NextResponse.json(
        { message: 'Budget not found' },
        { status: 404 },
      );
    }

    return NextResponse.json(
      { message: 'Proyecto eliminado con éxito' },
      { status: 200 },
    );
  } catch (error) {
    console.error('Error deleting budget:', error);
    return NextResponse.json(
      { message: 'Failed to delete budget', error: error },
      { status: 500 },
    );
  }
}
