// 📁app/dashboard/budgets/create/page.tsx
import { sumBudgetAllocationsByAreaYearHalf, fetchCustomers } from '@/app/lib/data';
import Breadcrumbs from '@/app/ui/budgets/breadcrumbs';
import BudgetForm from '@/app/ui/budgets/create-form';

export default async function Page() {
  const customers = await fetchCustomers();
  const areas = await sumBudgetAllocationsByAreaYearHalf();

  return (
    <main>
      <Breadcrumbs breadcrumbs={[{ label: 'Proyectos', href: '/dashboard/budgets' }, { label: 'Crear Proyecto', href: '/dashboard/budgets/create', active: true }]} />
      <BudgetForm customers={customers} areas={areas} />
    </main>
  );
}
