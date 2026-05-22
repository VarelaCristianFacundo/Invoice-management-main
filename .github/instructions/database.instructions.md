---
applyTo: "app/lib/drizzle/**,drizzle.config.ts,drizzle/**,scripts/**"
---

# Database Conventions (Drizzle ORM + PostgreSQL)

## Schema location

Single source of truth: [`app/lib/drizzle/schema.ts`](../../app/lib/drizzle/schema.ts)

Migrations are generated into `drizzle/` and tracked in `drizzle/meta/_journal.json`.

## Migration workflow — MANDATORY

> ⚠️ Any edit to `schema.ts` requires a new migration in the same commit. No exceptions.

```bash
# 1. Edit schema.ts
# 2. Generate migration
npm run db:generate

# 3. Review the generated SQL in drizzle/NNNN_*.sql
#    Watch for unintended DROPs or renames.

# 4. Apply locally (only after verifying POSTGRES_URL != prod)
npm run db:migrate

# 5. Commit schema.ts + drizzle/*.sql + drizzle/meta/*.json together
```

**Never** use `db:push` on any shared or production database — it skips migration tracking.

**Never** edit or delete an already-applied migration file. Generate a new one to complement or reverse it.

## Table inventory

| Table | Key columns | Notes |
|-------|------------|-------|
| `areas` | `id`, `name` | Unique name |
| `users` | `id`, `email`, `role`, `area_id` | FK → areas |
| `company` | `id` (int PK), `name` | Only 2 rows (id=1, id=2) |
| `customers` | `id`, `name`, `cuit_cuil`, `cbu_cvu`, `iva_condition`, `company_id` | Providers/vendors |
| `revenue` | `month`, `revenue` | Dashboard chart data |
| `contable_items` | `id` (serial), `nombre`, `codigo` | Accounting categories |
| `programs` | `id`, `name` | Budget programs |
| `year` | `year` | Active fiscal years |
| `budgets` | `id`, `project_name`, `year`, `company_id`, `status` | Status: `pending`/`approved`/`rejected` |
| `budget_allocations` | `id`, `project_id`, `area_id`, `year`, `half`, `allocated_amount`, `executed_amount` | Unique: `(area_id, year, half)`, half ∈ {1,2} |
| `area_funds` | `id`, `area_id`, `allocated_funds`, `year`, `half` | Unique: `(area_id, year, half)` |
| `invoices` | `id`, `customer_id`, `amount`, `status`, `date`, `year`, `area_id`, `budget_allocation_id`, `invoice_number`, `contable_item_id` | Status check constraint |

## Critical constraints

- `invoices.status` DB check: `ANY ARRAY['presentado','aprobado','pagado','rechazado']`
- `invoices.invoice_number` is UNIQUE — always check before insert.
- `budget_allocations`: unique on `(area_id, year, half)` — only one allocation per area per period.
- `area_funds`: unique on `(area_id, year, half)`.
- `budget_allocations.half` and `area_funds.half` must be 1 or 2.
- `users.email` is UNIQUE.
- `areas.name` is UNIQUE.

## Drizzle patterns

```ts
import { drizzleDb } from '@/app/lib/drizzle/db';
import { invoices, customers } from '@/app/lib/drizzle/schema';
import { eq, and, sql, sum } from 'drizzle-orm';

// Select with join
const rows = await drizzleDb
  .select({ id: invoices.id, name: customers.name })
  .from(invoices)
  .innerJoin(customers, eq(invoices.customerId, customers.id))
  .where(eq(invoices.status, 'presentado'));

// Update
await drizzleDb
  .update(invoices)
  .set({ status: 'aprobado' })
  .where(eq(invoices.id, id));

// Aggregate
const [{ total }] = await drizzleDb
  .select({ total: sum(invoices.amount) })
  .from(invoices)
  .where(eq(invoices.year, 2024));
```

## Numeric amounts

DB stores `numeric(15,2)`. Drizzle returns these as **strings** in JavaScript.

```ts
// Convert for arithmetic only
const remaining = Number(allocation.allocatedAmount) - Number(allocation.executedAmount);

// Never store back a JS float directly — use .toFixed(2)
await drizzleDb.update(budgetAllocations).set({
  executedAmount: (Number(allocation.executedAmount) + invoiceAmount).toFixed(2),
});
```

## Transactions

Use Drizzle transactions for operations that must be atomic (e.g. approve invoice + update executed_amount):

```ts
import { type Tx } from '@/app/lib/drizzle/db';

await drizzleDb.transaction(async (tx: Tx) => {
  await tx.update(invoices).set({ status: 'aprobado' }).where(eq(invoices.id, id));
  await tx.update(budgetAllocations).set({ executedAmount: newAmount }).where(...);
});
```
