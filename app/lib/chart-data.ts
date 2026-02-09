import { Pool } from 'pg';

const pool = new Pool({
  connectionString: process.env.POSTGRES_URL,
});

export async function fetchStatusSummaryData(
  status?: string,
  year?: string,
  companyId?: string,
) {
  try {
    const company =
      companyId && companyId !== 'all' ? parseInt(companyId) : null;

    // Construir query con o sin filtro de company_id
    let whereClause = '';
    const params: any[] = [];

    if (company) {
      whereClause = 'WHERE company_id = $1';
      params.push(company);
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

    return [
      {
        status: 'presentado',
        count: parseInt(row.count_pending) || 0,
        amount: parseFloat(row.sum_pending) || 0,
      },
      {
        status: 'aprobado',
        count: parseInt(row.count_approved) || 0,
        amount: parseFloat(row.sum_approved) || 0,
      },
      {
        status: 'pagado',
        count: parseInt(row.count_paid) || 0,
        amount: parseFloat(row.sum_paid) || 0,
      },
    ];
  } catch (error) {
    console.error('Error fetching status summary data:', error);
    return [];
  }
}
