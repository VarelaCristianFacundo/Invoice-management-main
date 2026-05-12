require('dotenv').config();
const { Pool } = require('pg');
const pool = new Pool({ connectionString: process.env.POSTGRES_URL });

async function test() {
  const client = await pool.connect();
  try {
    await client.query('BEGIN');
    const res = await client.query('UPDATE budget_allocations SET allocated_amount = 5000, program = $1 WHERE project_id = $2 RETURNING *', ['nuevo_programa', '59cf3868-647f-47f4-91cb-133f00272d16']);
    await client.query('COMMIT');
    console.log("Update Result:", res.rows);
  } catch(e) {
    console.error('DB Error:', e);
  } finally {
    client.release();
    pool.end();
  }
}
test();
