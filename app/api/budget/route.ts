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
    } = body;

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
      company_id,
    });

    return NextResponse.json(
      { message: 'Proyecto creado satisfactoriamente' },
      { status: 201 },
    );
  } catch (error) {
    console.error('Error creating budget:', error);
    return NextResponse.json(
      { error: 'Error creating budget' },
      { status: 500 },
    );
  }
}
