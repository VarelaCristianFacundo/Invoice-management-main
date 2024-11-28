"use client";

import { PencilIcon, PlusIcon, TrashIcon } from '@heroicons/react/24/outline';
import Link from 'next/link';
import { useRouter } from 'next/navigation';

export function CreateBudget() {
    return (
        <Link href="/dashboard/budgets/create" className="flex h-10 items-center rounded-lg bg-gray-800 px-4 text-sm font-medium text-white transition-colors hover:bg-gray-700">
            <PlusIcon className="w-5" />
            <span>Create Budget</span>
        </Link>
    );
}


export function RejectBudget({ id }: { id: string }) {
  const router = useRouter();

  const handleReject = async () => {
    const confirmed = confirm('¿Estás seguro de rechazar este presupuesto?');
    if (!confirmed) return;

    try {
      const res = await fetch(`/api/budget/${id}/reject`, {
        method: 'POST',
      });
      if (!res.ok) throw new Error('Failed to reject budget');
      alert('Presupuesto rechazado exitosamente');
      router.refresh();
    } catch (error) {
      console.error('Error rejecting budget:', error);
      alert('Error al rechazar el presupuesto');
    }
  };

  return (
    <button onClick={handleReject} className="text-red-600 hover:text-red-800">
      Rechazar
    </button>
  );
}


export function UpdateBudget({ id }: { id: string }) {
    return (
        <Link href={`/dashboard/budgets/${id}/edit`} className="rounded-md border p-2 hover:bg-gray-100">
            <PencilIcon className="w-5" />
        </Link>
    );
}

export function DeleteBudget({ id }: { id: string }) {
    const handleDelete = async () => {
        try {
            const res = await fetch(`/api/budget/${id}`, { method: 'DELETE' });
            if (!res.ok) throw new Error('Error deleting budget');
            alert('Budget deleted successfully');
        } catch (error) {
            alert('Failed to delete budget');
        }
    };

    return (
        <button onClick={handleDelete} className="rounded-md border p-2 hover:bg-gray-100">
            <TrashIcon className="w-5" />
        </button>
    );
}

