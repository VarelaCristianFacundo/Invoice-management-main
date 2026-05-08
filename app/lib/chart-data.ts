import { and, eq, sql } from 'drizzle-orm';
import { drizzleDb } from './drizzle/db';
import { invoices } from './drizzle/schema';

export async function fetchStatusSummaryData(
  status?: string,
  year?: string,
  companyId?: string,
  areaId?: string | null,
) {
  try {
    const conditions = [];
    if (companyId && companyId !== 'all') {
      conditions.push(eq(invoices.companyId, parseInt(companyId)));
    }
    if (status && status !== 'all') {
      conditions.push(eq(invoices.status, status));
    }
    if (year && year !== 'all') {
      conditions.push(eq(invoices.year, parseInt(year)));
    }
    if (areaId) {
      conditions.push(eq(invoices.areaId, areaId));
    }
    const where = conditions.length ? and(...conditions) : undefined;

    const [row] = await drizzleDb
      .select({
        count_paid: sql<string>`COUNT(*) FILTER (WHERE ${invoices.status} = 'pagado')`,
        count_approved: sql<string>`COUNT(*) FILTER (WHERE ${invoices.status} = 'aprobado')`,
        count_pending: sql<string>`COUNT(*) FILTER (WHERE ${invoices.status} = 'presentado')`,
        sum_paid: sql<string>`COALESCE(SUM(CASE WHEN ${invoices.status} = 'pagado' THEN ${invoices.amount} END), 0)`,
        sum_approved: sql<string>`COALESCE(SUM(CASE WHEN ${invoices.status} = 'aprobado' THEN ${invoices.amount} END), 0)`,
        sum_pending: sql<string>`COALESCE(SUM(CASE WHEN ${invoices.status} = 'presentado' THEN ${invoices.amount} END), 0)`,
      })
      .from(invoices)
      .where(where);

    return [
      {
        status: 'presentado',
        count: Number(row?.count_pending ?? 0),
        amount: Number(row?.sum_pending ?? 0),
      },
      {
        status: 'aprobado',
        count: Number(row?.count_approved ?? 0),
        amount: Number(row?.sum_approved ?? 0),
      },
      {
        status: 'pagado',
        count: Number(row?.count_paid ?? 0),
        amount: Number(row?.sum_paid ?? 0),
      },
    ];
  } catch (error) {
    console.error('Error fetching status summary data:', error);
    return [];
  }
}
