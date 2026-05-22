---
name: production-deploy
description: Use this skill when preparing or debugging production deployments, PM2, Nginx, Next.js build/start, environment variables, or server incidents.
---

# Production Deploy Skill

## Required environment variables

Check that these are set before every deploy:

```bash
POSTGRES_URL=        # PostgreSQL connection string (NEVER prod on local)
NEXTAUTH_URL=        # Full public URL of the app (e.g. https://facturas.camarco.com)
NEXTAUTH_SECRET=     # Random secret for NextAuth JWT signing
EMAIL_HOST=          # SMTP host
EMAIL_USER=          # SMTP user
EMAIL_PASS=          # SMTP password
EMAIL_FROM=          # From address
```

## Deploy checklist

```bash
# 1. Check current branch and status
git status
git log --oneline -5

# 2. Pull latest
git pull origin main

# 3. Install dependencies (if package.json changed)
npm ci

# 4. Apply pending DB migrations (confirm POSTGRES_URL != prod first)
grep POSTGRES_URL .env.local
npm run db:migrate

# 5. Build
npm run build

# 6. Restart with PM2
pm2 restart camarco-invoices
# or if starting fresh:
pm2 start npm --name "camarco-invoices" -- start
pm2 save

# 7. Check status and logs
pm2 status
pm2 logs camarco-invoices --lines 50

# 8. Smoke test
curl -I http://localhost:3000/login
```

## Nginx checks

```bash
# Test config
nginx -t

# Status
systemctl status nginx

# Reload (zero-downtime config reload)
systemctl reload nginx

# Logs
journalctl -u nginx --since "5 minutes ago"
tail -f /var/log/nginx/error.log
```

## PM2 commands

```bash
pm2 status                    # Show all processes
pm2 logs camarco-invoices      # Tail logs
pm2 restart camarco-invoices   # Rolling restart
pm2 stop camarco-invoices      # Stop
pm2 reload camarco-invoices    # Zero-downtime reload
pm2 describe camarco-invoices  # Show config + env
pm2 save                       # Persist current process list
pm2 startup                    # Enable PM2 on system boot
```

## Rollback

```bash
# Go back to previous commit
git log --oneline -10
git checkout <previous-hash>
npm ci
npm run build
pm2 restart camarco-invoices
```

## DB-specific deploy notes

- Run `npm run db:migrate` (not `db:push`) to apply migrations.
- Migrations are tracked in `drizzle/meta/_journal.json`.
- Before running any migration in prod, verify the SQL in `drizzle/NNNN_*.sql` manually.
- Keep a `pg_dump` backup before any migration that adds/drops columns or tables.
