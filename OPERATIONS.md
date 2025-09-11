# OPERATIONS — Runbook y mejores prácticas

Este documento resume tareas operativas frecuentes para el sistema de Facturas/Presupuestos.

## 1) Despliegue (Dev/Prod)

1. Verificar Node 18.17+ y variables en `.env` (ver README).
2. Instalar dependencias: `npm ci`/`npm install`.
3. Migrar/seed si aplica: `npm run seed` (usa `scripts/seed.js`).
4. Build y start:
   ```bash
   npm run build
   npm run start    # en prod detrás de PM2 / systemd / Docker
   ```

### Recomendado

- PM2 o systemd con reinicio automático.
- Reverse proxy (Nginx) con TLS, compresión y límite de tamaño de subida (para adjuntos).

## 2) Backups PostgreSQL

**Backup**

```bash
pg_dump --no-owner --format=c --dbname="$POSTGRES_URL" --file=backup_$(date +%F).dump
```

**Restore**

```bash
pg_restore --clean --if-exists --no-owner --dbname="$POSTGRES_URL" backup_YYYY-MM-DD.dump
```

> Mantener al menos 7 backups diarios + 4 semanales. Probar restore trimestralmente en entorno de staging.

## 3) Rotación de secretos

- Rotar `NEXTAUTH_SECRET` y credenciales SMTP al menos una vez por año.
- Nunca dejar credenciales en código (mover a `.env`).

## 4) Exportadores (Operación)

- Excel/TXT dependen de la integridad de datos de `invoices` y relaciones.
- Para volúmenes grandes, preferir exportaciones paginadas o por rango de fechas.

## 5) Monitoreo y registros

- Agregar logs en endpoints críticos (auth, export).
- Centralizar logs con formato JSON y retención de 30 días.
- Alertas básicas ante 5xx repetidos en 5 min.

## 6) Gestión de usuarios

- Política de contraseñas robustas (mín. 10 chars, complejidad).
- Considerar 2FA en futuro (NextAuth + OTP/Email).

## 7) Flujo de cambios

- Branching: `main` (prod) / `develop` (dev).
- PRs con revisión y checklist: linters, build ok, smoke tests API.
- Releases con changelog semántico y etiqueta git.

## 8) Plan de contingencia

- Caída de BD: restaurar desde backup más reciente; comunicar ventana de indisponibilidad.
- Corrupción de datos: aislar tabla, volcar a CSV, revisión manual, restore parcial.
