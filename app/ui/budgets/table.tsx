// budgets/table.tsx
import { fetchFilteredBudgets } from '@/app/lib/data';
import { formatCurrency, formatDateToLocal } from '@/app/lib/utils';
import { DeleteBudget, RejectBudget, UpdateBudget } from '@/app/ui/budgets/buttons';
import BudgetStatus from '@/app/ui/budgets/status';
import Image from 'next/image';

export default async function BudgetsTable({
  query,
  currentPage,
}: {
  query: string;
  currentPage: number;
}) {
  const budgets = await fetchFilteredBudgets(query, currentPage);
  console.log(budgets);
  return (
    <div className="mt-6 flow-root">
      <div className="inline-block min-w-full align-middle">
        <div className="rounded-lg bg-gray-50 p-2 md:pt-0">

          {/* Responsive Cards for Small Screens */}
          <div className="md:hidden">
            {budgets?.map((budget) => (
              <div
                key={budget.id}
                className="mb-2 w-full rounded-md bg-white p-4"
              >
                <div className="flex items-center justify-between border-b pb-4">
                  <div>
                    <div className="mb-2 flex items-center">
                      <Image
                        src={budget.provider_image}
                        className="mr-2 rounded-full"
                        width={28}
                        height={28}
                        alt={`${budget.provider_name}'s profile picture`}
                      />
                      <p>{budget.provider_name}</p>
                    </div>
                    <p className="text-sm text-gray-500">{budget.program}</p>
                  </div>
                  <BudgetStatus status={budget.status} />
                </div>
                <div className="flex w-full items-center justify-between pt-4">
                  <div>
                    <p className="text-xl font-medium">
                      {formatCurrency(budget.amount)}
                    </p>
                    <p>{formatDateToLocal(budget.date)}</p>
                  </div>
                  <div className="flex justify-end gap-2">
                    {budget.file_url && (
                      <a
                        href={budget.file_url}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="text-blue-600 hover:underline"
                      >
                        Ver Archivo Adjunto
                      </a>
                    )}
                  </div>
                  <div className="flex justify-end gap-2">
                    <RejectBudget id={budget.id} />
                    <UpdateBudget id={budget.id} />
                    <DeleteBudget id={budget.id} />
                  </div>
                </div>
              </div>
            ))}
          </div>

          {/* Table for Medium and Larger Screens */}
          <table className="hidden min-w-full text-gray-900 md:table">
            <thead className="rounded-lg text-left text-sm font-normal">
              <tr>
                <th scope="col" className="px-4 py-5 font-medium sm:pl-6">
                  Proveedor
                </th>
                <th scope="col" className="px-3 py-5 font-medium">
                  Programa
                </th>
                <th scope="col" className="px-3 py-5 font-medium">
                  Proyecto
                </th>
                <th scope="col" className="px-3 py-5 font-medium">
                  Área
                </th>
                <th scope="col" className="px-3 py-5 font-medium">
                  Concepto
                </th>
                <th scope="col" className="px-3 py-5 font-medium">
                  Monto
                </th>
                <th scope="col" className="px-3 py-5 font-medium">
                  Fecha
                </th>
                <th scope="col" className="px-3 py-5 font-medium">
                  Estado
                </th>
                {/* Nueva columna para el archivo */}
                <th scope="col" className="px-3 py-5 font-medium">
                  Archivo
                </th>
                <th scope="col" className="relative py-3 pl-6 pr-3">
                  <span className="sr-only">Edit</span>
                </th>
              </tr>
            </thead>
            <tbody className="bg-white">
              {budgets?.map((budget) => (
                <tr
                  key={budget.id}
                  className="w-full border-b py-3 text-sm last-of-type:border-none [&:first-child>td:first-child]:rounded-tl-lg [&:first-child>td:last-child]:rounded-tr-lg [&:last-child>td:first-child]:rounded-bl-lg [&:last-child>td:last-child]:rounded-br-lg"
                >
                  <td className="whitespace-nowrap py-3 pl-6 pr-3">
                    <div className="flex items-center gap-3">
                      <Image
                        src={budget.provider_image}
                        className="rounded-full"
                        width={28}
                        height={28}
                        alt={`${budget.provider_name}'s profile picture`}
                      />
                      <p>{budget.provider_name}</p>
                    </div>
                  </td>
                  <td className="whitespace-nowrap px-3 py-3">
                    {budget.program}
                  </td>
                  <td className="whitespace-nowrap px-3 py-3">
                    {budget.project}
                  </td>
                  <td className="whitespace-nowrap px-3 py-3">
                    {budget.area_name || 'N/A'}
                  </td>
                  <td className="whitespace-nowrap px-3 py-3">
                    {budget.concept}
                  </td>
                  <td className="whitespace-nowrap px-3 py-3">
                    {formatCurrency(budget.amount)}
                  </td>
                  <td className="whitespace-nowrap px-3 py-3">
                    {formatDateToLocal(budget.date)}
                  </td>
                  <td className="whitespace-nowrap px-3 py-3">
                    <BudgetStatus status={budget.status} />
                  </td>
                  {/* Nueva celda para el enlace del archivo */}
                  <td className="whitespace-nowrap px-3 py-3">
                    {budget.file_url ? (
                      <a
                        href={budget.file_url}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="text-blue-600 hover:underline"
                      >
                        Ver Archivo
                      </a>
                    ) : (
                      'N/A'
                    )}
                  </td>
                  <td className="whitespace-nowrap py-3 pl-6 pr-3">
                    <div className="flex justify-end gap-3">
                      <RejectBudget id={budget.id} />
                      <UpdateBudget id={budget.id} />
                      <DeleteBudget id={budget.id} />
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}
