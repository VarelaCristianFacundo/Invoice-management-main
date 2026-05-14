---
name: ui-modernization
description: Use this skill when improving old, arcaic, inconsistent, or visually weak UI screens in the CAMARCO invoice management system.
---

# UI Modernization Skill

Modernize UI using the existing stack: Tailwind CSS, heroicons, SweetAlert2, Recharts.

## Process

1. Identify the screen purpose and the primary user action.
2. Preserve the current business flow — no behavior changes.
3. Improve layout, spacing, hierarchy, and clarity.
4. Apply consistent Tailwind patterns (see below).
5. Add useful empty/loading/error states if missing.
6. No unnecessary animations.
7. Keep the design enterprise-friendly.

## Standard patterns to apply

### Page header
```tsx
<div className="flex w-full items-center justify-between">
  <h1 className="text-2xl font-semibold text-gray-900">{title}</h1>
  <div className="flex gap-2">{/* action buttons */}</div>
</div>
```

### Filter bar
```tsx
<div className="mt-4 flex flex-col gap-2 md:flex-row md:items-center">
  <Search placeholder="Buscar..." />
  {/* selects, date pickers, etc. */}
</div>
```

### Data table
```tsx
<div className="mt-6 overflow-x-auto rounded-xl border border-gray-200 bg-white shadow-sm">
  <table className="min-w-full divide-y divide-gray-200">
    <thead className="bg-gray-50">
      <tr>
        <th className="px-4 py-3 text-left text-xs font-medium uppercase tracking-wider text-gray-500">
          Campo
        </th>
      </tr>
    </thead>
    <tbody className="divide-y divide-gray-100 bg-white">
      {rows.map(row => (
        <tr key={row.id} className="hover:bg-gray-50">
          <td className="px-4 py-3 text-sm text-gray-700">{row.field}</td>
        </tr>
      ))}
    </tbody>
  </table>
</div>
```

### Status badge (invoice lifecycle)
```tsx
const STATUS_STYLES = {
  presentado: 'bg-yellow-100 text-yellow-800',
  aprobado:   'bg-blue-100 text-blue-800',
  pagado:     'bg-green-100 text-green-800',
  rechazado:  'bg-red-100 text-red-800',
} as const;

<span className={`inline-flex items-center rounded-full px-2.5 py-0.5 text-xs font-medium ${
  STATUS_STYLES[status]
}`}>
  {status}
</span>
```

### Card
```tsx
<div className="rounded-xl border border-gray-200 bg-white p-6 shadow-sm">
  {/* content */}
</div>
```

### Form field
```tsx
<div>
  <label className="mb-1.5 block text-sm font-medium text-gray-700">{label}</label>
  <input
    className="block w-full rounded-md border border-gray-300 px-3 py-2 text-sm
               placeholder-gray-400 focus:border-blue-500 focus:outline-none focus:ring-1
               focus:ring-blue-500 disabled:bg-gray-50 disabled:text-gray-400"
  />
  {error && <p className="mt-1 text-xs text-red-600">{error}</p>}
</div>
```

### Empty state
```tsx
<div className="flex flex-col items-center justify-center py-12 text-center">
  <SomeIcon className="h-12 w-12 text-gray-300" />
  <p className="mt-2 text-sm font-medium text-gray-500">No hay registros</p>
  <p className="text-xs text-gray-400">Crea uno para comenzar.</p>
</div>
```

## Do not

- Replace the full design system without approval.
- Introduce unrelated libraries.
- Change business behavior while improving visuals.
- Mix `p-4` and `p-6` at the same level (pick one consistently per screen).
- Use `border-2` for regular containers.
- Use `font-bold` for body text (use `font-medium` or `font-semibold` max).
