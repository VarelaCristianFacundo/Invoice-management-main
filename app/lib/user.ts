// app/lib/user.ts

import { Pool } from 'pg';

const pool = new Pool({
  connectionString: process.env.POSTGRES_URL,
});

export async function getUserByEmail(email: string) {
  const client = await pool.connect();
  try {
    const res = await client.query('SELECT * FROM users WHERE email = $1', [
      email,
    ]);
    return res.rows[0];
  } finally {
    client.release();
  }
}
