---
name: invoice-domain
description: Use this skill when implementing or debugging invoice lifecycle, budget allocation, area funds, approval flows, role-based access, or any CAMARCO-specific business rules.
---

# Invoice Domain Skill

## Invoice lifecycle

```
presentado → aprobado → pagado
           ↓           ↓
        rechazado   rechazado
```

- `presentado`: created by an area user. Editable.
- `aprobado`: approved by `admin` or `tesorero`. Triggers budget execution update.
- `pagado`: payment confirmed by `admin` or `tesorero`.
- `rechazado`: rejected at any stage. `observations` field is **required**.

### Approval logic (check before approving)

```ts
// 1. Invoice must be 'presentado'
if (invoice.status !== 'presentado') return { error: 'Only presentado invoices can be approved' };

// 2. Budget allocation must have enough remaining
const allocation = await getBudgetAllocation(invoice.budgetAllocationId);
const remaining = Number(allocation.allocatedAmount) - Number(allocation.executedAmount);
if (remaining < Number(invoice.amount)) {
  return { error: 'Insufficient budget allocation' };
}

// 3. Update atomically in a transaction
await drizzleDb.transaction(async (tx) => {
  await tx.update(invoices).set({ status: 'aprobado' }).where(eq(invoices.id, id));
  await tx.update(budgetAllocations)
    .set({ executedAmount: (Number(allocation.executedAmount) + Number(invoice.amount)).toFixed(2) })
    .where(eq(budgetAllocations.id, invoice.budgetAllocationId));
});
```

### Rejection logic

```ts
if (!observations || observations.trim() === '') {
  return { error: 'Observations are required when rejecting' };
}
await drizzleDb.update(invoices)
  .set({ status: 'rechazado', observations })
  .where(eq(invoices.id, id));
```

## Invoice number format

Pattern: `NNNNN-NNNNNNNN` (5 digits, dash, 8 digits). Example: `00001-00000042`.
- Unique constraint in the DB.
- Validate with: `/^\d{5}-\d{8}$/`
- Check for duplicates with the `/api/invoices/check-number` endpoint before creating.

## Role-based access matrix

| Action | admin | tesorero | usuario | usuario_* |
|--------|-------|----------|---------|----------|
| View all invoices | ✅ | ✅ | ✅ | ❌ (own area only) |
| Create invoice | ✅ | ❌ | ✅ | ✅ (own area only) |
| Edit invoice (presentado) | ✅ | ❌ | ✅ | ✅ (own area only) |
| Approve invoice | ✅ | ✅ | ❌ | ❌ |
| Reject invoice | ✅ | ✅ | ❌ | ❌ |
| Mark as paid | ✅ | ✅ | ❌ | ❌ |
| Manage customers | ✅ | ❌ | ✅ | ❌ |
| Manage budgets | ✅ | ❌ | ❌ | usuario_presupuestos |
| View dashboard | ✅ | ✅ | ✅ | ✅ |

## Area-scoped user pattern

```ts
const isAreaUser = (role: string) => role.startsWith('usuario_') && role !== 'usuario_presupuestos';

// When querying invoices for an area user:
if (isAreaUser(session.user.role)) {
  conditions.push(eq(invoices.areaId, session.user.areaId!));
}
```

## Budget allocation structure

- A `budget` represents a project (e.g. "Obra Edificio Central 2024").
- Each budget can have multiple `budget_allocations` — one per area/year/half combination.
- `half`: 1 = January–June, 2 = July–December.
- `executed_amount` is incremented when an invoice is approved and decremented if the invoice is rejected/deleted.

## Area funds vs. budget allocations

- `area_funds`: global money assigned to an area for a period (not project-specific).
- `budget_allocations`: project-specific money assigned to an area for a period.
- They are independent tables — one invoice can reference a `budget_allocation` but area funds are tracked separately.

## Customer (provider) fields

| Field | Format | Notes |
|-------|--------|-------|
| `cuit_cuil` | 11 digits, no separators | Use `isValidCuitCuil()` from utils.ts |
| `cbu_cvu` | 22 digits | Use regex `^\d{22}$` |
| `iva_condition` | Enum string | See `ivaConditionValues` in actions.ts |
| `company_id` | 1 or 2 | Which CAMARCO company |

## Email notifications

Send emails on:
- Invoice approved → notify the submitting area user.
- Invoice rejected → notify the submitting area user with the rejection reason.

Use `sendEmail()` from `@/app/lib/SendMail`. Do not block the main response — fire and forget in a try/catch.
