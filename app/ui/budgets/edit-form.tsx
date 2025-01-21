'use client';

import { updateBudget } from '@/app/lib/actions';
import { BudgetForm, CustomerField } from '@/app/lib/definitions';
import { Button } from '@/app/ui/button';
import { CheckIcon, ClockIcon, CurrencyDollarIcon, UserCircleIcon } from '@heroicons/react/24/outline';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import Swal from 'sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';

export default function EditBudgetForm({ budget, customers }: { budget: BudgetForm; customers: CustomerField[] }) {
  const router = useRouter();

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    const formData = new FormData(event.currentTarget);

    try {
      const result = await Swal.fire({
        title: 'Confirmar Actualización',
        text: '¿Estás segura de que quieres actualizar este Proyecto?',
        icon: 'question',
        showCancelButton: true,
        confirmButtonText: 'Sí, actualizarlo',
        cancelButtonText: 'Cancelar',
      });

      if (!result.isConfirmed) return;

      const response = await updateBudget(budget.id, formData, '');
      if (!response.success) throw new Error(response.message);

      await Swal.fire('Updated!', 'The budget was updated successfully.', 'success');

      // Redirigir y actualizar la tabla
      router.push('/dashboard/budgets');
      router.refresh();
    } catch (error) {
      console.error(error);
      await Swal.fire('Error!', 'Failed to update the budget.', 'error');
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <div className="rounded-md bg-gray-50 p-4 md:p-6">
        {/* Year */}
        <div className="mb-4">
          <input
            id="year"
            name="year"
            type="number"
            defaultValue={budget.year}
            placeholder="Ingrese un Año"
          />
          <input
            id="project_name"
            name="project_name"
            type="text"
            defaultValue={budget.project_name}
            placeholder="Ingrese un Proyecto"
          />
          <input
            id="allocated_amount"
            name="allocated_amount"
            type="number"
            defaultValue={budget.allocated_amount}
            placeholder="Ingrese un monto"
          />

          <UserCircleIcon className="pointer-events-none absolute left-3 top-1/2 h-[18px] w-[18px] -translate-y-1/2 text-gray-500" />
        </div>
      </div>

      {/* Amount */}
      <div className="mb-4">
        <label htmlFor="amount" className="mb-2 block text-sm font-medium">
          Cantidad
        </label>
        <div className="relative mt-2 rounded-md">
          <input
            id="amount"
            name="amount"
            type="number"
            step="0.01"
            defaultValue={budget.amount}
            placeholder="Ingrese una Cantidad"
            className="peer block w-full rounded-md border border-gray-200 py-2 pl-10 text-sm outline-2 placeholder:text-gray-500"
          />
          <CurrencyDollarIcon className="pointer-events-none absolute left-3 top-1/2 h-[18px] w-[18px] -translate-y-1/2 text-gray-500 peer-focus:text-gray-900" />
        </div>
      </div>

      {/* Budget Status */}
      <fieldset>
        <legend className="mb-2 block text-sm font-medium">
          Set the budget status
        </legend>
        <div className="rounded-md border border-gray-200 bg-white px-[14px] py-3">
          <div className="flex gap-4">
            <div className="flex items-center">
              <input
                id="pending"
                name="status"
                type="radio"
                value="pending"
                defaultChecked={budget.status === 'pending'}
                className="h-4 w-4 cursor-pointer border-gray-300 bg-gray-100 text-gray-600 focus:ring-2"
              />
              <label
                htmlFor="pending"
                className="ml-2 flex cursor-pointer items-center gap-1.5 rounded-full bg-gray-100 px-3 py-1.5 text-xs font-medium text-gray-600"
              >
                Pending <ClockIcon className="h-4 w-4" />
              </label>
            </div>
            <div className="flex items-center">
              <input
                id="approved"
                name="status"
                type="radio"
                value="approved"
                defaultChecked={budget.status === 'approved'}
                className="h-4 w-4 cursor-pointer border-gray-300 bg-gray-100 text-gray-600 focus:ring-2"
              />
              <label
                htmlFor="approved"
                className="ml-2 flex cursor-pointer items-center gap-1.5 rounded-full bg-green-500 px-3 py-1.5 text-xs font-medium text-white"
              >
                Approved <CheckIcon className="h-4 w-4" />
              </label>
            </div>
          </div>
        </div>
      </fieldset>

      {/* Buttons */}
      <div className="flex justify-end gap-4 mt-6">
        <Link
          href="/dashboard/budgets"
          className="flex h-10 items-center rounded-lg bg-gray-100 px-4 text-sm font-medium text-gray-600 transition-colors hover:bg-gray-200"
        >
          Cancelar
        </Link>
        <Button type="submit">Editar Proyecto</Button>
      </div>
    </form>
  );
}
