# CAMARCO — Invoice & Budget Management (Next.js)

Sistema de gestión de **presupuestos, asignaciones y facturas** con exportación a Excel/TXT, autenticación con NextAuth y base de datos PostgreSQL.

> Este README ofrece una guía completa para clonar, configurar y ejecutar el proyecto en desarrollo; además resume la arquitectura, los módulos clave y las prácticas operativas sugeridas.

---

## 🧱 Stack técnico

- **Next.js 15 (App Router)** + **React 18.2.0**
- **TypeScript 5.1.6**
- **Tailwind CSS 3**, `@tailwindcss/forms`, `clsx`
- **NextAuth 4** (Credentials Provider)
- **PostgreSQL** (`pg`) + **Drizzle ORM** + `drizzle-kit` (migraciones)
- **Zod**, **bcrypt**, **exceljs**, **nodemailer**
- Linting/format: **ESLint**, **Prettier**

## 📁 Estructura principal

```
app/
  api/                 ← Endpoints REST (Route Handlers)
  dashboard/           ← Módulos UI: invoices, budgets, customers, etc.
  lib/
    drizzle/           ← Schema, relations y cliente Drizzle (fuente de verdad de la DB)
    *.ts               ← Helpers y servicios (auth, mail, utils, data, actions)
  login/               ← Página de login
  ui/                  ← Componentes reutilizables (tables, forms, chips)
drizzle/               ← Migraciones SQL versionadas (drizzle-kit) + meta/snapshot
docs/                  ← Documentación complementaria (API, OPERATIONS, planes, deuda técnica)
public/                ← Assets estáticos
scripts/
  seed-drizzle.ts      ← Seed inicial con datos mínimos (npm run db:seed)
  data/                ← Migraciones de datos puntuales (proveedores reales, etc.)
```

Páginas y módulos destacados:

- **Dashboard (overview)**, **Invoices**, **Budgets**, **Allocations**, **Customers**, **Profile**
- Exportadores: `app/api/invoices/export-excel` y `app/api/invoices/export-txt`
- Autenticación: `app/api/auth/[...nextauth]` + `auth.ts`/`auth.config.ts`

## 🔐 Variables de entorno

Cree un archivo `.env` basado en [`.env.example`](.env.example). Claves utilizadas por el proyecto:

- `POSTGRES_URL` — cadena de conexión a PostgreSQL
- `NEXTAUTH_SECRET` — secreto para firmar JWT/cookies
- `NEXTAUTH_URL` — URL pública/localhost de la app
- `SMTP_HOST`, `SMTP_PORT`, `SMTP_USER`, `SMTP_PASS`, `EMAIL_FROM` — correo saliente
- `NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY` — claves públicas de Supabase

> **Importante:** no comparta `.env` reales ni suba secretos al repositorio. Revise `app/lib/SendMail.ts` para mover credenciales hardcodeadas a variables de entorno.

## ▶️ Puesta en marcha (dev)

Requisitos: **Node 18.17+** y **npm**.

```bash
# 1) Clonar el repo
git clone <REPO_URL>
cd <REPO_DIR>

# 2) Variables de entorno
cp .env.example .env
# Completar los valores reales (ver advertencia en sección "Base de datos")

# 3) Dependencias
npm install

# 4) Crear el schema en una DB local vacía (ver sección de migraciones)
npm run db:migrate
npm run db:seed   # opcional — carga datos mínimos para probar

# 5) Levantar
npm run dev
```

## 🗂️ Base de datos y migraciones

El schema se gestiona con **Drizzle ORM**. Fuente de verdad: [`app/lib/drizzle/schema.ts`](app/lib/drizzle/schema.ts). Las migraciones SQL versionadas viven en [`drizzle/`](drizzle/) y se aplican con `drizzle-kit`.

