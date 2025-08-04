import { generateExcelReport } from '@/app/lib/data'; // ajusta la import si cambia

export async function GET() {
  return await generateExcelReport();
}
