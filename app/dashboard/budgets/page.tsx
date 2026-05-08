import { fetchBudgetsPages } from '@/app/lib/data'; // Importar la función
import { CreateBudget } from '@/app/ui/budgets/buttons';
import Pagination from '@/app/ui/budgets/pagination';
import Table from '@/app/ui/budgets/table';
import Search from '@/app/ui/search';
import { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'Budgets',
};

export default async function Page(props: { searchParams: Promise<{ query?: string; page?: string }> }) {
  const searchParams = await props.searchParams;
  const query = searchParams?.query || '';
  const currentPage = Number(searchParams?.page) || 1;
  const totalPages = await fetchBudgetsPages(query); // Ahora la función está definida

  return (
    <div>
      <h1>Proyectos</h1>
      <div className="mt-4 flex items-center justify-between gap-2 md:mt-8">
        <Search placeholder="Buscar proyectos..." />
        <CreateBudget />
      </div>
      <Table query={query} currentPage={currentPage} />
      <Pagination totalPages={totalPages} />
    </div>
  );
}
