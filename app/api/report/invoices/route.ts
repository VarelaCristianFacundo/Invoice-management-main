import {generateExcelReport} from '@/app/lib/data';
import { NextResponse, NextRequest } from 'next/server';

// Configuración de la base de datos


export async function GET(req: NextRequest) {
  const { searchParams } = new URL(req.url);

  const query = searchParams.get('query') || '';
  const currentPage = Number(searchParams.get('currentPage')) || 1;
  const companyId = Number(searchParams.get('companyId')) || 1; // Default: CAMARCO


    return await generateExcelReport();
  
}