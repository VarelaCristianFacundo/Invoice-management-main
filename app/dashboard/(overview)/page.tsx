import CardWrapper from '@/app/ui/dashboard/cards';
import DashboardFilters from '@/app/ui/dashboard/filters';
import StatusSummaryChartWrapper from '@/app/ui/dashboard/status-summary-chart-wrapper';
import { roboto } from '@/app/ui/fonts';
import { CardsSkeleton, StatusSummaryChartSkeleton } from '@/app/ui/skeletons';
import { authOptions } from '@/authOptions';
import { Metadata } from 'next';
import { getServerSession } from 'next-auth/next';
import { Suspense } from 'react';

export const metadata: Metadata = {
  title: {
    template: 'Camarco Dashboard Overview',
    default: 'Camarco Dashboard',
  },
  description: 'The official Next.js Learn Dashboard built with App Router.',
  metadataBase: new URL('https://next-learn-dashboard.vercel.sh'),
};

export default async function Page(
  props: {
    searchParams?: Promise<{ status?: string; year?: string; company?: string }>;
  }
) {
  const searchParams = await props.searchParams;
  // Obtener sesión y calcular areaId
  const session = await getServerSession(authOptions);
  const userRole = session?.user?.role || '';
  const isAreaUser = userRole?.startsWith('usuario_') && 
                     userRole !== 'usuario' && 
                     userRole !== 'usuario_presupuestos' &&
                     userRole !== 'usuario_contable';
  const userAreaId = isAreaUser ? session?.user?.area_id : null;

  return (
    <main>
      <h1 className={`${roboto.className} mb-4 text-xl md:text-2xl`}>
        Inicio
      </h1>

      {/* Filtros */}
      <DashboardFilters />

      {/* Tarjetas de resumen */}
      <div className="gap-6">
        <Suspense fallback={<CardsSkeleton />}>
          <CardWrapper searchParams={searchParams} areaId={userAreaId} />
        </Suspense>
      </div>

      {/* Gráficos y últimas facturas en la misma fila */}
      <div className="mt-6 grid grid-cols-1 gap-6">
        <Suspense fallback={<StatusSummaryChartSkeleton />}>
          <StatusSummaryChartWrapper searchParams={searchParams} areaId={userAreaId} />
        </Suspense>
      </div>
    </main>
  );
}