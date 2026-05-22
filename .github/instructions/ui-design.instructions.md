---
applyTo: "app/ui/**,app/dashboard/**/*.tsx"
---

# UI Design Conventions

## Design language

Clean, enterprise SaaS. No excessive decoration. Information-dense but readable.
Reference: think of a modern ERP dashboard — calm neutral base, clear status colors, good typography hierarchy.

## Color usage (Tailwind)

| Purpose | Classes |
|---------|---------|
| Primary action | `bg-blue-600 hover:bg-blue-700 text-white` |
| Destructive action | `bg-red-600 hover:bg-red-700 text-white` |
| Success / approved | `bg-green-100 text-green-800` |
| Warning / pending | `bg-yellow-100 text-yellow-800` |
| Error / rejected | `bg-red-100 text-red-800` |
| Neutral / secondary | `bg-gray-100 text-gray-700` |
| Page background | `bg-gray-50` |
| Card background | `bg-white` with `shadow-sm border border-gray-200` |

## Invoice status badges

Use consistent badge styling everywhere:

```tsx
const STATUS_STYLES = {
  presentado: 'bg-yellow-100 text-yellow-800',
  aprobado:   'bg-blue-100 text-blue-800',
  pagado:     'bg-green-100 text-green-800',
  rechazado:  'bg-red-100 text-red-800',
} as const;

<span className={`inline-flex items-center rounded-full px-2.5 py-0.5 text-xs font-medium ${
  STATUS_STYLES[invoice.status]
}`}>
  {invoice.status}
</span>
```

## Layout patterns

### Page layout
```tsx
<div className="w-full">
  {/* Header row */}
  <div className="flex w-full items-center justify-between">
    <h1 className="text-2xl font-semibold text-gray-900">Facturas</h1>
    <CreateButton />
  </div>

  {/* Filters row */}
  <div className="mt-4 flex items-center gap-2">
    <Search />
    {/* other filters */}
  </div>

  {/* Content */}
  <Suspense fallback={<TableSkeleton />}>
    <Table />
  </Suspense>

  {/* Pagination */}
  <Pagination />
</div>
```

### Card
```tsx
<div className="rounded-xl bg-white p-6 shadow-sm border border-gray-200">
  {/* content */}
</div>
```

### Form layout
```tsx
<form className="space-y-4">
  <div>
    <label className="mb-2 block text-sm font-medium text-gray-700">Campo</label>
    <input className="block w-full rounded-md border border-gray-300 px-3 py-2 text-sm
                     placeholder-gray-400 focus:border-blue-500 focus:outline-none
                     focus:ring-1 focus:ring-blue-500" />
    {/* error message */}
    <p className="mt-1 text-xs text-red-600">Mensaje de error</p>
  </div>
</form>
```

## Typography

- Page titles: `text-2xl font-semibold text-gray-900`
- Section headings: `text-lg font-medium text-gray-800`
- Labels: `text-sm font-medium text-gray-700`
- Body / table text: `text-sm text-gray-600`
- Muted / helper text: `text-xs text-gray-500`

## Tables

- Wrap in `overflow-x-auto` for mobile.
- `<th>`: `px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider bg-gray-50`
- `<td>`: `px-4 py-3 text-sm text-gray-700`
- Hover row: `hover:bg-gray-50`
- Actions column: right-aligned, use icon buttons with tooltips.

## Spacing

- Use `gap-4` between form fields.
- Use `mt-6` between page sections.
- Use `p-6` for cards.
- Be consistent — don't mix `p-4` and `p-6` on the same level.

## Responsive

- All tables need `overflow-x-auto` wrappers.
- Use `md:grid-cols-2` patterns for form columns on wider screens.
- Sidebar is fixed — content uses full available width.

## Anti-patterns to avoid

- Do not use `border-2` for regular containers — prefer `border border-gray-200`.
- Do not use `font-bold` for body text — use `font-medium` or `font-semibold` max.
- Do not center-align table data — always left-align except numeric columns.
- Do not stack buttons vertically when horizontal works — prefer `flex gap-2`.
- Do not use `<br>` for spacing — use Tailwind margin/padding.
