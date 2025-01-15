import { updateAreaFunds } from '@/app/lib/actions';
import { db } from '@/app/lib/db';
import { NextResponse } from 'next/server';
import { sumBudgetAllocationsByAreaYearHalf } from '@/app/lib/data';

export async function GET() {
    
  try {
    // Hacemos la consulta
    const result = await sumBudgetAllocationsByAreaYearHalf();
    console.log("pase por aca");    // Devolvemos solo las rows
    return NextResponse.json(result);
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
