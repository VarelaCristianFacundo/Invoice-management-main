import { Pool } from 'pg';

const pool = new Pool({
  connectionString: process.env.POSTGRES_URL,
});

export async function getUserByEmail(email: string) {
  const queryText = `
    SELECT id, name, email, password, role, area_id
    FROM users
    WHERE email = $1
  `;
  const values = [email];
  const result = await pool.query(queryText, values);
  return result.rows[0];
}

export async function getUserByUsername(username: string) {
  const queryText = `
    SELECT id, name, email, password, role, area_id, username
    FROM users
    WHERE username = $1
  `;
  const values = [username];
  const result = await pool.query(queryText, values);
  return result.rows[0];
}
