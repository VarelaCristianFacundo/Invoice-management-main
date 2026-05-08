import { generateExcelReport } from '@/app/lib/data';
import { authOptions } from '@/authOptions';
import { getServerSession } from 'next-auth/next';

export async function GET() {
  // Obtener sesión y calcular areaId
  const session = await getServerSession(authOptions);
  const userRole = session?.user?.role || '';
  const isAreaUser = userRole?.startsWith('usuario_') && 
                     userRole !== 'usuario' && 
                     userRole !== 'usuario_presupuestos';
  const userAreaId = isAreaUser ? session?.user?.area_id : null;

  return await generateExcelReport(userAreaId);
}
