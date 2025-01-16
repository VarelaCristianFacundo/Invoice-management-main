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
    console.error('Error fetching area funds:', error);
    return NextResponse.json(
      { error: 'Failed to fetch area funds' },
      { status: 500 },
    );
  }
}
