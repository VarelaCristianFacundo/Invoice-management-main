---
name: postgres-drizzle
description: Use this skill when writing Drizzle ORM queries, modifying the schema, generating migrations, or debugging database issues in the CAMARCO project.
---

# PostgreSQL + Drizzle ORM Skill

## Setup

- Config: [`drizzle.config.ts`](../../drizzle.config.ts)
- Schema: [`app/lib/drizzle/schema.ts`](../../app/lib/drizzle/schema.ts)
- DB client: [`app/lib/drizzle/db.ts`](../../app/lib/drizzle/db.ts) — exports `drizzleDb` and `Tx` type.
- Migrations output: `drizzle/`

## Workflow for schema changes

```bash
# 1. Edit app/lib/drizzle/schema.ts
# 2. Generate migration
npm run db:generate

# 3. Review drizzle/NNNN_*.sql carefully
#    Look for unexpected DROP, ALTER, or RENAME statements.

# 4. Apply locally (confirm POSTGRES_URL is not prod first)
npm run db:migrate

# 5. Commit together: schema.ts + new drizzle/*.sql + drizzle/meta/*.json
```

> ⚠️ Never run `npm run db:push` — it bypasses migration tracking.
> ⚠️ Never edit an already-applied `.sql` file — create a new migration.

## Query patterns

### Select all with filter
```ts
import { drizzleDb } from '@/app/lib/drizzle/db';
import { invoices } from '@/app/lib/drizzle/schema';
import { eq, and, desc } from 'drizzle-orm';

const rows = await drizzleDb
  .select()
  .from(invoices)
  .where(and(
    eq(invoices.status, 'presentado'),
    eq(invoices.year, 2024),
  ))
  .orderBy(desc(invoices.date));
```

### Select specific columns + join
```ts
import { customers } from '@/app/lib/drizzle/schema';

const rows = await drizzleDb
  .select({
    id: invoices.id,
    amount: invoices.amount,
    providerName: customers.name,
    cuit: customers.cuitCuil,
  })
  .from(invoices)
  .innerJoin(customers, eq(invoices.customerId, customers.id))
  .where(eq(invoices.areaId, areaId));
```

### Insert and return
```ts
const [created] = await drizzleDb
  .insert(invoices)
  .values({
    customerId,
    amount: amount.toFixed(2),
    status: 'presentado',
    year: new Date().getFullYear(),
    areaId,
  })
  .returning();
```

### Update
```ts
const [updated] = await drizzleDb
  .update(invoices)
  .set({ status: 'aprobado' })
  .where(eq(invoices.id, id))
  .returning();
```

### Delete
```ts
await drizzleDb
  .delete(invoices)
  .where(eq(invoices.id, id));
```

### Transaction (atomic operations)
```ts
import { type Tx } from '@/app/lib/drizzle/db';

await drizzleDb.transaction(async (tx: Tx) => {
  await tx.update(invoices)
    .set({ status: 'aprobado' })
    .where(eq(invoices.id, invoiceId));

  await tx.update(budgetAllocations)
    .set({ executedAmount: newExecuted })
    .where(eq(budgetAllocations.id, allocationId));
});
```

### Aggregations
```ts
import { sum, count, countDistinct } from 'drizzle-orm';

const [{ total, qty }] = await drizzleDb
  .select({
    total: sum(invoices.amount),
    qty: count(invoices.id),
  })
  .from(invoices)
  .where(eq(invoices.year, 2024));

// total is string | null — always coerce
const totalNumber = Number(total ?? 0);
```

### Pagination
```ts
const ITEMS_PER_PAGE = 10;
const offset = (page - 1) * ITEMS_PER_PAGE;

const rows = await drizzleDb
  .select()
  .from(invoices)
  .orderBy(desc(invoices.date))
  .limit(ITEMS_PER_PAGE)
  .offset(offset);
```

### Dynamic conditions
```ts
import { SQL } from 'drizzle-orm';

const conditions: SQL[] = [];
if (status) conditions.push(eq(invoices.status, status));
if (year)   conditions.push(eq(invoices.year, Number(year)));

const rows = await drizzleDb
  .select()
  .from(invoices)
  .where(conditions.length ? and(...conditions) : undefined);
```

## Numeric fields (numeric(15,2))

Drizzle returns `numeric` columns as **strings**. Always convert explicitly:

```ts
// ❌ Wrong
const total = allocation.allocatedAmount + invoice.amount; // string concatenation!

// ✅ Correct
const total = Number(allocation.allocatedAmount) + Number(invoice.amount);

// Store back as string with fixed decimal
await tx.update(budgetAllocations).set({
  executedAmount: total.toFixed(2),
});
```

## Common Drizzle gotchas

- Column names in schema use **camelCase** (`customerId`), but DB columns are **snake_case** (`customer_id`). Drizzle handles the mapping.
- `.returning()` returns an array — destructure the first element.
- `.where(undefined)` is valid (no filter applied) — useful for dynamic queries.
- `sum()` returns `string | null`, `count()` returns `number`.
- For ILIKE search: `ilike(customers.name, `%${query}%`)`

## Debugging migrations

```bash
# Check current journal
cat drizzle/meta/_journal.json

# See what Drizzle thinks the DB state is (compare snapshots)
npm run db:studio

# If local DB is out of sync, apply all pending migrations
npm run db:migrate
```
