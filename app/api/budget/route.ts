import { createBudget } from '@/app/lib/actions';
import { NextResponse } from 'next/server';

export async function POST(request: Request) {
  try {
    const body = await request.json();
    const {
      id,
      year,
      areaId,
      program,
      projectId,
      allocated_amount,
      half,
      company_id,
    } = body; // Incluimos company_id

    if (!company_id) {
      return NextResponse.json(
        { error: 'Company ID is required' },
        { status: 400 },
      );
    }

    await createBudget({
      id,
      year,
      areaId,
      program,
      projectId,
      allocated_amount,
      half,
      company_id, // Enviamos company_id a la función
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
