import { fetchCustomers } from '@/app/lib/data';
import Breadcrumbs from '@/app/ui/invoices/breadcrumbs';
import Form from '@/app/ui/invoices/create-form';
import { Metadata } from 'next';
import { getServerSession } from 'next-auth/next';
import { authOptions } from '@/authOptions';

export const metadata: Metadata = {
  title: 'Crear Factura',
};
export default async function Page() {
  const customers = await fetchCustomers();
  const session = await getServerSession(authOptions);

  return (
    <main>
      <Breadcrumbs
        breadcrumbs={[
          { label: 'Facturas', href: '/dashboard/invoices' },
          {
            label: 'Crear Factura',
            href: '/dashboard/invoices/create',
            active: true,
          },
        ]}
      />
      <Form 
        customers={customers} 
        userRole={session?.user?.role || 'usuario'}
        userAreaId={session?.user?.area_id || null}
      />
    </main>
  );
}