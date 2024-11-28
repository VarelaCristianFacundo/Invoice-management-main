require('dotenv').config();
const { Pool } = require('pg');
const bcrypt = require('bcrypt');
const { v4: uuidv4 } = require('uuid');

const {
  invoices,
  customers,
  revenue,
  users,
} = require('../app/lib/placeholder-data.js');

const budgets = [
  {
    id: uuidv4(),
    customer_id: customers[0]?.id || uuidv4(),
    area_id: areas.find((a) => a.name === 'Sistemas')?.id,
    amount: 5000,
    status: 'pending',
    date: new Date().toISOString().split('T')[0],
    year: 2024,
    program: 'Test Program',
    project: 'Test Project',
    concept: 'Concept Example',
  },
  // Agrega más presupuestos si lo deseas
];

const areas = [
  { id: uuidv4(), name: 'Secretaría' },
  { id: uuidv4(), name: 'Sistemas' },
  { id: uuidv4(), name: 'Comunicación' },
  { id: uuidv4(), name: 'GDI' },
  { id: uuidv4(), name: 'EGC' },
  { id: uuidv4(), name: 'GT' },
];

const areaFunds = [
  { area_name: 'Comunicación', allocated_funds: 100000 },
  { area_name: 'Sistemas', allocated_funds: 150000 },
  // Añade las demás áreas...
];

for (const fund of areaFunds) {
  const areaResult = await client.query(
    'SELECT id FROM areas WHERE name = $1',
    [fund.area_name],
  );
  const areaId = areaResult.rows[0]?.id;
  if (areaId) {
    await client.query(
      `
      INSERT INTO area_funds (id, area_id, allocated_funds)
      VALUES (uuid_generate_v4(), $1, $2)
      ON CONFLICT (area_id) DO UPDATE SET allocated_funds = $2;
      `,
      [areaId, fund.allocated_funds],
    );
  }
}

async function seedBudgets(client) {
  try {
    await client.query('CREATE EXTENSION IF NOT EXISTS "uuid-ossp";');

    // Eliminar la tabla budgets si ya existe
    await client.query(`
      DROP TABLE IF EXISTS budgets;
    `);

    // Crear la tabla budgets con las columnas adicionales
    await client.query(`
      CREATE TABLE budgets (
        id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
        customer_id UUID NOT NULL,
        amount INT NOT NULL,
        status VARCHAR(255) NOT NULL,
        date DATE NOT NULL,
        year INT,
        program VARCHAR(255),
        project VARCHAR(255),
        concept VARCHAR(255),
        FOREIGN KEY (customer_id) REFERENCES customers(id)
      );
    `);

    console.log(`Created "budgets" table`);

    for (const budget of budgets) {
      await client.query(
        `
        INSERT INTO budgets (id, customer_id, area_id, amount, status, date, year, program, project, concept)
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
        ON CONFLICT (id) DO NOTHING;
        `,
        [
          budget.id,
          budget.customer_id,
          budget.area_id,
          budget.amount,
          budget.status,
          budget.date,
          budget.year,
          budget.program,
          budget.project,
          budget.concept,
        ],
      );
    }

    for (const area of areas) {
      await client.query(
        `
        INSERT INTO areas (id, name)
        VALUES ($1, $2)
        ON CONFLICT (name) DO NOTHING;
        `,
        [area.id, area.name],
      );
    }

    console.log(`Seeded budgets`);
  } catch (error) {
    console.error('Error seeding budgets:', error);
    throw error;
  }
}

const pool = new Pool({
  connectionString: process.env.POSTGRES_URL,
});

async function seedUsers(client) {
  try {
    await client.query('CREATE EXTENSION IF NOT EXISTS "uuid-ossp";');

    await client.query(`
      CREATE TABLE IF NOT EXISTS users (
        id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        email TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL
      );
    `);

    console.log(`Created "users" table`);

    for (const user of users) {
      const hashedPassword = await bcrypt.hash(user.password, 10);
      await client.query(
        `
        INSERT INTO users (id, name, email, password)
        VALUES ($1, $2, $3, $4)
        ON CONFLICT (id) DO NOTHING;
        `,
        [user.id, user.name, user.email, hashedPassword],
      );
    }

    console.log(`Seeded users`);
  } catch (error) {
    console.error('Error seeding users:', error);
    throw error;
  }
}

async function seedCustomers(client) {
  try {
    await client.query('CREATE EXTENSION IF NOT EXISTS "uuid-ossp";');

    await client.query(`
      CREATE TABLE IF NOT EXISTS customers (
        id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL,
        image_url VARCHAR(255) NOT NULL
      );
    `);

    console.log(`Created "customers" table`);

    for (const customer of customers) {
      const customerId = customer.id || uuidv4();

      await client.query(
        `
        INSERT INTO customers (id, name, email, image_url)
        VALUES ($1, $2, $3, $4)
        ON CONFLICT (id) DO NOTHING;
        `,
        [customerId, customer.name, customer.email, customer.image_url],
      );
    }

    console.log(`Seeded customers`);
  } catch (error) {
    console.error('Error seeding customers:', error);
    throw error;
  }
}

async function seedInvoices(client) {
  try {
    await client.query('CREATE EXTENSION IF NOT EXISTS "uuid-ossp";');

    await client.query(`
      CREATE TABLE IF NOT EXISTS invoices (
        id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
        customer_id UUID NOT NULL,
        amount INT NOT NULL,
        status VARCHAR(255) NOT NULL,
        date DATE NOT NULL,
        FOREIGN KEY (customer_id) REFERENCES customers(id)
      );
    `);

    console.log(`Created "invoices" table`);

    for (const invoice of invoices) {
      const invoiceId = invoice.id || uuidv4();

      await client.query(
        `
        INSERT INTO invoices (id, customer_id, amount, status, date)
        VALUES ($1, $2, $3, $4, $5)
        ON CONFLICT (id) DO NOTHING;
        `,
        [
          invoiceId,
          invoice.customer_id,
          invoice.amount,
          invoice.status,
          invoice.date,
        ],
      );
    }

    console.log(`Seeded invoices`);
  } catch (error) {
    console.error('Error seeding invoices:', error);
    throw error;
  }
}

async function seedRevenue(client) {
  try {
    await client.query(`
      CREATE TABLE IF NOT EXISTS revenue (
        month VARCHAR(4) NOT NULL UNIQUE,
        revenue INT NOT NULL
      );
    `);

    console.log(`Created "revenue" table`);

    for (const rev of revenue) {
      await client.query(
        `
        INSERT INTO revenue (month, revenue)
        VALUES ($1, $2)
        ON CONFLICT (month) DO NOTHING;
        `,
        [rev.month, rev.revenue],
      );
    }

    console.log(`Seeded revenue`);
  } catch (error) {
    console.error('Error seeding revenue:', error);
    throw error;
  }
}

async function main() {
  const client = await pool.connect();

  try {
    await seedUsers(client);
    await seedCustomers(client);
    await seedInvoices(client);
    await seedRevenue(client);
    await seedBudgets(client);
  } catch (error) {
    console.error(
      'An error occurred while attempting to seed the database:',
      error,
    );
  } finally {
    client.release();
    await pool.end();
  }
}

main();
