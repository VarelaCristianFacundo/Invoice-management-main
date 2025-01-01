import { db } from '@/app/lib/db'; // Ajusta la importación según tu configuración
import { NextResponse } from 'next/server';

export async function GET() {
  try {
    // Consulta a la base de datos
    const areaFunds = await db.query(`
            SELECT 
                af.id AS fund_id,
                af.area_id,
                a.name AS area_name,
                af.allocated_funds,
                af.executed_funds,
                af.year,
                af.half
            FROM area_funds af
            INNER JOIN areas a ON af.area_id = a.id
            ORDER BY a.name, af.year, af.half
        `);

    // Devuelve los datos en formato JSON
    return NextResponse.json(areaFunds);
  } catch (error) {
    console.error('Error fetching area funds:', error);
    return NextResponse.json(
      { error: 'Failed to fetch area funds.' },
      { status: 500 },
    );
  }
}
