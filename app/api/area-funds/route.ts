import { updateAreaFunds } from '@/app/lib/actions';
import { sumBudgetAllocationsByAreaYearHalf } from '@/app/lib/data';
import { NextResponse } from 'next/server';

export async function GET() {
  try {
    // Hacemos la consulta
    const result = await sumBudgetAllocationsByAreaYearHalf();
    console.log('pase por aca'); // Devolvemos solo las rows
    return NextResponse.json(result);
  } catch (error) {
    console.error('Falló en traer fondos de areas:', error);
    return NextResponse.json(
      { error: 'Falló en traer fondos de areas.' },
      { status: 500 },
    );
  }
}

export async function POST(req: Request) {
  try {
    const body = await req.json();
    if (!Array.isArray(body)) {
      return NextResponse.json(
        {
          error:
            'Formato de datos inválido. Se esperaba un array de elementos.',
        },
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
      { error: error.message || 'Falló en guardar fondos de areas.' },
      { status: 500 },
    );
  }
}
