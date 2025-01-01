import { createBudget } from '@/app/lib/actions';
import { NextResponse } from 'next/server';

export async function POST(request: Request) {
  try {
    const body = await request.json();
    const { id, year, areaId, program, projectId, allocated_amount, half } =
      body;

    await createBudget({
      id,
      year,
      areaId,
      program,
      projectId,
      allocated_amount,
      half,
    });

    return NextResponse.json(
      { message: 'Budget created successfully' },
      { status: 201 },
    );
  } catch (error) {
    console.error('Error in /api/budget route:', error);
    return NextResponse.json(
      { error: 'Error creating budget' },
      { status: 500 },
    );
  }
}
