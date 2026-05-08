import { fetchCardData } from '@/app/lib/data'
import { roboto } from '@/app/ui/fonts'
import {
  BanknotesIcon,
  ClockIcon,
  InboxIcon,
  UserGroupIcon,
} from '@heroicons/react/24/outline'
import Link from 'next/link'

const iconMap = {
  collected: BanknotesIcon,   // Abonado
  approved: BanknotesIcon,    // Aprobado
  customers: UserGroupIcon,
  pending: ClockIcon,
  invoices: InboxIcon,
}

export default async function CardWrapper({
  searchParams,
  areaId,
}: {
  searchParams?: { status?: string; year?: string; company?: string };
  areaId?: string | null;
}) {
  const {
    numberOfCustomers,
    numberOfInvoices,
    countPaid,
    sumPaid,
    countApproved,
    sumApproved,
    countPending,
    sumPending,
  } = await fetchCardData({ ...searchParams, areaId })

  // Actualizar los links para que mantengan los otros filtros si es necesario
  const getFilterParams = (status?: string) => {
    const params = new URLSearchParams()
    if (status) params.set('status', status)
    if (searchParams?.year && searchParams.year !== 'all') params.set('year', searchParams.year)
    if (searchParams?.company && searchParams.company !== 'all') params.set('company', searchParams.company)
    const str = params.toString()
    return str ? `?${str}` : ''
  }

  const routeMap: Record<keyof typeof iconMap, string> = {
    collected: `/dashboard/invoices${getFilterParams('pagado')}`,
    approved: `/dashboard/invoices${getFilterParams('aprobado')}`,
    pending: `/dashboard/invoices${getFilterParams('presentado')}`,
    invoices: `/dashboard/invoices${getFilterParams()}`,
    customers: '/dashboard/customers',
  }

  const cards = [
    // [ título, count (número), amount (string de dígitos), tipo ]
    ['Abonado', countPaid, sumPaid.toString(), 'collected'] as const,
    ['Aprobado', countApproved, sumApproved.toString(), 'approved'] as const,
    ['Pendiente de aprobación', countPending, sumPending.toString(), 'pending'] as const,
    // [
    //   'Total de facturas',
    //   numberOfInvoices,
    //   numberOfInvoices.toString(),
    //   'invoices',
    // ] as const,
    // [
    //   'Total de clientes',
    //   numberOfCustomers,
    //   numberOfCustomers.toString(),
    //   'customers',
    // ] as const,
  ]

  return (
    <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
      {cards.map(([title, count, amount, type]) => (
        <Link
          key={type}
          href={routeMap[type]}
          className="block hover:shadow-md transition-shadow"
        >
          <Card title={title} count={count} amount={amount} type={type} />
        </Link>
      ))}
    </div>
  )
}

export function Card({
  title,
  count,
  amount,
  type,
}: {
  title: string
  count: number
  amount: string
  type: keyof typeof iconMap
}) {
  const Icon = iconMap[type]

  // Formatear amount si es solo dígitos
  let displayAmount = amount
  const numeric = parseFloat(amount.replace(/\./g, '').replace(/,/g, '.'))
  if (!isNaN(numeric)) {
    displayAmount = `$ ${numeric.toLocaleString('es-AR', { minimumFractionDigits: 2 })}`
  }

  return (
    <div className="rounded-xl bg-gray-50 p-2 shadow-sm">
      <div className="flex p-4 items-center">
        {Icon && <Icon className="h-5 w-5 text-gray-700" />}
        <h3 className="ml-2 text-sm font-medium">{title}</h3>
      </div>
      <div className="bg-white rounded-xl px-4 py-6 text-center h-full flex flex-col justify-center">
        {/* 1) Cantidad de facturas, formateada con separador de miles */}
        <p className="text-4xl font-bold">
          {count.toLocaleString('es-AR', { minimumFractionDigits: 0 })}
        </p>
        {/* 2) Monto debajo: si corresponde, mostramos displayAmount; si no, reservamos espacio vacío */}
        <p className={`mt-1 ${roboto.className} text-lg text-gray-600`}>
          {type !== 'invoices' && type !== 'customers' ? displayAmount : '\u00A0'}
        </p>
      </div>
    </div>
  )
}
