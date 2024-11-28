// 📁app/dashboard/budgets/create/page.tsx
import { fetchAreas, fetchCustomers } from '@/app/lib/data';
import Breadcrumbs from '@/app/ui/budgets/breadcrumbs';
import BudgetForm from '@/app/ui/budgets/create-form';

export default async function Page() {
  const customers = await fetchCustomers();
  const areas = await fetchAreas();

  return (
    <main>
      <Breadcrumbs breadcrumbs={[{ label: 'Budgets', href: '/dashboard/budgets' }, { label: 'Create Budget', href: '/dashboard/budgets/create', active: true }]} />
      <BudgetForm customers={customers} areas={areas} />
    </main>
  );
}
