import { fetchFilteredBudgets } from '@/app/lib/data';
import { formatCurrency } from '@/app/lib/utils';
import { DeleteBudget, RejectBudget, UpdateBudget } from '@/app/ui/budgets/buttons';
import BudgetStatus from '@/app/ui/budgets/status';

export default async function BudgetsTable({
  query,
  currentPage,
}: {
  query: string;
  currentPage: number;
}) {
  console.log('Rendering BudgetsTable with query:', query, 'and currentPage:', currentPage);

  try {
    const budgets = await fetchFilteredBudgets(query, currentPage);
    console.log('Budgets fetched:', budgets);

    if (!budgets || budgets.length === 0) {
      console.log('No budgets found.');
    }

    return (
      <div className="mt-6 flow-root">
        <div className="inline-block min-w-full align-middle">
          <div className="rounded-lg bg-gray-50 p-2 md:pt-0">
            {/* Responsive Cards for Small Screens */}
            <div className="md:hidden">
              {budgets?.map((budget) => {
                console.log('Rendering budget card for:', budget);
                return (
                  <div key={budget.id} className="mb-2 w-full rounded-md bg-white p-4">
                    <div className="flex items-center justify-between border-b pb-4">
                      <div>
                        <p className="font-semibold">{budget.project_name}</p>
                        <p className="text-sm text-gray-500">{budget.program}</p>
                        <p className="text-sm text-gray-500">{budget.area_names}</p> {/* Muestra las áreas */}
                      </div>
                      <BudgetStatus status={budget.status} />
                    </div>
                    <div className="flex justify-between mt-4">
                      <p className="font-semibold">Allocated: {formatCurrency(budget.total_allocated_amount)}</p>
                      <p className="font-semibold">Executed: {formatCurrency(budget.total_executed_amount)}</p>
                    </div>
                  </div>
                );
              })}
            </div>

            {/* Table for Medium and Larger Screens */}
            <table className="hidden min-w-full text-gray-900 md:table">
              <thead className="rounded-lg text-left text-sm font-normal">
                <tr>
                  <th scope="col" className="px-4 py-5 font-medium sm:pl-6">Project</th>
                  <th scope="col" className="px-3 py-5 font-medium">Program</th>
                  <th scope="col" className="px-3 py-5 font-medium">Allocated</th>
                  <th scope="col" className="px-3 py-5 font-medium">Executed</th>
                  <th scope="col" className="px-3 py-5 font-medium">Areas</th>
                  <th scope="col" className="relative py-3 pl-6 pr-3">
                    <span className="sr-only">Actions</span>
                  </th>
                </tr>
              </thead>
              <tbody className="bg-white">
                {budgets?.map((budget) => {
                  console.log('Rendering budget row for:', budget);
                  return (
                    <tr key={budget.id}>
                      <td className="px-3 py-3">{budget.project_name || 'N/A'}</td>
                      <td className="px-3 py-3">{budget.program || 'N/A'}</td>
                      <td className="px-3 py-3">{formatCurrency(budget.total_allocated_amount || 0)}</td>
                      <td className="px-3 py-3">{formatCurrency(budget.total_executed_amount || 0)}</td>
                      <td className="px-3 py-3">{budget.area_names || 'N/A'}</td>
                      <td className="py-3 pl-6 pr-3">
                        <div className="flex justify-end gap-3">
                          <RejectBudget id={budget.id} />
                          <UpdateBudget id={budget.id} />
                          <DeleteBudget id={budget.id} />
                        </div>
                      </td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    );
  } catch (error) {
    console.error('Error rendering BudgetsTable:', error);
    return <div>Error loading budgets. Please try again later.</div>;
  }
}
