# Plan Técnico: Filtrado por Área para Usuarios de Área

> Generado el 2026-05-03 — Modo solo lectura (análisis y planificación).  
> Este documento describe los cambios necesarios para completar el filtrado por área.

---

## 1. Objetivo

Completar la funcionalidad de filtrado por área para que los usuarios de área (`usuario_*`) solo vean y gestionen datos (facturas, presupuestos, dashboard) de su propio sector/área.

---

## 2. Decisiones de Diseño Confirmadas

| Decisión | Respuesta |
|---|---|
| Filtrar proveedores por área | ❌ NO |
| Filtrar dashboard overview por área | ✅ SÍ |
| Corregir brecha de areaId del cliente | ⏳ Diferido → deuda técnica |
| Restringir selector de área en creación de factura | ❌ NO |
| Presupuestos para usuarios de área | ✅ Gestión completa de su área |
| Fuente de verdad de área de factura | `invoices.area_id` |
| Validar usuarios sin area_id | ❌ NO |
| Nuevo rol "jefe de área" | ❌ NO — los `usuario_*` existentes son gestores |
| Modificar `usuario_contable` | ❌ NO — se deja como está (ve todo) |

---

## 3. Lógica de `isAreaUser` (sin cambios)

La lógica existente en el código ya funciona correctamente para todos los casos:

```typescript
const isAreaUser = userRole?.startsWith('usuario_') && 
                   userRole !== 'usuario' && 
                   userRole !== 'usuario_presupuestos';
const userAreaId = isAreaUser ? session.user.area_id : null;
```

| Rol | ¿Es area user? | `area_id` | Resultado |
|---|---|---|---|
| `admin` | NO | — | Ve todo |
| `usuario` (superuser) | NO (excluido) | — | Ve todo |
| `usuario_presupuestos` | NO (excluido) | — | Ve todo |
| `tesorero` | NO (no empieza con `usuario_`) | — | Ve todo |
| `usuario_contable` | SÍ técnicamente | `null` | `userAreaId = null` → ve todo |
| `usuario_sistemas` | SÍ | `5` | Filtra por área 5 |
| `usuario_marketing` | SÍ | `3` | Filtra por área 3 |

**No se modifica esta lógica.**

---

## 4. Cambios por Componente

### 4.1 Dashboard Overview — Filtrado por Área

**Problema:** Las cards de resumen y los gráficos muestran datos globales. Un `usuario_sistemas` ve los totales de TODAS las áreas.

**Archivos a modificar:**

#### `app/dashboard/(overview)/page.tsx`
- Importar `getServerSession` y `authOptions`
- Obtener sesión, calcular `userAreaId` con la lógica `isAreaUser`
- Pasar `userAreaId` como prop a `<CardWrapper>` y `<StatusSummaryChartWrapper>`

#### `app/ui/dashboard/cards.tsx`
- Agregar `areaId?: string | null` a las props de `CardWrapper`
- Pasar `areaId` a `fetchCardData()`

#### `app/lib/data.ts` → función `fetchCardData()`
- Agregar `areaId?: string | null` al objeto `filters`
- Cuando `areaId` presente, agregar al WHERE: `AND area_id = $N`
- Usa columna directa `invoices.area_id` (fuente de verdad)

#### `app/ui/dashboard/status-summary-chart-wrapper.tsx`
- Agregar `areaId?: string | null` a las props
- Pasar `areaId` a `fetchStatusSummaryData()`

#### `app/lib/chart-data.ts` → función `fetchStatusSummaryData()`
- Agregar parámetro `areaId?: string | null`
- Cuando presente, agregar al WHERE: `AND area_id = $N`

---

### 4.2 Presupuestos — Habilitar Gestión por Área

**Problema:** El middleware restringe `/dashboard/budgets` solo a `admin` y `usuario_presupuestos`. Los usuarios de área no pueden acceder.

**Archivos a modificar:**

#### `middleware.ts`
- En `roleBasedRoutes`, agregar `...areaRoles` a `/dashboard/budgets`:
  ```
  '/dashboard/budgets': ['admin', 'usuario_presupuestos', ...areaRoles],
  ```
- `/dashboard/budgets/rejected` permanece solo para `admin` y `usuario_presupuestos`

#### `app/ui/dashboard/nav-links.tsx`
- En el link de "Proyectos", agregar todos los roles de área al array `roles`

#### `app/lib/data.ts` → función `fetchBudgetsPages()`
- Agregar parámetro `areaId?: string | null`
- Cuando presente, agregar JOIN con `budget_allocations` y filtrar por `area_id`
- Corrige la paginación para que sea consistente con el filtrado de la API

