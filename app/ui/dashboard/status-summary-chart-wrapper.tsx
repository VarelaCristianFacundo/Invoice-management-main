import { fetchStatusSummaryData } from '@/app/lib/chart-data';
import { Suspense } from 'react';
import { StatusSummaryChartSkeleton } from '../skeletons';
import { StatusSummaryChart } from './status-summary-chart';

export default async function StatusSummaryChartWrapper({
    searchParams,
    areaId,
}: {
    searchParams?: { status?: string; year?: string; company?: string };
    areaId?: string | null;
}) {
    const status = searchParams?.status || 'all';
    const year = searchParams?.year || 'all';
    const company = searchParams?.company || 'all'; // Default: todas las empresas

    const data = await fetchStatusSummaryData(status, year, company, areaId);

    return (
        <Suspense fallback={<StatusSummaryChartSkeleton />}>
            <div className="mb-6 grid grid-cols-1 gap-6 lg:grid-cols-2">
                {/* Gráficos (2 columnas) */}
                <div className="lg:col-span-2">
                    <StatusSummaryChart data={data} />
                </div>

                {/* Últimas Facturas (1 columna) */}
                {/* <div>
                    <Suspense fallback={<LatestInvoicesSkeleton />}>
                        <LatestInvoices />
                    </Suspense>
                </div> */}
            </div>
        </Suspense>
    );
}
