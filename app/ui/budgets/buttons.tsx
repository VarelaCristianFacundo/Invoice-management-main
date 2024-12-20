"use client";

import { PencilIcon, PlusIcon, TrashIcon, XMarkIcon } from '@heroicons/react/24/outline';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import Swal from 'sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';

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
    const result = await Swal.fire({
      title: 'Confirm Rejection',
      text: 'Are you sure you want to reject this budget?',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Yes, reject it',
      cancelButtonText: 'Cancel',
    });

    if (!result.isConfirmed) return;

    try {
      const res = await fetch(`/api/budget/${id}/reject`, {
        method: 'POST',
      });
      if (!res.ok) throw new Error('Failed to reject budget');

      Swal.fire('Rejected!', 'The budget was rejected successfully.', 'success');
      router.refresh();
    } catch (error) {
      console.error('Error rejecting budget:', error);
      Swal.fire('Error!', 'There was an error rejecting the budget.', 'error');
    }
  };

  return (
    <button onClick={handleReject} className="rounded-md border p-2 text-red-600 hover:bg-gray-100 hover:text-red-800">
      <XMarkIcon className="w-5" />
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
  const router = useRouter();

  const handleDelete = async () => {
    const result = await Swal.fire({
      title: 'Confirm Deletion',
      text: 'Are you sure you want to delete this budget?',
      icon: 'error',
      showCancelButton: true,
      confirmButtonText: 'Yes, delete it',
      cancelButtonText: 'Cancel',
    });

    if (!result.isConfirmed) return;

    try {
      const res = await fetch(`/api/budget/${id}`, { method: 'DELETE' });
      if (!res.ok) throw new Error('Error deleting budget');

      Swal.fire('Deleted!', 'The budget was deleted successfully.', 'success');
      router.refresh();
    } catch (error) {
      console.error('Error deleting budget:', error);
      Swal.fire('Error!', 'There was an error deleting the budget.', 'error');
    }
  };

  return (
    <button onClick={handleDelete} className="rounded-md border p-2 text-red-600 hover:bg-gray-100 hover:text-red-800"
    >
      <TrashIcon className="w-5" />
    </button>
  );
}
