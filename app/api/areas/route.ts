import { fetchAreasWithFunds } from '@/app/lib/data';
import { NextResponse } from 'next/server';

export async function GET() {
  try {
    const areas = await fetchAreasWithFunds();
    return NextResponse.json(areas);
  } catch (error) {
    console.error('Falló en traer areas:', error);
    return NextResponse.json(
      { error: 'Falló en traer areas' },
      { status: 500 },
    );
  }
}
