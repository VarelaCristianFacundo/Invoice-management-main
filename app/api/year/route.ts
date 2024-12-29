import {getAllYears } from '@/app/lib/data';
import { NextResponse } from 'next/server';

export async function GET() {
    try {  
      const years = await getAllYears();
      return NextResponse.json(years);
    } catch (error) {
      console.error('Error fetching years:', error);
      return NextResponse.json(
        { error: 'Failed to fetch years' },
        { status: 500 },
      );
    }
  }