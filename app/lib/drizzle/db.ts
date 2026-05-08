import { drizzle } from 'drizzle-orm/node-postgres';
import { pool } from '../db';
import * as schema from './schema';
import * as relations from './relations';

export const drizzleDb = drizzle(pool, {
  schema: { ...schema, ...relations },
});

export type Tx = Parameters<Parameters<typeof drizzleDb.transaction>[0]>[0];
