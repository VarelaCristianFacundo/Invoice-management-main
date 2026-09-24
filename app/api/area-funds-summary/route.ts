import { NextRequest, NextResponse } from 'next/server';
import { Pool } from 'pg';

const pool = new Pool({
  connectionString: process.env.POSTGRES_URL,
});

export const dynamic = 'force-dynamic';

type Line = {
  allocation_id: string;
  project_id: string;
  project_name: string;
  program: string | null;
  allocated: number;
  executed: number;
};

type Fund = {
  year: number;
  half: number;
  allocated: number;
  executed: number;
  lines: Line[];
};

type AreaSummary = {
  id: string;
  name: string;
  funds: Fund[];
};

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

    // Se devuelve una fila por línea de presupuesto. Un área puede tener
    // varias líneas en el mismo año/semestre, y el monto del área surge de la
    // suma de esas líneas (no hay techo por área).
    const query = `
      SELECT
        a.id AS area_id,
        a.name AS area_name,
        ba.year,
        ba.half,
        ba.id AS allocation_id,
        ba.program,
        ba.allocated_amount,
        ba.executed_amount,
        b.id AS project_id,
        b.project_name
      FROM areas a
      JOIN budget_allocations ba ON a.id = ba.area_id
      JOIN budgets b ON ba.project_id = b.id
      WHERE b.company_id = $1
      ORDER BY a.name, ba.year, ba.half, b.project_name
    `;

    const result = await pool.query(query, [companyId]);

    const areas = result.rows.reduce((acc: AreaSummary[], row) => {
      const allocated = parseFloat(row.allocated_amount) || 0;
      const executed = parseFloat(row.executed_amount) || 0;

      let area = acc.find((item) => item.id === row.area_id);
      if (!area) {
        area = { id: row.area_id, name: row.area_name, funds: [] };
        acc.push(area);
      }

      let fund = area.funds.find(
        (item) => item.year === row.year && item.half === row.half,
      );
      if (!fund) {
        fund = {
          year: row.year,
          half: row.half,
          allocated: 0,
          executed: 0,
          lines: [],
        };
        area.funds.push(fund);
      }

      // El total del área/semestre es la suma de sus líneas.
      fund.allocated += allocated;
      fund.executed += executed;
      fund.lines.push({
        allocation_id: row.allocation_id,
        project_id: row.project_id,
        project_name: row.project_name,
        program: row.program,
        allocated,
        executed,
      });

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
