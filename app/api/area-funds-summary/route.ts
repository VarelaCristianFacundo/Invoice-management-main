import { NextRequest, NextResponse } from 'next/server';
import { Pool } from 'pg';

const pool = new Pool({
  connectionString: process.env.POSTGRES_URL,
});

export async function GET(req: NextRequest) {
  try {
    const { searchParams } = req.nextUrl;
    const companyId = parseInt(searchParams.get('companyId') || '0', 10);

    if (!companyId) {
      return NextResponse.json(
        { error: 'El ID de la compañía es obligatorio' },
        { status: 400 },
      );
    }

    const query = `
      SELECT 
        a.id AS area_id,
        a.name AS area_name,
        ba.year,
        ba.half,
        SUM(ba.allocated_amount) AS total_allocated,
        SUM(ba.executed_amount) AS total_executed
      FROM areas a
      JOIN budget_allocations ba ON a.id = ba.area_id
      JOIN budgets b ON ba.project_id = b.id
      WHERE b.company_id = $1
      GROUP BY a.id, a.name, ba.year, ba.half
      ORDER BY a.name, ba.year, ba.half
    `;

    const result = await pool.query(query, [companyId]);

    const areas = result.rows.reduce((acc, row) => {
      const existingArea = acc.find((area: any) => area.id === row.area_id);
      const fund = {
        year: row.year,
        half: row.half,
        allocated: parseFloat(row.total_allocated),
        executed: parseFloat(row.total_executed),
      };

      if (existingArea) {
        existingArea.funds.push(fund);
      } else {
        acc.push({
          id: row.area_id,
          name: row.area_name,
          funds: [fund],
        });
      }

      return acc;
    }, []);

    return NextResponse.json(areas);
  } catch (error) {
    console.error('Error fetching area funds summary:', error);
    return NextResponse.json(
      { error: 'Error interno del servidor' },
      { status: 500 },
    );
  }
}
