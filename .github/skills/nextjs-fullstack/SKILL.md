---
name: nextjs-fullstack
description: Use this skill when implementing or debugging Next.js App Router features, API routes, server actions, forms, dashboards, and TypeScript components in the CAMARCO invoice system.
---

# Next.js Fullstack Skill

## Checklist before coding

1. Read the existing file/route/component you're changing.
2. Identify whether the change belongs in:
   - `app/ui/` → reusable component
   - `app/dashboard/<feature>/page.tsx` → page server component
   - `app/lib/actions.ts` → server action (mutation)
   - `app/lib/data.ts` → DB read function
   - `app/api/<resource>/route.ts` → REST endpoint
   - `app/lib/drizzle/schema.ts` → schema change (requires migration)
3. Keep business logic server-side.
4. Keep UI components focused on rendering and interaction.
5. Validate inputs before writing to the database.
6. Handle loading, empty, success, and error states.
7. Avoid broad rewrites — change only what's needed.

## Server action pattern

```ts
// app/lib/actions.ts
'use server';
import { z } from 'zod';
import { revalidatePath } from 'next/cache';
import { auth } from '@/auth';
import { drizzleDb } from './drizzle/db';
import { invoices } from './drizzle/schema';

const Schema = z.object({ /* ... */ });

export async function createInvoice(formData: FormData) {
  const session = await auth();
  if (!session) return { error: 'Unauthorized' };

  const parsed = Schema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { error: parsed.error.flatten().fieldErrors };

  await drizzleDb.insert(invoices).values(parsed.data);
  revalidatePath('/dashboard/invoices');
  return { success: true };
}
```

## Page (RSC) + Suspense pattern

```tsx
// app/dashboard/invoices/page.tsx
import { Suspense } from 'react';
import { auth } from '@/auth';
import { redirect } from 'next/navigation';
import { fetchInvoices } from '@/app/lib/data';
import InvoicesTable from '@/app/ui/invoices/table';
import { TableSkeleton } from '@/app/ui/skeletons';

export default async function Page({
  searchParams,
}: {
  searchParams?: { query?: string; page?: string };
}) {
  const session = await auth();
  if (!session) redirect('/login');

  return (
    <div className="w-full">
      <h1 className="text-2xl font-semibold text-gray-900">Facturas</h1>
      <Suspense fallback={<TableSkeleton />}>
        <InvoicesTable query={searchParams?.query} />
      </Suspense>
    </div>
  );
}
```

## API route pattern

```ts
// app/api/invoices/route.ts
import { NextResponse } from 'next/server';
import { getServerSession } from 'next-auth';
import { authOptions } from '@/authOptions';
import { drizzleDb } from '@/app/lib/drizzle/db';
import { invoices } from '@/app/lib/drizzle/schema';

export async function GET(request: Request) {
  const session = await getServerSession(authOptions);
  if (!session) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });

  const rows = await drizzleDb.select().from(invoices);
  return NextResponse.json(rows);
}
```

## Data fetch function pattern

```ts
// app/lib/data.ts
import { drizzleDb } from './drizzle/db';
import { invoices, customers } from './drizzle/schema';
import { eq, desc } from 'drizzle-orm';

export async function fetchInvoiceById(id: string) {
  const [row] = await drizzleDb
    .select()
    .from(invoices)
    .where(eq(invoices.id, id))
    .limit(1);
  return row ?? null;
}
```

## After implementing

- Did `schema.ts` change? Run `npm run db:generate` and commit migrations.
- Test with `npm run build` — ensure no TypeScript errors.
- Test: create, edit, delete, and view the changed feature.
- Check role-based access: test with an area user and an admin user.
