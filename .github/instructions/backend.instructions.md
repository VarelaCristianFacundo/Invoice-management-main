---
applyTo: "app/api/**,app/lib/actions.ts,app/lib/data.ts,app/lib/user.ts,auth.ts,auth.config.ts,authOptions.ts,middleware.ts"
---

# Backend Conventions

## Database access

- Always use **Drizzle ORM** via `drizzleDb` imported from `@/app/lib/drizzle/db`.
- Import tables from `@/app/lib/drizzle/schema`.
- Never use raw `sql` tagged template literals for business queries — use the Drizzle query builder.
- Exception: `sql` helper from `drizzle-orm` is acceptable for expressions inside `.where()` or column defaults.
- Do NOT use `@vercel/postgres` (`sql` from `@vercel/postgres`) for new queries — it's legacy.

```ts
// Correct
import { drizzleDb } from '@/app/lib/drizzle/db';
import { invoices, customers } from '@/app/lib/drizzle/schema';
import { eq } from 'drizzle-orm';

const result = await drizzleDb
  .select()
  .from(invoices)
  .where(eq(invoices.id, id));

// Wrong — legacy pattern
import { sql } from '@vercel/postgres';
const result = await sql`SELECT * FROM invoices WHERE id = ${id}`;
```

## Server actions (`actions.ts`)

- Mark the file with `'use server'` at the top.
- Validate every input with **Zod** before any DB write.
- Always return a typed result object — `{ success: true }` or `{ error: string }`.
- Call `revalidatePath('/dashboard/...')` after every mutation.
- Check the user's role before any sensitive mutation (admin-only operations, cross-area writes).

```ts
'use server';
import { revalidatePath } from 'next/cache';
import { auth } from '@/auth';

export async function approveInvoice(id: string) {
  const session = await auth();
  if (!session || !['admin', 'tesorero'].includes(session.user.role)) {
    return { error: 'Unauthorized' };
  }
  // ... mutation
  revalidatePath('/dashboard/invoices');
  return { success: true };
}
```

## API routes

- File: `app/api/<resource>/route.ts`
- Export named handlers: `GET`, `POST`, `PUT`, `PATCH`, `DELETE`.
- Return `NextResponse.json({ ... }, { status: 200 | 201 | 400 | 401 | 403 | 404 | 500 })`.
- Check auth via `auth()` from `@/auth` (or `getServerSession` for NextAuth v4 compatibility).
- Never leak stack traces or DB errors to the client response.

## Authentication

- NextAuth v4 with `CredentialsProvider`.
- Password hashed with `bcrypt` (never store plaintext).
- Session includes `user.id`, `user.name`, `user.email`, `user.role`, `user.areaId`.
- Middleware (`middleware.ts`) protects all `/dashboard/**` routes.
- Use `auth()` in server components or `getServerSession(authOptions)` in API routes.

## Role-based access — quick reference

```ts
// Area-scoped check
const isAreaUser = session.user.role.startsWith('usuario_');
const userAreaId = session.user.areaId;

// Only admin can approve/reject
const canApprove = ['admin', 'tesorero'].includes(session.user.role);

// Area users can only see their own area's invoices
if (isAreaUser && invoice.areaId !== userAreaId) {
  return { error: 'Forbidden' };
}
```

## Invoice business rules

- Invoice number must match `/^\d{5}-\d{8}$/` (e.g. `00001-00000001`).
- `invoiceNumber` is unique in the DB — check before insert.
- Status transitions are one-way: `presentado → aprobado → pagado` or `presentado/aprobado → rechazado`.
- On rejection, `observations` field must be populated.
- On approval, update `budget_allocations.executed_amount` atomically.
- Amounts use `numeric(15,2)` — always handle as strings in JS, convert with `Number()` only when computing.

## Email notifications

- Use `sendEmail()` from `@/app/lib/SendMail`.
- Send on: invoice approved, invoice rejected.
- Do not block the response on email failure — wrap in try/catch and log.
