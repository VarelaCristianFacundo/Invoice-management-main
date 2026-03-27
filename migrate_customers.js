const { Pool } = require('pg');
require('dotenv').config({ path: '.env.local' });

const pool = new Pool({
  connectionString: process.env.POSTGRES_URL,
});

async function main() {
  try {
    console.log('Adding company_id column to customers table...');
    await pool.query(`
      ALTER TABLE customers ADD COLUMN IF NOT EXISTS company_id INTEGER NOT NULL DEFAULT 1;
    `);
    console.log('Done.');
  } catch (error) {
    console.error('ERROR:', error.message);
  } finally {
    await pool.end();
  }
}

main();
