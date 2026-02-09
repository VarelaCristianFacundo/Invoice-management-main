// Script para probar la query directamente
const { Pool } = require('pg');

const pool = new Pool({
  connectionString: process.env.POSTGRES_URL,
});

async function testQuery() {
  try {
    console.log('Testing query...');

    // Test 1: Query para CAMARCO (company_id = 1)
    const result = await pool.query(
      `
      SELECT
        status,
        COUNT(*) as count,
        COALESCE(SUM(amount), 0) as amount
      FROM invoices
      WHERE company_id = $1
      GROUP BY status
    `,
      [1],
    );

    console.log('Raw result:', result.rows);
    console.log('Result object keys:', Object.keys(result.rows[0] || {}));
    result.rows.forEach((row) => {
      console.log(
        `Status: ${row.status}, Count: ${
          row.count
        } (type: ${typeof row.count}), Amount: ${
          row.amount
        } (type: ${typeof row.amount})`,
      );
    });

    pool.end();
  } catch (error) {
    console.error('Error:', error);
    process.exit(1);
  }
}

testQuery();
