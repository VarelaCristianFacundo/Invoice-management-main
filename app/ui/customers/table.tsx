import { fetchFilteredCustomers } from '@/app/lib/data';
import { roboto } from '@/app/ui/fonts';
import Search from '@/app/ui/search';
import { DocumentTextIcon } from '@heroicons/react/24/outline';
import Link from 'next/link';
import { CreateCustomer, DeleteCustomer, UpdateCustomer } from './buttons';
import { ImportCustomersButton } from './import-button';
import CustomerAvatar from './customer-avatar';

export default async function CustomersTable({
  query,
  currentPage,
  userRole,
}: {
  query: string;
  currentPage: number;
  userRole: string;
}) {
  const customers = await fetchFilteredCustomers(query, currentPage);
  const isSuperUser = userRole === 'admin' || userRole === 'usuario';
  return (
    <div className="w-full">
      <h1 className={`${roboto.className} mb-8 text-xl md:text-2xl`}>
        Proveedores
      </h1>
      <div className="mt-4 flex items-center justify-between gap-2 md:mt-8">
        <Search placeholder="Buscar proveedores..." />
        <div className="flex items-center gap-2">
          <ImportCustomersButton />
          <CreateCustomer />
        </div>
      </div>
      <div className="mt-6 flow-root">
        <div className="overflow-x-auto">
          <div className="inline-block min-w-full align-middle">
            <div className="overflow-hidden rounded-md bg-gray-50 p-2 md:pt-0">
              <div className="md:hidden">
                {customers?.map((customer) => (
                  <div
                    key={customer.id}
                    className="mb-2 w-full rounded-md bg-white p-4"
                  >
                    <div className="flex items-center justify-between border-b pb-4">
                      <div>
                        <div className="mb-2 flex items-center">
                          <div className="flex items-center gap-3">
                            <CustomerAvatar
                              name={customer.name}
                              imageUrl={customer.image_url}
                              size={28}
                              priority
                            />
                            <p>{customer.name}</p>
                          </div>
                        </div>
                        <p className="text-sm text-gray-500">
                          {customer.email}
                        </p>
                      </div>
                    </div>
                    <div className="flex w-full items-center justify-between border-b py-5">
                      <div className="flex w-1/2 flex-col">
                        <p className="text-xs">Pendiente</p>
                        <p className="font-medium">{customer.total_pending}</p>
                      </div>
                      <div className="flex w-1/2 flex-col">
                        <p className="text-xs">Pagado</p>
                        <p className="font-medium">{customer.total_paid}</p>
                      </div>
                    </div>
                    <div className="pt-4 text-sm flex justify-between items-center">
                      <p>{customer.total_invoices} facturas</p>
                      <div className="flex gap-2">
                        <UpdateCustomer customer_id={customer.id} />
                        {isSuperUser && (
                          <DeleteCustomer customer_id={customer.id} />
                        )}
                        <Link
                          href={`/dashboard/customers/${customer.id}/invoices`}
                          className="rounded-md border p-2 hover:bg-gray-100"
                        >
                          <DocumentTextIcon className="w-5" />
                        </Link>
                      </div>
                    </div>
                  </div>
                ))}
              </div>
              <table className="hidden min-w-full rounded-md text-gray-900 md:table">
                <thead className="rounded-md bg-gray-50 text-left text-sm font-normal">
                  <tr>
                    <th scope="col" className="px-2 py-5 font-medium sm:pl-6">
                      Nombre
                    </th>
                    <th scope="col" className="px-2 py-5 font-medium">
                      Correo
                    </th>
                    <th scope="col" className="px-0 py-5 font-medium">
                      Total de facturas
                    </th>
                    <th scope="col" className="px-3 py-5 font-medium">
                      Total de pendientes
                    </th>
                    <th scope="col" className="px-4 py-5 font-medium">
                      Total Abonadas
                    </th>
                  </tr>
                </thead>

                <tbody className="divide-y divide-gray-200 text-gray-900">
                  {customers.map((customer) => (
                    <tr key={customer.id} className="group">
                      <td className="whitespace-nowrap bg-white py-5 pl-4 pr-3 text-sm text-black group-first-of-type:rounded-md group-last-of-type:rounded-md sm:pl-6">
                        <div className="flex items-center gap-3">
                          <CustomerAvatar
                            name={customer.name}
                            imageUrl={customer.image_url}
                            size={28}
                          />
                          <p>{customer.name}</p>
                        </div>
                      </td>
                      <td className="whitespace-nowrap bg-white px-2   py-5 text-sm">
                        {customer.email}
                      </td>
                      <td className="whitespace-nowrap bg-white px-4 py-5 text-sm">
                        {customer.total_invoices}
                      </td>
                      <td className="whitespace-nowrap bg-white px-4 py-5 text-sm">
                        {customer.total_pending}
                      </td>
                      <td className="whitespace-nowrap bg-white px-4 py-5 text-sm">
                        {customer.total_paid}
                      </td>
                      <td className="whitespace-nowrap bg-white  py-5 text-sm group-first-of-type:rounded-md group-last-of-type:rounded-md flex justify-evenly">
                        <div className="flex justify-end gap-2">
                          <UpdateCustomer customer_id={customer.id} />
                          {isSuperUser && (
                            <DeleteCustomer customer_id={customer.id} />
                          )}
                        </div>
                        <Link
                          href={`/dashboard/customers/${customer.id}/invoices`}
                          className="rounded-md border p-2 hover:bg-gray-100"
                        >
                          <DocumentTextIcon className="w-5" />
                        </Link>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
