import { fetchBudgetsPages } from '@/app/lib/data'; // Importar la función
import { CreateBudget } from '@/app/ui/budgets/buttons';
import Pagination from '@/app/ui/budgets/pagination';
import Table from '@/app/ui/budgets/table';
import Search from '@/app/ui/search';
import { authOptions } from '@/authOptions';
import { Metadata } from 'next';
import { getServerSession } from 'next-auth/next';
import { redirect } from 'next/navigation';

export const metadata: Metadata = {
  title: 'Budgets',
};

export default async function Page(props: { searchParams: Promise<{ query?: string; page?: string }> }) {
  const searchParams = await props.searchParams;
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

  const query = searchParams?.query || '';
  const currentPage = Number(searchParams?.page) || 1;
  const totalPages = await fetchBudgetsPages(query, userAreaId);




  return (
    <div>
      <h1>Proyectos</h1>
      <div className="mt-4 flex items-center justify-between gap-2 md:mt-8">
        <Search placeholder="Buscar proyectos..." />
        <CreateBudget />
      </div>
      <Table query={query} currentPage={currentPage} userAreaId={userAreaId} />
      <Pagination totalPages={totalPages} />
    </div>
  );
}
