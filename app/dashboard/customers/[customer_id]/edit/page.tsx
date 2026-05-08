import { fetchCustomerById } from '@/app/lib/data';
import Form from '@/app/ui/customers/edit-form';
import Breadcrumbs from '@/app/ui/invoices/breadcrumbs';
import { Metadata } from 'next';
import { notFound } from 'next/navigation';

export const metadata: Metadata = {
  title: 'Editar Proveedor',
};

export default async function Page(
  props: {
    params: Promise<{ customer_id: string }>;
  }
) {
  const params = await props.params;
  const customer_id = params.customer_id;
  const customer = await fetchCustomerById(customer_id);

  if (!customer) {
    notFound();
  }

  return (
    <main>
      <Breadcrumbs
        breadcrumbs={[
          { label: 'Proveedores', href: '/dashboard/customers' },
          { label: 'Editar Proveedor', href: `/dashboard/customers/${customer_id}/edit`, active: true },
        ]}
      />
      <Form customer={customer} />
    </main>
  );
}
