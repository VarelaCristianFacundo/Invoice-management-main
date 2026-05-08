import { fetchRejectedBudgets } from '@/app/lib/data';
import { formatCurrency, formatDateToLocal } from '@/app/lib/utils';
import BudgetStatus from '@/app/ui/budgets/status';

export const dynamic = 'force-dynamic';

export default async function RejectedBudgetsPage() {
    const budgets = await fetchRejectedBudgets();

    // Agrupamos los presupuestos por area_name
    const groupedBudgets = budgets.reduce((acc, budget) => {
        const area = budget.area_name || 'N/A';
        if (!acc[area]) {
            acc[area] = [];
        }
        acc[area].push(budget);
        return acc;
    }, {});

    return (
        <div>
            <h1 className="mb-4 text-2xl font-semibold">Presupuestos Rechazados</h1>

            {/* Iteramos sobre cada área */}
            {Object.keys(groupedBudgets).map((area) => (
                <div key={area} className="mb-6">
                    <h2 className="text-xl font-semibold text-gray-800">{area}</h2>
                    <div className="mt-4 grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3">
                        {/* Iteramos sobre los presupuestos en cada área */}
                        {groupedBudgets[area].map((budget: any) => (
                            <div key={budget.id} className="rounded-md bg-white p-4 shadow hover:shadow-lg transition-shadow">
                                {/* <p><strong>Concepto:</strong> {budget.concept}</p>
                                <p><strong>Monto:</strong> {formatCurrency(budget.amount)}</p>
                                <p><strong>Fecha:</strong> {formatDateToLocal(budget.date)}</p>
                                <BudgetStatus status={budget.status} /> */}
                            </div>
                        ))}
                    </div>
                </div>
            ))}
        </div>
    );
}