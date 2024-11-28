import { getAreaFunds } from '@/app/lib/data';
import { NextResponse } from 'next/server';

export async function GET(request: Request, { params }: any) {
  try {
    const areaId = params.id;
    const funds = await getAreaFunds(areaId);
    return NextResponse.json({ allocated_funds: funds });
  } catch (error) {
    console.error('Error fetching area funds:', error);
    return NextResponse.json(
      { error: 'Failed to fetch area funds' },
      { status: 500 },
    );
  }
}