#### `app/dashboard/budgets/page.tsx`
- Pasar `userAreaId` a `fetchBudgetsPages()` para paginación correcta

---

### 4.3 Fuente de Verdad — Unificar a `invoices.area_id`

**Problema:** Algunas queries filtran por `ba.area_id` (vía JOIN con `budget_allocations`) y otras por `invoices.area_id`. Hay que unificar.

**Archivos a modificar:**

#### `app/api/invoices/route.ts`
- Línea 56: cambiar `AND ba.area_id = $5` → `AND i.area_id = $5`

#### `app/lib/data.ts` → función `fetchFilteredInvoices()`
- Línea 192: cambiar `AND ba.area_id = $4` → `AND i.area_id = $4`

#### `app/lib/data.ts` → función `fetchInvoicesPages()`
- Línea 267: cambiar `AND ba.area_id = $2` → `AND i.area_id = $2`

---

### 4.4 Export Excel — Filtrado por Área

**Problema:** `generateExcelReport()` extrae TODAS las facturas sin filtrar por área.

**Archivos a modificar:**

#### `app/lib/data.ts` → función `generateExcelReport()`
- Agregar parámetro `areaId?: string | null`
- Cuando presente, agregar `WHERE iv.area_id = $1` a la query

#### `app/api/invoices/export-excel/route.ts`
- Obtener sesión con `getServerSession(authOptions)`
- Calcular `userAreaId`
- Pasar a `generateExcelReport(areaId)`

---

### 4.5 Deuda Técnica — Documentar Brecha de Seguridad

**Archivo a modificar:**

#### `deuda-tecnica-arquitectura.md`
- Agregar ítem #5: **`areaId` enviado por el cliente sin validación server-side**
- El `areaId` se pasa como query param desde el frontend (`/api/invoices?areaId=X`) y el backend no valida que coincida con la sesión del usuario
- Riesgo: un usuario autenticado podría cambiar el `areaId` en DevTools para ver datos de otra área
- Corrección sugerida: obtener `area_id` desde `getServerSession()` en las API routes

---

## 5. Resumen de Archivos

| # | Archivo | Tipo de Cambio |
|---|---|---|
| 1 | `app/dashboard/(overview)/page.tsx` | Obtener sesión, propagar `areaId` |
| 2 | `app/ui/dashboard/cards.tsx` | Aceptar y usar `areaId` prop |
| 3 | `app/ui/dashboard/status-summary-chart-wrapper.tsx` | Aceptar y usar `areaId` prop |
| 4 | `app/lib/data.ts` | 5 funciones: agregar filtrado por `area_id` |
| 5 | `app/lib/chart-data.ts` | `fetchStatusSummaryData` con `areaId` |
| 6 | `middleware.ts` | Abrir budgets para area roles |
| 7 | `app/ui/dashboard/nav-links.tsx` | Agregar area roles a Proyectos |
| 8 | `app/api/invoices/route.ts` | Cambiar filtro a `i.area_id` |
| 9 | `app/api/invoices/export-excel/route.ts` | Agregar filtrado por sesión |
| 10 | `app/dashboard/budgets/page.tsx` | Pasar `areaId` a paginación |
| 11 | `deuda-tecnica-arquitectura.md` | Agregar brecha de seguridad |

**Total: 11 archivos, 0 archivos nuevos, 0 archivos eliminados.**

---

## 6. Plan de Verificación

### Build
```bash
npm run build
```

### Pruebas Manuales

| # | Usuario | Qué verificar |
|---|---|---|
| 1 | `usuario_sistemas` (u otro de área) | Dashboard muestra solo datos de su área |
| 2 | `usuario_sistemas` | Facturas: solo las de su área |
| 3 | `usuario_sistemas` | Presupuestos: aparece en menú, muestra solo su área |
| 4 | `usuario_sistemas` | Export Excel: solo facturas de su área |
| 5 | `admin` | Dashboard, facturas, presupuestos: ve todo |
| 6 | `usuario` (superuser) | Ve todo sin restricción |
| 7 | `usuario_contable` | Ve todo sin restricción (sin cambios) |

---

## 7. Estimación

| Componente | Complejidad | Tiempo estimado |
|---|---|---|
| Dashboard Overview filtrado | 🟡 Media | ~2h |
| Presupuestos habilitados | 🟢 Baja | ~1h |
| Unificar a `invoices.area_id` | 🟢 Baja | ~30min |
| Export Excel filtrado | 🟢 Baja | ~30min |
| Deuda técnica (doc) | 🟢 Baja | ~15min |
| **Total** | | **~4-5 horas** |
