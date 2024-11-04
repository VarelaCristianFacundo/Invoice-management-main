import { fetchFilteredBudgets } from '@/app/lib/data';
import { DeleteBudget, UpdateBudget } from '@/app/ui/budgets/buttons';

export default async function BudgetsTable({ query, currentPage }: { query: string; currentPage: number; }) {
    const budgets = await fetchFilteredBudgets(query, currentPage);

    return (
        <div className="mt-6 flow-root">
            <div className="inline-block min-w-full align-middle">
                <div className="rounded-lg bg-gray-50 p-2 md:pt-0">
                    <table className="min-w-full text-gray-900">
                        <thead>
                            <tr>
                                <th className='text-start'>Año</th>
                                <th className='text-start'>Programa</th>
                                <th className='text-start'>Proyecto</th>
                                <th className='text-start'>Proveedor</th>
                                <th className='text-start'>Concepto</th>
                                <th className='text-start'>Monto</th>
                                <th className='text-start'>Fecha</th>
                                <th className='text-start'>Estado</th>
                                <th className='text-start'>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            {budgets.map((budget) => (
                                <tr key={budget.id}>
                                    <td>{budget.year}</td>
                                    <td>{budget.program}</td>
                                    <td>{budget.project}</td>
                                    <td>{budget.customer_id}</td> {/* Puedes reemplazar con el nombre del proveedor si está disponible */}
                                    <td>{budget.concept}</td>
                                    <td>${(budget.amount / 100).toFixed(2)}</td>
                                    <td>{new Date(budget.date).toLocaleDateString()}</td>
                                    <td>{budget.status}</td>
                                    <td className='flex'>
                                        <UpdateBudget id={budget.id} /> {/* Botón de edición */}
                                        <DeleteBudget id={budget.id} /> {/* Botón de eliminación */}
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