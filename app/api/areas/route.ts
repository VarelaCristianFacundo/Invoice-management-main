// app/api/areas/route.ts

import { fetchAreasWithFunds } from '@/app/lib/data';
import { NextResponse } from 'next/server';

export async function GET() {
  try {
    const areas = await fetchAreasWithFunds();
    return NextResponse.json(areas);
  } catch (error) {
    console.error('Error fetching areas:', error);
    return NextResponse.json(
      { error: 'Failed to fetch areas' },
      { status: 500 },
    );
  }
}
