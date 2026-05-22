---
applyTo: "**"
---

# CAMARCO Invoice Management — Project Conventions

## Stack

- **Framework**: Next.js 15 App Router, React 18
- **Language**: TypeScript 5 (strict mode)
- **Database**: PostgreSQL via Drizzle ORM (`drizzle-orm`)
- **Auth**: NextAuth v4 with CredentialsProvider + bcrypt
- **Styling**: Tailwind CSS 3
- **Validation**: Zod
- **UI extras**: heroicons, SweetAlert2, Recharts, react-dropzone
- **Email**: nodemailer (SendMail.ts)
- **Exports**: ExcelJS (xlsx), custom TXT

## Folder map

```
app/
  api/          → API route handlers (route.ts files)
  dashboard/    → All authenticated pages
  lib/
    actions.ts  → Server actions ('use server')
    data.ts     → DB read functions (Drizzle)
    definitions.ts → Shared TypeScript types
    drizzle/    → schema.ts + db.ts
    utils.ts    → Formatting helpers
  ui/           → Reusable React components
drizzle/        → Generated migration SQL + meta snapshots
scripts/        → One-off seed scripts
```

## Communication

- Respond to the developer **in Spanish**.
- Write code, comments, logs, variable names, and commit messages **in English**.

## Business domain

### Companies
The system tracks two companies (`company_id` 1 and 2). Most entities are scoped to a company.

### Invoice lifecycle
Status values (DB constraint): `presentado → aprobado → pagado | rechazado`
- `presentado`: submitted by an area user, pending approval.
- `aprobado`: approved by admin/tesorero, pending payment.
- `pagado`: payment confirmed.
- `rechazado`: rejected — requires an observation explaining why.

### Roles (UserRole)
| Role | Access |
|------|--------|
| `admin` | Full access to everything |
| `usuario` | Can manage invoices across all areas |
| `usuario_administracion` / `usuario_contable` / etc. | Limited to their area only |
| `tesorero` | Legacy — can approve/pay invoices |
| `usuario_presupuestos` | Legacy — budget view |

Area-scoped users (`usuario_*`) must only see and create invoices for `areaId` matching their `area_id`.

### Budgets
- A `budget` (project) has `budget_allocations` per area, year, and half (1 = first half, 2 = second half).
- When an invoice is approved, `executed_amount` in `budget_allocations` is updated.
- The system checks that `allocated_amount - executed_amount >= invoice.amount` before approval.

### Area funds
`area_funds` tracks allocated funds per area/year/half, separate from project budgets.

## Coding rules

- Never use `any` unless absolutely unavoidable — document why.
- Prefer explicit TypeScript types from `app/lib/definitions.ts`.
- Server-side business logic stays in `actions.ts` or `data.ts`, not in components.
- Always validate user input with Zod before touching the database.
- After every DB mutation call `revalidatePath` to bust Next.js cache.
- Do not expose secrets or session internals to the client.

## Before marking a task done

1. Check TypeScript errors (`npm run build` or `tsc --noEmit`).
2. Verify no lint warnings on changed files.
3. If `schema.ts` was touched, confirm migration files exist under `drizzle/`.
4. Confirm role-based access is respected in changed mutations.
5. Confirm no production-breaking change was introduced silently.
