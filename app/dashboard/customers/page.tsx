import { fetchCustomersPages } from '@/app/lib/data';
import CustomersTable from '@/app/ui/customers/table';
import Pagination from '@/app/ui/invoices/pagination';
import { InvoicesTableSkeleton } from '@/app/ui/skeletons';
import { Metadata } from 'next';
import { Suspense } from 'react';
import { getServerSession } from 'next-auth/next';
import { authOptions } from '@/authOptions';

export const metadata: Metadata = {
  title: 'Proveedores',
};
export default async function Page(
  props: {
    searchParams?: Promise<{
      query?: string;
      page?: string;
    }>;
  }
) {
  const searchParams = await props.searchParams;
  const query = searchParams?.query || '';
  const currentPage = Number(searchParams?.page) || 1;
  // const data = await fetchCustomersData()
  const totalPages = await fetchCustomersPages(query);
  const session = await getServerSession(authOptions);

  return (
    <div className="w-full">
      <Suspense key={query + currentPage} fallback={<InvoicesTableSkeleton />}>
        <CustomersTable 
          query={query} 
          currentPage={currentPage} 
          userRole={session?.user?.role || 'usuario'}
        />
      </Suspense>
      <div className="mt-5 flex w-full justify-center">
        <Pagination totalPages={totalPages} />
      </div>
    </div>
  );
}