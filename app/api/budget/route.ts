// app/api/budget/route.ts

import { createBudget } from '@/app/lib/actions';
import { NextResponse } from 'next/server';

export async function POST(request: Request) {
  console.log('POST request received at /api/budget'); // Log inicial para ver si la solicitud llega a esta ruta

  try {
    const body = await request.json();
    console.log('Request body:', body); // Log para verificar el contenido del cuerpo de la solicitud

    const {
      year,
      area,
      program,
      project,
      customerId,
      concept,
      amount,
      status,
    } = body;

    // Inserta el presupuesto usando la función `createBudget`
    await createBudget({
      year: String(year),
      area,
      program,
      project,
      customerId,
      concept,
      amount: parseFloat(amount),
      status,
    });

    console.log('Budget created successfully'); // Log para confirmar que el presupuesto se creó sin errores

    return NextResponse.json(
      { message: 'Budget created successfully' },
      { status: 201 },
    );
  } catch (error) {
    console.error('Error in /api/budget route:', error); // Log de error en caso de que falle la creación del presupuesto
    return NextResponse.json(
      { error: 'Error creating budget' },
      { status: 500 },
    );
  }
}
