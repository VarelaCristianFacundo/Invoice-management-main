// app/ui/dashboard/cards.tsx

import { fetchCardData } from '@/app/lib/data'
import { lusitana } from '@/app/ui/fonts'
import {
  BanknotesIcon,
  ClockIcon,
  InboxIcon,
  UserGroupIcon,
} from '@heroicons/react/24/outline'
import Link from 'next/link'

const iconMap = {
  collected: BanknotesIcon,
  customers: UserGroupIcon,
  pending: ClockIcon,
  invoices: InboxIcon,
}

// 1️⃣ Mapa de rutas + query
const routeMap: Record<keyof typeof iconMap, string> = {
  collected: '/dashboard/invoices?query=Pagado',
  pending: '/dashboard/invoices?query=Presentado',
  invoices: '/dashboard/invoices',
  customers: '/dashboard/customers',
}

export default async function CardWrapper() {
  const {
    numberOfCustomers,
    numberOfInvoices,
    totalPaidInvoices,
    totalPendingInvoices,
  } = await fetchCardData()

  // 2️⃣ Array con tus datos y tipos
  const cards = [
    ['Abonado', totalPaidInvoices, 'collected'] as const,
    ['Pendiente', totalPendingInvoices, 'pending'] as const,
    ['Total de facturas', numberOfInvoices, 'invoices'] as const,
    ['Total de clientes', numberOfCustomers, 'customers'] as const,
  ]

  return (
    <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
      {cards.map(([title, value, type]) => (
        // 3️⃣ Envolvés en Link usando routeMap[type]
        <Link
          key={type}
          href={routeMap[type]}
          className="block hover:shadow-md transition-shadow"
        >
          <Card title={title} value={value} type={type} />
        </Link>
      ))}
    </div>
  )
}


export function Card({
  title,
  value,
  type,
}: {
  title: string;
  value: number | string;
  type: keyof typeof iconMap;
}) {
  const Icon = iconMap[type];

  return (
    <div className="rounded-xl bg-gray-50 p-2 shadow-sm">
      <div className="flex p-4 items-center">
        {Icon && <Icon className="h-5 w-5 text-gray-700" />}
        <h3 className="ml-2 text-sm font-medium">{title}</h3>
      </div>
      <p
        className={`${lusitana.className} truncate rounded-xl bg-white px-4 py-8 text-center text-2xl`}
      >
        {value}
      </p>
    </div>
  );
}
