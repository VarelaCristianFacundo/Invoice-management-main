import 'dotenv/config';
import bcrypt from 'bcrypt';
import { Pool } from 'pg';
import { drizzle } from 'drizzle-orm/node-postgres';
import { count, eq } from 'drizzle-orm';
import {
  areaFunds,
  areas,
  budgetAllocations,
  budgets,
  company,
  contableItems,
  customers,
  programs,
  users,
  year,
} from '../app/lib/drizzle/schema';

const pool = new Pool({ connectionString: process.env.POSTGRES_URL });
const db = drizzle(pool);

async function seed() {
  const [{ existing }] = await db
    .select({ existing: count() })
    .from(users);
  if (existing > 0) {
    console.log('La base ya tiene datos. Aborto seed para no duplicar.');
    return;
  }

  console.log('Insertando companies...');
  await db.insert(company).values([
    { id: 1, name: 'FODECO' },
    { id: 2, name: 'CAMARCO' },
  ]);

  console.log('Insertando areas...');
  await db.insert(areas).values([
    { name: 'Secretaría' },
    { name: 'Sistemas' },
    { name: 'Comunicación' },
    { name: 'GDI' },
    { name: 'EGC' },
    { name: 'GT' },
  ]);

  console.log('Insertando admin user...');
  const passwordHash = await bcrypt.hash('admin123', 10);
  await db.insert(users).values({
    name: 'Admin',
    email: 'admin@camarco.local',
    password: passwordHash,
    role: 'admin',
  });

  console.log('Insertando customers...');
  await db.insert(customers).values([
    {
      name: 'Proveedor Test 1',
      email: 'prov1@test.com',
      cuitCuil: '20123456789',
      ivaCondition: 'RI',
      companyId: 1,
    },
    {
      name: 'Proveedor Test 2',
      email: 'prov2@test.com',
      cuitCuil: '20987654321',
      ivaCondition: 'MT',
      companyId: 2,
    },
  ]);

  console.log('Insertando contable_items...');
  await db.insert(contableItems).values([
    { nombre: 'Servicios Generales', codigo: 'SG-001' },
    { nombre: 'Insumos de Oficina', codigo: 'IO-002' },
  ]);

  console.log('Insertando programs...');
  await db.insert(programs).values([
    { name: 'Programa General' },
    { name: 'Programa de Capacitación' },
  ]);

  console.log('Insertando years...');
  await db.insert(year).values([
    { year: 2024 },
    { year: 2025 },
    { year: 2026 },
  ]);

  console.log('Insertando budget + allocation + area_fund de ejemplo...');
  const [sistemasArea] = await db
    .select()
    .from(areas)
    .where(eq(areas.name, 'Sistemas'))
    .limit(1);

  const [insertedBudget] = await db
    .insert(budgets)
    .values({
      projectName: 'Proyecto Sistemas 2025',
      year: 2025,
      companyId: 1,
      status: 'pending',
    })
    .returning();

  await db.insert(budgetAllocations).values({
    projectId: insertedBudget.id,
    areaId: sistemasArea.id,
    year: 2025,
    half: 1,
    program: 'Programa General',
    allocatedAmount: '100000',
    executedAmount: '0',
  });

  await db.insert(areaFunds).values({
    areaId: sistemasArea.id,
    allocatedFunds: '500000',
    year: 2025,
    half: 1,
  });

  console.log('Seed completo.');
  console.log('  Admin → admin@camarco.local / admin123');
}

seed()
  .then(() => pool.end())
  .catch((err) => {
    console.error('Seed falló:', err);
    pool.end();
    process.exit(1);
  });
