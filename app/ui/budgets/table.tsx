import { fetchFilteredBudgets } from '@/app/lib/data';
import { formatCurrency, formatDateToLocal } from '@/app/lib/utils';
import { DeleteBudget, UpdateBudget } from '@/app/ui/budgets/buttons';
import BudgetStatus from '@/app/ui/budgets/status';

export default async function BudgetsTable({ query, currentPage }: { query: string; currentPage: number; }) {
    const budgets = await fetchFilteredBudgets(query, currentPage);

    return (
        <div className="mt-6 flow-root">
            <div className="inline-block min-w-full align-middle">
                <div className="rounded-lg bg-gray-50 p-2 md:pt-0">
                    <table className="min-w-full text-gray-900">
                        <thead>
                            <tr>
                                <th>Customer</th>
                                <th>Email</th>
                                <th>Amount</th>
                                <th>Date</th>
                                <th>Status</th>
                                <th className="sr-only">Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                            {budgets?.map((budget) => (
                                <tr key={budget.id} className="border-b">
                                    <td>{budget.customerName}</td>
                                    <td>{budget.email}</td>
                                    <td>{formatCurrency(budget.amount)}</td>
                                    <td>{formatDateToLocal(budget.date)}</td>
                                    <td><BudgetStatus status={budget.status} /></td>
                                    <td className="text-right">
                                        <UpdateBudget id={budget.id} />
                                        <DeleteBudget id={budget.id} />
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
