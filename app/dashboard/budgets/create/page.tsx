import { fetchCustomers } from '@/app/lib/data';
import Breadcrumbs from '@/app/ui/budgets/breadcrumbs';
import Form from '@/app/ui/budgets/create-form';

export default async function Page() {
  const customers = await fetchCustomers();

  return (
    <main>
      <Breadcrumbs breadcrumbs={[{ label: 'Budgets', href: '/dashboard/budget' }, { label: 'Create Budget', href: '/dashboard/budgets/create', active: true }]} />
      <Form customers={customers} />
    </main>
  );
}
