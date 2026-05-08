import { Pool } from 'pg';

const pool = new Pool({
  connectionString: process.env.POSTGRES_URL,
});

export async function fetchStatusSummaryData(
  status?: string,
  year?: string,
  companyId?: string,
  areaId?: string | null,
) {
  try {
    const company =
      companyId && companyId !== 'all' ? parseInt(companyId) : null;

    let whereClause = 'WHERE 1=1';
    const params: any[] = [];

    if (company) {
      params.push(company);
      whereClause += ` AND company_id = $${params.length}`;
    }
    if (status && status !== 'all') {
      params.push(status);
      whereClause += ` AND status = $${params.length}`;
    }
    if (year && year !== 'all') {
      params.push(parseInt(year));
      whereClause += ` AND year = $${params.length}`;
    }
    if (areaId) {
      params.push(areaId);
      whereClause += ` AND area_id = $${params.length}`;
    }

    // Una sola query que devuelve todo lo necesario
    const result = await pool.query(
      `
      SELECT
        COUNT(*) FILTER (WHERE status = 'pagado')     AS count_paid,
        COUNT(*) FILTER (WHERE status = 'aprobado')   AS count_approved,
        COUNT(*) FILTER (WHERE status = 'presentado') AS count_pending,
        COALESCE(SUM(CASE WHEN status = 'pagado'     THEN amount END), 0)       AS sum_paid,
        COALESCE(SUM(CASE WHEN status = 'aprobado'   THEN amount END), 0)       AS sum_approved,
        COALESCE(SUM(CASE WHEN status = 'presentado' THEN amount END), 0)       AS sum_pending
      FROM invoices
      ${whereClause}
    `,
      params,
    );

    const row = result.rows[0] || {};

    // Asegurar que los valores son números normales (no bigint ni string)
    const countPending = Number(row.count_pending || 0);
    const countApproved = Number(row.count_approved || 0);
    const countPaid = Number(row.count_paid || 0);
    const sumPending = Number(row.sum_pending || 0);
    const sumApproved = Number(row.sum_approved || 0);
    const sumPaid = Number(row.sum_paid || 0);

    return [
      {
        status: 'presentado',
        count: countPending,
        amount: sumPending,
      },
      {
        status: 'aprobado',
        count: countApproved,
        amount: sumApproved,
      },
      {
        status: 'pagado',
        count: countPaid,
        amount: sumPaid,
      },
    ];
  } catch (error) {
    console.error('Error fetching status summary data:', error);
    return [];
  }
}
