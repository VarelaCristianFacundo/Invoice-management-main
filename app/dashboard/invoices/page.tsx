import { fetchInvoicesPages } from '@/app/lib/data';
import { roboto } from '@/app/ui/fonts';
import { CreateInvoice } from '@/app/ui/invoices/buttons';
import ExportInvoicesModal from '@/app/ui/invoices/export-invoices-modal';
import Pagination from '@/app/ui/invoices/pagination';
import Table from '@/app/ui/invoices/table';
import Search from '@/app/ui/search';
import { InvoicesTableSkeleton } from '@/app/ui/skeletons';
import { authOptions } from '@/authOptions';
import { Metadata } from 'next';
import { getServerSession } from 'next-auth/next';
import { redirect } from 'next/navigation';
import { Suspense } from 'react';

export const metadata: Metadata = {
  title: 'Facturas',
};

export default async function Page({
  searchParams,
}: {
  searchParams?: {
    query?: string;
    page?: string;
  };
}) {
  const query = searchParams?.query || '';
  const currentPage = Number(searchParams?.page) || 1;
  
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
  
  const totalPages = await fetchInvoicesPages(query, userAreaId)
  
  return (
    <div className="w-full">
      <div className="flex w-full items-center justify-between">
        <h1 className={`${roboto.className} text-2xl`}>Facturas</h1>
      </div>
      <div className="mt-4 flex items-center justify-between gap-2 md:mt-8">
        <Search placeholder="Buscando facturas..." />
        <CreateInvoice />
      </div>
      <Suspense key={query + currentPage} fallback={<InvoicesTableSkeleton />}>
        <Table query={query} currentPage={currentPage} userAreaId={userAreaId} />
      </Suspense>
      <div className="mt-5 flex w-full justify-center">
        <Pagination totalPages={totalPages} />
      </div>
      <ExportInvoicesModal />
    </div>
  );
}