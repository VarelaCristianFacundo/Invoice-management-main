const { Pool } = require('pg');
require('dotenv').config({ path: '.env.local' });

const pool = new Pool({
  connectionString: process.env.POSTGRES_URL,
});

async function main() {
  try {
    console.log('Altering invoices.amount to NUMERIC(15,2)...');
    await pool.query('ALTER TABLE invoices ALTER COLUMN amount TYPE NUMERIC(15,2)');
    console.log('Success!');
  } catch (error) {
    console.error('ERROR:', error.message);
  } finally {
    await pool.end();
  }
}

main();
