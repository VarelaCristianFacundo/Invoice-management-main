import { fetchAreas, fetchBudgetById, fetchCustomers } from '@/app/lib/data';
import Breadcrumbs from '@/app/ui/budgets/breadcrumbs';
import Form from '@/app/ui/budgets/edit-form';
import { authOptions } from '@/authOptions';
import { getServerSession } from 'next-auth/next';
import { notFound, redirect } from 'next/navigation';

export const dynamic = 'force-dynamic';

export default async function Page(props: { params: Promise<{ id: string; }>; }) {
  const params = await props.params;
  const session = await getServerSession(authOptions);
  if (!session || !session.user) {
    redirect('/login');
  }

  const userRole = session.user.role || 'usuario';
  const isAreaUser =
    userRole?.startsWith('usuario_') &&
    userRole !== 'usuario' &&
    userRole !== 'usuario_presupuestos';
  const userAreaId = isAreaUser ? session.user.area_id : null;

  const [budget, customers, allAreas] = await Promise.all([
    fetchBudgetById(params.id),
    fetchCustomers(),
    fetchAreas(),
  ]);

  if (!budget) {
    notFound();
  }

  const areas =
    isAreaUser && userAreaId
      ? allAreas.filter((area) => area.id === String(userAreaId))
      : allAreas;

  return (
    <main>
      <Breadcrumbs breadcrumbs={[{ label: 'Proyectos', href: '/dashboard/budget' }, { label: 'Editar Proyecto', href: `/dashboard/budget/${params.id}/edit`, active: true }]} />
      <Form budget={budget} customers={customers} areas={areas} />
    </main>
  );
}
