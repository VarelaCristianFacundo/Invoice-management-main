# API — Resumen de endpoints

> Esta es una vista general basada en la estructura del código (`app/api`). Verifique cada `route.ts` para métodos y esquemas exactos.

## Autenticación

- `POST /api/auth/[...nextauth]` — NextAuth (credentials)

## Invoices

- `GET/POST /api/invoices`
- `GET/PUT/DELETE /api/invoices/[id]`
- `GET /api/invoices/customer/[customer_id]`
- `GET /api/invoices/export-excel`
- `GET /api/invoices/export-txt`

## Customers

- `GET/POST /api/customers` (si aplica en código de `customers`)
- `GET/PUT/DELETE /api/customers/[customer_id]` (según implementación UI)

## Budgets & Allocations

- `GET/POST /api/budgets`
- `GET/PUT/DELETE /api/budget/[id]`
- `POST /api/budget/[id]/reject`
- `GET/POST /api/budget-allocations` — `POST` hace upsert por
  (`projectId`, `area`, `year`, `half`); un área admite varias líneas por
  semestre.

## Programs / Areas

- `GET/POST /api/programs`
- `GET/POST /api/areas`
- `GET /api/areas/[id]/funds`
- `GET /api/area-funds`
- `GET /api/area-funds-summary?companyId=` — totales por área/año/semestre
  (suma de las líneas) más el detalle de cada línea en `funds[].lines[]`.

## Reports & Misc

- `GET /api/report/invoices`
- `GET /api/year`

> **Notas**
>
> - Validaciones: `zod` en formularios (cliente/servidor).
> - Autorización: middleware + verificación de sesión en handlers sensibles.
> - Exports: optimizar filtros y paginación para grandes volúmenes.
