import { createBudget } from '@/app/lib/actions';
import { NextRequest, NextResponse } from 'next/server';
import { Pool } from 'pg';

const pool = new Pool({
  connectionString: process.env.POSTGRES_URL,
});

export async function GET(req: NextRequest) {
  try {
    const { searchParams } = req.nextUrl;

    const companyId = parseInt(searchParams.get('companyId') || '0', 10);
    const query = searchParams.get('query') || '';
    const currentPage = parseInt(searchParams.get('currentPage') || '1', 10);
    const limit = 10;
    const offset = (currentPage - 1) * limit;

    if (!companyId) {
      return NextResponse.json(
        { error: 'CompanyId is required' },
        { status: 400 },
      );
    }

    const sql = `
      SELECT 
        budgets.id AS budget_id,
        budgets.project_name,
        budgets.year,
        budgets.company_id,
        COALESCE(budget_allocations.program, 'No Program') AS program,
        COALESCE(SUM(budget_allocations.allocated_amount), 0) AS total_allocated_amount,
        COALESCE(SUM(budget_allocations.executed_amount), 0) AS total_executed_amount,
        COALESCE(STRING_AGG(areas.name, ', '), 'No Areas') AS area_names
      FROM budgets
      LEFT JOIN budget_allocations ON budgets.id = budget_allocations.project_id
      LEFT JOIN areas ON budget_allocations.area_id = areas.id
      WHERE 
        budgets.company_id = $1
        AND ($2 = '' OR budgets.project_name ILIKE $2 OR budgets.year::text ILIKE $2)
      GROUP BY budgets.id, budget_allocations.program
      ORDER BY budgets.year DESC
      LIMIT $3 OFFSET $4;
    `;

    const values = [companyId, `%${query}%`, limit, offset];
    const result = await pool.query(sql, values);

    if (result.rowCount === 0) {
      return NextResponse.json(
        { message: 'No budgets found.' },
        { status: 404 },
      );
    }

    return NextResponse.json(result.rows, { status: 200 });
  } catch (error) {
    console.error('Error fetching budgets:', error);
    return NextResponse.json(
      { error: 'Internal Server Error' },
      { status: 500 },
    );
  }
}

export async function POST(request: Request) {
  try {
    const body = await request.json();
    const {
      id,
      year,
      areaId,
      program,
      projectId,
      allocated_amount,
      half,
      company_id,
    } = body; // Incluimos company_id

    if (!company_id) {
      return NextResponse.json(
        { error: 'Company ID is required' },
        { status: 400 },
      );
    }

    await createBudget({
      id,
      year,
      areaId,
      program,
      projectId,
      allocated_amount,
      half,
      company_id, // Enviamos company_id a la función
    });

    return NextResponse.json(
      { message: 'Proyecto  creado satisfactoriamente' },
      { status: 201 },
    );
  } catch (error) {
    console.error('Error in /api/budget route:', error);
    return NextResponse.json(
      { error: 'Error creating budget' },
      { status: 500 },
    );
  }
}
