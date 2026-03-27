const { Pool } = require('pg');
const bcrypt = require('bcrypt');
require('dotenv').config({ path: '.env.local' });

const pool = new Pool({
  connectionString: process.env.POSTGRES_URL,
});

async function main() {
  try {
    const email = 'super@camarco.ar';
    const password = 'admin1234';
    const name = 'Super User';
    const role = 'admin';

    const hashedPassword = await bcrypt.hash(password, 10);
    
    console.log(`Creating super user: ${email}...`);
    await pool.query(
      "INSERT INTO users (id, name, email, password, role) VALUES (uuid_generate_v4(), $1, $2, $3, $4) ON CONFLICT (email) DO UPDATE SET password = $3, role = $4",
      [name, email, hashedPassword, role]
    );
    console.log('Success!');
    console.log(`Email: ${email}`);
    console.log(`Password: ${password}`);
  } catch (error) {
    console.error('ERROR:', error.message);
  } finally {
    await pool.end();
  }
}

main();
