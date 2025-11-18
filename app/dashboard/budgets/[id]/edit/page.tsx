import { fetchBudgetById, fetchCustomers } from '@/app/lib/data';
import Breadcrumbs from '@/app/ui/budgets/breadcrumbs';
import Form from '@/app/ui/budgets/edit-form';
import { notFound } from 'next/navigation';

export default async function Page({ params }: { params: { id: string; }; }) {
  const [budget, customers] = await Promise.all([fetchBudgetById(params.id), fetchCustomers()]);

  if (!budget) {
    notFound();
  }

  return (
    <main>
      <Breadcrumbs breadcrumbs={[{ label: 'Proyectos', href: '/dashboard/budget' }, { label: 'Editar Proyecto', href: `/dashboard/budget/${params.id}/edit`, active: true }]} />
      <Form budget={budget} customers={customers} />
    </main>
  );
}
