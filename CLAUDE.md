# Project conventions for AI agents

This file is auto-loaded by Claude Code (and compatible agents) when working in this repo. It captures conventions that the team has agreed on so any agent — regardless of who's driving — applies them consistently.

## Keep README.md current

When you make a change that affects how someone **sets up, runs, deploys, or operates** this project, update [README.md](README.md) in the same change set. Don't defer it; stale docs are worse than missing ones because they actively mislead.

Trigger an update when any of these change:

- **Stack** — adding/removing a major library, switching ORM, upgrading framework majors
- **Environment variables** — new `.env` keys, removed ones, format changes
- **Scripts in `package.json`** — new `db:*`, `seed`, deploy, etc.
- **Setup or quickstart flow** — clone → install → config → run sequence
- **Schema-management workflow** — migration generation/application steps, new conventions
- **Folder structure** when it affects navigation/onboarding
- **Production deployment steps**

What "update" means concretely:

- Edit the relevant section in place. Don't append to the bottom.
- Replace obsolete steps; don't leave the old next to the new ("`npm run seed`" alongside "`npm run db:seed`" confuses readers — pick one).
- Keep destructive-action warnings **loud and prominent**. The `POSTGRES_URL` block in `README.md` is the template: blockquote, `# ⚠️` heading, explicit "rules mínimas" list.
- Use clickable markdown file paths (`[file](path)`) so the doc is navigable.
- Cross-reference related docs ([docs/OPERATIONS.md](docs/OPERATIONS.md), [docs/API.md](docs/API.md)) when they exist.

Skip the README update for tiny internal refactors that don't change the surface developers interact with (renaming a private helper, fixing a bug in one function, etc.).

If you're about to wrap up a non-trivial change, scan the README mentally before saying you're done — if it's now inaccurate, propose the edit.

## Database / migrations

Schema lives at [`app/lib/drizzle/schema.ts`](app/lib/drizzle/schema.ts). Migrations are generated into [`drizzle/`](drizzle/) and tracked in `drizzle/meta/_journal.json`.

> # ⚠️ Any change to `schema.ts` REQUIRES a new migration in the same commit
>
> No excepciones. Cambiar `schema.ts` sin generar la migración deja la DB de cualquiera que levante el proyecto desincronizada del código — y los errores aparecen recién en runtime (inserts que rompen, columnas que no existen, tipos que no coinciden).
>
> Esto aplica a **cualquier** edición de `schema.ts`: agregar/eliminar tablas o columnas, cambiar tipos, ajustar `length`, agregar `notNull`/`default`, modificar FKs, etc. Si el diff de tu PR toca `schema.ts` y no incluye archivos nuevos bajo `drizzle/`, falta la migración.

- **Never** run `db:push` or `db:migrate` without first verifying `POSTGRES_URL` doesn't point to production.
- **Never** edit or delete an already-applied migration. Generate a new one that complements/reverses it.
- When you change `schema.ts`:
  1. Generate the migration: `npm run db:generate`
  2. **Review the generated SQL** in `drizzle/NNNN_*.sql` — drizzle-kit can infer DROPs/renames you didn't intend.
  3. Apply locally: `npm run db:migrate` (after confirming `POSTGRES_URL` is not prod).
  4. Commit `app/lib/drizzle/schema.ts` **together with** the new files in `drizzle/` (the `.sql`, the `meta/NNNN_snapshot.json`, and the updated `meta/_journal.json`).

Before saying a change is done, if you touched `schema.ts`, verify `git status` shows new files under `drizzle/`. If it doesn't, you forgot step 1.

The full workflow with the production warning is in [README.md](README.md#-base-de-datos-y-migraciones) — keep that section as the source of truth and update it when the workflow changes.
