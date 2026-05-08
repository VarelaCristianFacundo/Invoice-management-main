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
- Cross-reference related docs (OPERATIONS.md, API.md) when they exist.

Skip the README update for tiny internal refactors that don't change the surface developers interact with (renaming a private helper, fixing a bug in one function, etc.).

If you're about to wrap up a non-trivial change, scan the README mentally before saying you're done — if it's now inaccurate, propose the edit.

## Database / migrations

Schema lives at [`app/lib/drizzle/schema.ts`](app/lib/drizzle/schema.ts). Migrations are generated into [`drizzle/`](drizzle/) and tracked in `drizzle/meta/_journal.json`.

- **Never** run `db:push` or `db:migrate` without first verifying `POSTGRES_URL` doesn't point to production.
- **Never** edit or delete an already-applied migration. Generate a new one that complements/reverses it.
- When you change `schema.ts`, generate the migration (`npm run db:generate`), **review the generated SQL** (drizzle-kit can infer DROPs/renames you didn't intend), then apply with `npm run db:migrate`.
- Commit `app/lib/drizzle/schema.ts` and the new files in `drizzle/` together.

The full workflow with the production warning is in [README.md](README.md#-base-de-datos-y-migraciones) — keep that section as the source of truth and update it when the workflow changes.
