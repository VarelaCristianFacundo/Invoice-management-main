import { fetchCustomers } from '@/app/lib/data';
import Breadcrumbs from '@/app/ui/invoices/breadcrumbs';
import Form from '@/app/ui/invoices/create-form';
import { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'Crear Factura',
};
export default async function Page() {
  const customers = await fetchCustomers();

  return (
    <main>
      <Breadcrumbs
        breadcrumbs={[
          { label: 'Facturas', href: '/Inicio/Facturas' },
          {
            label: 'Crear Factura',
            href: '/Inicio/Facturas/Crear',
            active: true,
          },
        ]}
      />
      <Form customers={customers} />
    </main>
  );
}