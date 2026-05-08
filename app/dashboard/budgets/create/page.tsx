// 📁app/dashboard/budgets/create/page.tsx
import { fetchAreas, fetchCustomers } from '@/app/lib/data';
import Breadcrumbs from '@/app/ui/budgets/breadcrumbs';
import BudgetForm from '@/app/ui/budgets/create-form';
import { authOptions } from '@/authOptions';
import { getServerSession } from 'next-auth/next';
import { redirect } from 'next/navigation';

export default async function Page() {
  const session = await getServerSession(authOptions);
  if (!session || !session.user) {
    redirect('/login');
  }

  // Determinar si el usuario está limitado a su área
  const userRole = session.user.role || 'usuario';
  const isAreaUser = userRole?.startsWith('usuario_') && 
                      userRole !== 'usuario' && 
                      userRole !== 'usuario_presupuestos';
  const userAreaId = isAreaUser ? session.user.area_id : null;

  const customers = await fetchCustomers();
  let areas = await fetchAreas();

  // Filtrar áreas si el usuario es de un área específica
  if (isAreaUser && userAreaId) {
    areas = areas.filter(area => area.id === String(userAreaId));
  }

  return (
    <main>
      <Breadcrumbs breadcrumbs={[{ label: 'Proyectos', href: '/dashboard/budgets' }, { label: 'Crear Proyecto', href: '/dashboard/budgets/create', active: true }]} />
      <BudgetForm customers={customers} areas={areas} />
    </main>
  );
}
