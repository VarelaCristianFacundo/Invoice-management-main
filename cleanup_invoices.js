const { Pool } = require('pg');
require('dotenv').config({ path: '.env.local' });

const pool = new Pool({
  connectionString: process.env.POSTGRES_URL,
});

async function main() {
  try {
    console.log('Updating invoices with company_id 0 to 1...');
    const res = await pool.query("UPDATE invoices SET company_id = 1 WHERE company_id = 0");
    console.log(`Updated ${res.rowCount} rows.`);
  } catch (error) {
    console.error('ERROR:', error.message);
  } finally {
    await pool.end();
  }
}

main();
