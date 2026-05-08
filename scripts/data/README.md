# Datos puntuales (no schema)

Esta carpeta contiene scripts/datos que no son parte del schema (que vive en [`app/lib/drizzle/schema.ts`](../../app/lib/drizzle/schema.ts) y se aplica con `npm run db:migrate`), sino **migraciones de datos** o herramientas auxiliares.

| Archivo | Qué es |
|---|---|
| `proveedores_insert.sql` | Lista real de proveedores CAMARCO + FODECO. INSERTs idempotentes contra `customers`. Útil para cargar datos reales en una DB nueva (en vez del seed mínimo de prueba). |
| `unificar_proveedores_generar_sql.py` | Script Python que generó el SQL de arriba a partir de planillas Excel. Usar solo si hay que regenerar el insert. |

## Uso

Para cargar los proveedores reales en una DB:

```bash
psql "$POSTGRES_URL" -f scripts/data/proveedores_insert.sql
```

> ⚠️ Antes de correr esto en producción, verificá `POSTGRES_URL`. Ver [`README.md` raíz](../../README.md) para la guía completa de seguridad de DB.