> # ⚠️ ATENCIÓN — VERIFICÁ `POSTGRES_URL` ANTES DE CADA COMANDO DB
>
> Los comandos `db:migrate`, `db:push` y `db:seed` aplican cambios contra **la DB que apunte tu `.env` actual**. Si `POSTGRES_URL` apunta a producción, **los cambios afectan producción**. No hay confirmación, no hay rollback automático.
>
> **Reglas mínimas:**
> - Nunca dejes `POSTGRES_URL=` de prod en tu `.env` local.
> - Antes de cualquier comando `db:*`, ejecutá `echo $env:POSTGRES_URL` (PowerShell) o `echo $POSTGRES_URL` (bash) y leé la URL.
> - **Nunca uses `db:push` contra prod.** Es para prototipar en local; pisa el schema sin versionar.
> - Hacé backup (`pg_dump`) ANTES de aplicar migraciones a prod. Ver [docs/OPERATIONS.md](docs/OPERATIONS.md).

### Comandos disponibles

| Comando | Qué hace | Modifica DB? |
|---|---|---|
| `npm run db:pull` | Introspecciona la DB y regenera `schema.ts` (solo en resync inicial) | No |
| `npm run db:generate` | Compara `schema.ts` con el snapshot y genera `drizzle/00xx_*.sql` con el diff | No |
| `npm run db:migrate` | Aplica las migraciones pendientes a `POSTGRES_URL` | **Sí** |
| `npm run db:push` | Sincroniza schema directo contra DB **sin versionar** (solo dev) | **Sí** |
| `npm run db:studio` | Abre UI web de Drizzle para inspeccionar/editar datos | Lee/escribe |
| `npm run db:seed` | Carga datos mínimos (companies, areas, admin, customers de prueba) | **Sí** |

### Setup inicial (primera vez, DB local vacía)

```bash
# 1. Crear DB vacía (ej. en psql)
#    CREATE DATABASE invoices_local;

# 2. Apuntar POSTGRES_URL a esa DB en .env
#    POSTGRES_URL=postgres://user:pass@localhost:5432/invoices_local

# 3. Aplicar todas las migraciones existentes
npm run db:migrate

# 4. (Opcional) Cargar datos mínimos
npm run db:seed
# → admin@camarco.local / admin123

# 5. Listo
npm run dev
```

### Cuando cambia el schema

Cualquier modificación a `app/lib/drizzle/schema.ts` (agregar columna, tabla, constraint, índice, etc.):

```bash
# 1. Generar el SQL de migración (offline, no toca la DB)
npm run db:generate
# → crea drizzle/00xx_<nombre>.sql con el ALTER/CREATE necesario

# 2. REVISAR el SQL generado antes de aplicarlo
#    Abrí el archivo nuevo en drizzle/ y leelo entero.
#    Drizzle ocasionalmente puede inferir DROPs o renames no deseados.

# 3. Aplicar a tu DB local
npm run db:migrate

# 4. Probar que todo sigue funcionando
npm run dev

# 5. Commit del cambio
#    Subí TANTO schema.ts COMO el .sql generado y los archivos de drizzle/meta/
git add app/lib/drizzle/ drizzle/
git commit -m "db: <descripción del cambio>"
```

Drizzle mantiene una tabla `__drizzle_migrations` en la DB con las migraciones aplicadas. **Nunca borres ni edites una migración ya aplicada** — siempre generá una nueva que la complemente o la revierta.

### Despliegue a producción

1. PR mergeado a `main` con la migración nueva generada y revisada.
2. **Backup de prod ANTES de migrar** (`pg_dump` — ver [docs/OPERATIONS.md](docs/OPERATIONS.md)).
3. En el entorno de prod, con `POSTGRES_URL` apuntando a prod:
   ```bash
   npm run db:migrate
   ```
4. Verificar que la migración aplicó correctamente y que la app sigue OK.

### `db:push` vs `db:migrate`

| | `db:migrate` (recomendado) | `db:push` |
|---|---|---|
| Versionado | Sí, archivos `.sql` en repo | No |
| Reproducible | Sí | No |
| Audit-friendly | Sí (revisás el SQL antes) | No |
| Apto para prod | **Sí** | **Nunca** |
| Útil para | Workflow normal | Prototipar muy rápido en local |

### Backup/Restore rápido

Vea [docs/OPERATIONS.md](docs/OPERATIONS.md) para comandos `pg_dump` / `psql` y recomendaciones de respaldo.

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

Listado completo en [docs/API.md](docs/API.md). Grupos principales:

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
