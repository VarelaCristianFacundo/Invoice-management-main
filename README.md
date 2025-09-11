# CAMARCO — Invoice & Budget Management (Next.js)

Sistema de gestión de **presupuestos, asignaciones y facturas** con exportación a Excel/TXT, autenticación con NextAuth y base de datos PostgreSQL.

> Este README ofrece una guía completa para clonar, configurar y ejecutar el proyecto en desarrollo; además resume la arquitectura, los módulos clave y las prácticas operativas sugeridas.

---

## 🧱 Stack técnico

- **Next.js 13.4.12 (App Router)** + **React 18.2.0**
- **TypeScript 5.1.6**
- **Tailwind CSS 3**, `@tailwindcss/forms`, `clsx`
- **NextAuth 4** (Credentials Provider)
- **PostgreSQL** (`pg` / `@vercel/postgres`)
- **Supabase JS** (para utilidades puntuales desde el cliente)
- **Zod**, **bcrypt**, **xlsx**, **nodemailer**
- Linting/format: **ESLint**, **Prettier**

## 📁 Estructura principal

```
app/
  api/                 ← Endpoints REST (Route Handlers)
  dashboard/           ← Módulos UI: invoices, budgets, customers, etc.
  lib/                 ← DB, helpers y servicios (auth, mail, utils)
  login/               ← Página de login
  ui/                  ← Componentes reutilizables (tables, forms, chips)
public/                ← Assets estáticos
scripts/               ← Seed de BD
```

Páginas y módulos destacados:

- **Dashboard (overview)**, **Invoices**, **Budgets**, **Allocations**, **Customers**, **Profile**
- Exportadores: `app/api/invoices/export-excel` y `app/api/invoices/export-txt`
- Autenticación: `app/api/auth/[...nextauth]` + `auth.ts`/`auth.config.ts`

## 🔐 Variables de entorno

Cree un archivo `.env` basado en [`.env.example`](InvoiceSystem-.env.example). Claves utilizadas por el proyecto:

- `POSTGRES_URL` — cadena de conexión a PostgreSQL
- `NEXTAUTH_SECRET` — secreto para firmar JWT/cookies
- `NEXTAUTH_URL` — URL pública/localhost de la app
- `SMTP_HOST`, `SMTP_PORT`, `SMTP_USER`, `SMTP_PASS`, `EMAIL_FROM` — correo saliente
- `NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY` — claves públicas de Supabase

> **Importante:** no comparta `.env` reales ni suba secretos al repositorio. Revise `app/lib/SendMail.ts` para mover credenciales hardcodeadas a variables de entorno.

## ▶️ Puesta en marcha (dev)

Requisitos: **Node 18.17+** y **pnpm** o **npm**.

```bash
# 1) Clonar el repo
git clone <REPO_URL>
cd <REPO_DIR>

# 2) Variables de entorno
cp .env.example .env
# Completar los valores reales

# 3) Dependencias
npm install

# 4) Base de datos (opcional según entorno)
npm run seed   # usa scripts/seed.js (requiere POSTGRES_URL)

# 5) Levantar
npm run dev
```

## 🗂️ Base de datos

- Conexión centralizada en `app/lib/db.ts` (usa `POSTGRES_URL`).
- Seed: `scripts/seed.js`.
- Ejemplos de entidades: `users`, `customers`, `invoices`, `budgets`, `programs`, etc.

### Backup/Restore rápido

Vea **OPERATIONS.md** para comandos `pg_dump` / `psql` y recomendaciones de respaldo.

## 🔑 Autenticación

- NextAuth (Credentials) con endpoints en `app/api/auth/[...nextauth]/route.ts` y lógica auxiliar en `auth.ts` / `auth.config.ts`.
- Página de login: `app/login/page.tsx`.
- Middleware de protección de rutas: `middleware.ts`.

## 📤 Exportadores

- **Excel**: `app/api/invoices/export-excel/route.ts`
- **TXT**: `app/api/invoices/export-txt/route.ts`

Los botones de exportación se encuentran en `app/ui/invoices/export-*.tsx`.

## 🧩 UI y funcionalidades clave

- **Invoices**: alta/edición, estado (`presentado | aprobado | pagado | rechazado`), paginación, búsqueda, export.
- **Customers**: ABM con validaciones (`zod`).
- **Budgets/Allocations**: creación, edición, rechazos, reporte por año, asignación por programas/áreas.
- **Reportes**: `app/api/report/invoices/route.ts`.
- **Autocomplete** de ítems contables: `app/ui/invoices/custom-autocomplete-contable-item.tsx`.

## 🧪 Calidad

- ESLint + Prettier configurados; scripts:
  - `npm run lint`
  - `npm run prettier` / `npm run prettier:check`

Sugerido: agregar **Husky** para formateo y lint en pre-commit.

## 🛡️ Seguridad (recomendado)

- Mover credenciales SMTP de `SendMail.ts` a `.env`. Rotar la clave.
- Usar `NEXTAUTH_SECRET` fuerte (32+ chars). Rotación anual.
- Revisión de permisos por página (si aplica RBAC), agregar pruebas de autorización a endpoints sensibles.
- Configurar cabeceras seguras y rate‑limit básico en endpoints de exportación.

## 🧭 Rutas API (resumen)

Listado completo en **API.md**. Grupos principales:

- `/api/invoices`, `/api/invoices/export-excel`, `/api/invoices/export-txt`
- `/api/customers`, `/api/programs`, `/api/budgets`, `/api/budget-allocations`
- `/api/report/invoices`, `/api/year`
- `/api/areas`, `/api/areas/[id]/funds`, `/api/area-funds`, `/api/area-funds-summary`

## 📝 Roadmap sugerido

- [ ] `.env.example` completo y migración segura de SMTP.
- [ ] README/OPERATIONS/API docs (este paquete).
- [ ] CI: lint + typecheck + smoke tests (exports/endpoints).
- [ ] Hardening de auth (política de contraseña, lockout).
- [ ] Métricas de uso y trazabilidad de exportaciones.

---

© Boot Coop — CAMARCO (internal) — 2025
