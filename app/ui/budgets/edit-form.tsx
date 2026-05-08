'use client';

import { useState } from 'react';
import { updateBudgetProject } from '@/app/lib/actions';
import { BudgetForm, CustomerField } from '@/app/lib/definitions';
import { normalizeMoneyInput, formatMoneyForDisplay, sanitizeMoneyInput } from '@/app/lib/money-utils';
import { Button } from '@/app/ui/button';
import {
  CalendarIcon,
  CheckIcon,
  ClockIcon,
  CurrencyDollarIcon,
  FolderIcon,
} from '@heroicons/react/24/outline';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import Swal from 'sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';

export default function EditBudgetForm({
  budget,
  customers, // Not used currently, but kept for compatibility with the page props.
}: {
  budget: BudgetForm;
  customers: CustomerField[];
}) {
  const router = useRouter();

  const [displayAmount, setDisplayAmount] = useState<string>(
    formatMoneyForDisplay(budget.allocated_amount)
  );
  const [allocatedAmount, setAllocatedAmount] = useState<number>(
    budget.allocated_amount ?? 0
  );

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();

    // Build FormData but normalize monetary fields before sending.
    const formData = new FormData(event.currentTarget);
    formData.set('allocated_amount', normalizeMoneyInput(displayAmount));

    // IMPORTANT: "paid/executed amount" must not be modified by the form.
    // We intentionally do NOT send "amount" updates (input is disabled anyway).
    // If the backend still tries to update it, we need to fix updateBudgetProject accordingly.

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

      const response = await updateBudgetProject(budget.id, formData, '');
      if (!response.success) throw new Error(response.message);

      await Swal.fire('Actualizado!', 'El proyecto fue actualizado con éxito.', 'success');

      router.push('/dashboard/budgets');
      router.refresh();
    } catch (error) {
      console.error('Update budget project failed:', error);
      await Swal.fire('Error!', 'Falló la actualización del proyecto.', 'error');
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <div className="rounded-md bg-gray-50 p-4 md:p-6">
        {/* Project Metadata */}
        <div className="grid grid-cols-1 gap-4 md:grid-cols-3">
          {/* Year */}
          <div>
            <label htmlFor="year" className="mb-1 block text-sm font-medium text-gray-900">
              Año del proyecto
            </label>
            <div className="relative">
              <input
                id="year"
                name="year"
                type="number"
                inputMode="numeric"
                defaultValue={budget.year}
                placeholder="Ej: 2027"
                className="peer block w-full rounded-md border border-gray-200 py-2 pl-10 text-sm outline-2 placeholder:text-gray-400"
              />
              <CalendarIcon className="pointer-events-none absolute left-3 top-1/2 h-[18px] w-[18px] -translate-y-1/2 text-gray-500 peer-focus:text-gray-900" />
            </div>
          </div>

          {/* Project Name */}
          <div className="md:col-span-2">
            <label htmlFor="project_name" className="mb-1 block text-sm font-medium text-gray-900">
              Nombre del proyecto
            </label>
            <div className="relative">
              <input
                id="project_name"
                name="project_name"
                type="text"
                defaultValue={budget.project_name}
                placeholder="Ej: Obra Parque Industrial"
                className="peer block w-full rounded-md border border-gray-200 py-2 pl-10 text-sm outline-2 placeholder:text-gray-400"
              />
              <FolderIcon className="pointer-events-none absolute left-3 top-1/2 h-[18px] w-[18px] -translate-y-1/2 text-gray-500 peer-focus:text-gray-900" />
            </div>
          </div>
        </div>

        {/* Allocated Amount */}
        <div className="mt-6">
          <label htmlFor="allocated_amount" className="mb-1 block text-sm font-medium text-gray-900">
            Monto asignado al proyecto
          </label>

          <div className="relative">
            <input
              id="allocated_amount"
              name="allocated_amount"
              type="text"
              inputMode="decimal"
              value={displayAmount}
              placeholder="Ej: 100000000000,00"
              className="peer block w-full rounded-md border border-gray-200 py-2 pl-10 text-sm outline-2 placeholder:text-gray-400"
              onChange={(e) => {
                const sanitized = sanitizeMoneyInput(e.target.value);
                setDisplayAmount(sanitized);
                
                const normalized = normalizeMoneyInput(sanitized);
                setAllocatedAmount(normalized ? parseFloat(normalized) : 0);
              }}
              onFocus={() => {
                setDisplayAmount(sanitizeMoneyInput(displayAmount));
              }}
              onBlur={() => {
                if (allocatedAmount > 0) {
                  setDisplayAmount(formatMoneyForDisplay(allocatedAmount));
                }
              }}
            />
            <CurrencyDollarIcon className="pointer-events-none absolute left-3 top-1/2 h-[18px] w-[18px] -translate-y-1/2 text-gray-500 peer-focus:text-gray-900" />
          </div>
        </div>
      </div>

      {/* Paid/Executed Amount (Read-only) */}
      <div className="rounded-md bg-gray-50 p-4 md:p-6">

        <div className="mt-6">
          <label htmlFor="amount" className="mb-1 block text-sm font-medium text-gray-900">
            Cantidad abonada
          </label>

          <div className="relative mt-2 rounded-md">
            <input
              id="amount"
              name="amount"
              type="text"
              inputMode="decimal"
              value={formatMoneyForDisplay(budget.amount)}
              disabled
              className="peer block w-full cursor-not-allowed rounded-md border border-gray-200 bg-gray-100 py-2 pl-10 text-sm text-gray-600 outline-2"
            />
            <CurrencyDollarIcon className="pointer-events-none absolute left-3 top-1/2 h-[18px] w-[18px] -translate-y-1/2 text-gray-500" />
          </div>
        </div>

        {/* Budget Status */}
        <fieldset className="mt-6">
          <legend className="mb-1 block text-sm font-medium text-gray-900">Estado del proyecto</legend>

          <div className="rounded-md border border-gray-200 bg-white px-[14px] py-3">
            <div className="flex flex-wrap gap-4">
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
                  className="ml-2 flex cursor-pointer items-center gap-1.5 rounded-full bg-gray-100 px-3 py-1.5 text-xs font-medium text-gray-700"
                >
                  Pendiente <ClockIcon className="h-4 w-4" />
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
                  Aprobado <CheckIcon className="h-4 w-4" />
                </label>
              </div>
            </div>
          </div>
        </fieldset>

        {/* Buttons */}
        <div className="mt-6 flex justify-end gap-4">
          <Link
            href="/dashboard/budgets"
            className="flex h-10 items-center rounded-lg bg-gray-100 px-4 text-sm font-medium text-gray-700 transition-colors hover:bg-gray-200"
          >
            Cancelar
          </Link>
          <Button type="submit">Editar Proyecto</Button>
        </div>
      </div>
    </form>
  );
}
