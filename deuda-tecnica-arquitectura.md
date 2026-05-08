# Deuda Técnica — Arquitectura

> Documento generado el 2026-05-02 durante auditoría arquitectónica del monolito.
> Estas alertas fueron identificadas pero **no deben corregirse** hasta una sesión dedicada.

---

## 🔴 1. PDFs almacenados como base64 en PostgreSQL

**Ubicación**: `app/lib/actions.ts` (createInvoice, updateInvoice) y `app/lib/data.ts` (queries de invoices)

**Descripción**: Los archivos PDF adjuntos a facturas se convierten a base64 y se almacenan directamente en la columna `file` de la tabla `invoices`. Un PDF de 1 MB se convierte en ~1.3 MB de texto base64.

**Impacto**: Performance — filas enormes en la tabla de facturas, backups muy pesados, queries de listado innecesariamente lentas si se incluye la columna `file`.

**Corrección sugerida**: Migrar a un blob storage externo (Supabase Storage ya está parcialmente integrado en el proyecto). Almacenar solo la URL/path del archivo en la base de datos.

---

## 🔴 2. API Routes sin protección de autenticación

**Ubicación**: `middleware.ts` (líneas 77-79) — el matcher solo cubre `/dashboard/:path*`

**Descripción**: Las rutas de API (`/api/*`) no están protegidas por el middleware de autenticación. Cualquier request externo puede acceder directamente a los endpoints REST sin autenticación.

**Impacto**: Seguridad — exposición de datos sensibles (facturas, proveedores, presupuestos) y posibilidad de mutaciones no autorizadas.

**Corrección sugerida**: Extender el matcher del middleware para cubrir `/api/:path*` (excepto `/api/auth`), o bien agregar verificación de sesión (`getServerSession`) en cada route handler.

---

## 🔴 3. Pool de conexiones instanciado múltiples veces

**Ubicación**: `new Pool()` aparece en:
- `app/lib/actions.ts` (línea 124)
- `app/lib/data.ts` (línea 18)
- `app/lib/user.ts` (línea 3)
- `app/lib/db.ts` (línea 3)
- `app/api/invoices/route.ts` (línea 5)
- `app/api/budgets/route.ts` (línea 5)
- `app/api/customers/route.ts` (línea 4)
- Y otros route handlers

**Descripción**: Cada archivo crea su propia instancia de `Pool`, lo que puede resultar en múltiples pools activos simultáneamente. En entornos serverless (Vercel) o con hot-reloading, esto puede agotar las conexiones disponibles en la base de datos.

**Impacto**: Estabilidad — posible agotamiento de conexiones PostgreSQL, errores intermitentes bajo carga.

**Corrección sugerida**: Centralizar en `app/lib/db.ts` (que ya existe pero no se usa consistentemente) e importar el pool desde allí en todos los archivos.

---

## 🔴 4. `areaId` enviado por el cliente sin validación server-side

**Ubicación**: `app/api/invoices/route.ts` (línea 95) — `searchParams.get('areaId')`

**Descripción**: El `areaId` se pasa como query param desde el frontend (`/api/invoices?areaId=X`) y el backend no valida que coincida con la sesión del usuario autenticado. El valor es tomado directamente del request.

**Impacto**: Seguridad — un usuario autenticado podría cambiar el `areaId` en DevTools o manipular la URL para ver datos de otra área, anulando el filtrado por área.

**Corrección sugerida**: En las API routes, obtener `area_id` desde `getServerSession()` en lugar de confiar en el query param del cliente. Ignorar el `areaId` del request y usar exclusivamente el de la sesión para usuarios de área.
