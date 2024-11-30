'use client';

import {
  BanknotesIcon,
  CurrencyDollarIcon,
  DocumentDuplicateIcon,
  HomeIcon,
  UserGroupIcon,
  UserIcon,
  XMarkIcon,
} from '@heroicons/react/24/outline';
import { useSession } from 'next-auth/react';
import Link from 'next/link';
import { usePathname } from 'next/navigation';

const links = [
  { name: 'Home', href: '/dashboard', icon: HomeIcon, roles: ['admin', 'usuario', 'tesorero', 'usuario_presupuestos'] },
  {
    name: 'Presupuestos',
    href: '/dashboard/budgets',
    icon: CurrencyDollarIcon,
    roles: ['admin', 'usuario_presupuestos'],
  },
  {
    name: 'Facturas',
    href: '/dashboard/invoices',
    icon: DocumentDuplicateIcon,
    roles: ['admin', 'usuario', 'tesorero'],
  },
  {
    name: 'Fondos',
    href: '/dashboard/allocations',
    icon: BanknotesIcon,
    roles: ['admin', 'tesorero'],
  },
  {
    name: 'Proveedores',
    href: '/dashboard/customers',
    icon: UserGroupIcon,
    roles: ['admin', 'tesorero'],
  },
  {
    name: 'Presupuestos Rechazados',
    href: '/dashboard/budgets/rejected',
    icon: XMarkIcon,
    roles: ['admin', 'usuario_presupuestos'],
  },
  {
    name: 'Perfil',
    href: '/dashboard/profile',
    icon: UserIcon,
    roles: ['admin', 'usuario', 'tesorero', 'usuario_presupuestos'],
  },
];

export default function NavLinks() {
  const pathname = usePathname();
  const { data: session } = useSession();

  if (!session) {
    return null; // o muestra enlaces públicos
  }

  const userRole = session.user.role;
  console.log(userRole);
  return (
    <>
      {links.map((link) => {
        const LinkIcon = link.icon;

        // Verifica si el rol del usuario tiene acceso al enlace
        if (!link.roles.includes(userRole || '')) {
          return null;
        }

        return (
          <Link
            key={link.name}
            href={link.href}
            className={`flex h-[48px] grow items-center justify-center gap-2 rounded-md bg-gray-50 p-3 text-sm font-medium hover:bg-sky-100 hover:text-gray-800 md:flex-none md:justify-start md:p-2 md:px-3 ${pathname === link.href ? 'bg-sky-100 text-gray-800' : ''
              }`}
          >
            <LinkIcon className="w-6" />
            <p className={`hidden md:block`}>{link.name}</p>
          </Link>
        );
      })}
    </>
  );
}
