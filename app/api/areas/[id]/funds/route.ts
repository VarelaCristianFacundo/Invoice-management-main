import { sumBudgetAllocationsByAreaYearHalf } from '@/app/lib/data';
import { NextResponse, type NextRequest } from 'next/server';

export async function GET(
  request: NextRequest,
  { params }: { params: { id: string } },
) {
  const areaId = params.id;

  try {
    const funds = await sumBudgetAllocationsByAreaYearHalf();
    return NextResponse.json({ allocated_funds: funds });
  } catch (error) {
    console.error('Falló en traer fondos de areas:', error);
    return NextResponse.json(
      { error: 'Falló en traer fondos de areas' },
      { status: 500 },
    );
  }
}
