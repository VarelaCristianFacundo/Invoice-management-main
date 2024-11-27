// app/api/area-funds/route.ts

import { updateAreaFunds } from '@/app/lib/actions';
import { NextResponse } from 'next/server';

export async function POST(request: Request) {
  try {
    const updates = await request.json();
    await updateAreaFunds(updates);
    return NextResponse.json({ message: 'Funds updated successfully' });
  } catch (error) {
    console.error('Error updating area funds:', error);
    return NextResponse.json(
      { error: 'Failed to update area funds' },
      { status: 500 },
    );
  }
}
