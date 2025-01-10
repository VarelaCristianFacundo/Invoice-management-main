import { updateAreaFunds } from '@/app/lib/actions';
import { db } from '@/app/lib/db';
import { NextResponse } from 'next/server';

export async function GET() {
  try {
    // Hacemos la consulta
    const result = await db.query(`
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

    // Devolvemos solo las rows
    return NextResponse.json(result.rows);
  } catch (error) {
    console.error('Error fetching area funds:', error);
    return NextResponse.json(
      { error: 'Failed to fetch area funds.' },
      { status: 500 },
    );
  }
}

export async function POST(req: Request) {
  try {
    const body = await req.json();
    if (!Array.isArray(body)) {
      return NextResponse.json(
        { error: 'Invalid data format. Expected an array of items.' },
        { status: 400 },
      );
    }

    const updates = body.map((item: any) => ({
      id: 'new',
      areaId: item.areaId,
      amount: item.amount,
      year: item.year,
      half: item.half,
    }));

    await updateAreaFunds(updates);
    return NextResponse.json({ success: true });
  } catch (error: any) {
    console.error('Error in POST /api/area-funds:', error);
    return NextResponse.json(
      { error: error.message || 'Failed to save area funds.' },
      { status: 500 },
    );
  }
}
