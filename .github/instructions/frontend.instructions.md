---
applyTo: "app/**/*.tsx,app/**/*.ts,app/ui/**"
---

# Frontend Conventions

## Component model

- Default to **React Server Components (RSC)** — no `'use client'` unless truly needed.
- Add `'use client'` only when you need: browser APIs, event listeners, `useState`, `useEffect`, or client-only libraries.
- Keep client components small and at the leaves of the component tree.
- Pass data down from server components via props — don't fetch in client components.

## Forms and mutations

- Use **server actions** from `app/lib/actions.ts` — bind them to `<form action={...}>` or call from event handlers.
- Use `useFormState` / `useActionState` for inline form error feedback.
- Use `useFormStatus` to show loading state on submit buttons.
- Do not call API routes from forms — prefer server actions.

```tsx
// Server action form pattern
import { createInvoice } from '@/app/lib/actions';

export default function CreateInvoiceForm() {
  return (
    <form action={createInvoice}>
      {/* fields */}
      <SubmitButton />
    </form>
  );
}
```

## File structure for pages

```
app/dashboard/<feature>/
  page.tsx       → Server component, fetches data, composes layout
  [id]/
    page.tsx     → Detail page
    edit/
      page.tsx   → Edit form page
  create/
    page.tsx     → Create form page
  error.tsx      → Error boundary
  loading.tsx    → Skeleton/suspense fallback
```

## Styling

- **Tailwind CSS** only — no inline `style` unless unavoidable.
- Use `clsx` for conditional class names.
- Use `app/ui/global.css` for global styles only.
- Do not introduce new CSS frameworks or UI libraries.

## Components to reuse

| Component | Location | Use for |
|-----------|----------|--------|
| `<Button>` | `app/ui/button.tsx` | All CTA buttons |
| `<Search>` | `app/ui/search.tsx` | Search inputs |
| `<Autocomplete>` | `app/ui/autocomplete.tsx` | Searchable dropdowns |
| `<SignOutButton>` | `app/ui/SignOutButton.tsx` | Logout |
| Skeletons | `app/ui/skeletons.tsx` | Loading states |

## Icons

Use **heroicons** (`@heroicons/react`):

```tsx
import { CheckIcon, XMarkIcon } from '@heroicons/react/24/outline';
```

Do not use other icon sets.

## Confirmations and alerts

Use **SweetAlert2** for destructive confirmations and notifications:

```tsx
import Swal from 'sweetalert2';

const result = await Swal.fire({
  title: '¿Estás seguro?',
  text: 'Esta acción no se puede deshacer.',
  icon: 'warning',
  showCancelButton: true,
  confirmButtonText: 'Sí, eliminar',
  cancelButtonText: 'Cancelar',
});
if (result.isConfirmed) { /* proceed */ }
```

Do not use `window.confirm`.

## Charts

Use **Recharts** for all charts (already used in dashboard).

## File uploads

Use **react-dropzone** for file upload areas (PDF invoices).

## Required UI states

Every data-displaying page/component must handle:
- **Loading**: Show skeleton from `app/ui/skeletons.tsx` or a spinner.
- **Empty**: Show a helpful empty state message, not a blank area.
- **Error**: Show an actionable error message — use `error.tsx` boundaries for page-level errors.

## Auth in components

```tsx
// Server component — get session server-side
import { auth } from '@/auth';

const session = await auth();
if (!session) redirect('/login');
const role = session.user.role;
```

Never pass raw session data (passwords, tokens) to client components as props.
