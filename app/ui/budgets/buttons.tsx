// app/ui/budgets/buttons.tsx
"use client";

import { deleteBudget } from '@/app/lib/actions';
import { PencilIcon, PlusIcon, TrashIcon } from '@heroicons/react/24/outline';
import Link from 'next/link';

export function CreateBudget() {
    return (
        <Link
            href="/dashboard/budgets/create"
            className="flex h-10 items-center rounded-lg bg-gray-800 px-4 text-sm font-medium text-white transition-colors hover:bg-gray-700"
        >
            <PlusIcon className="w-5" />
            <span>Create Budget</span>
        </Link>
    );
}

export function UpdateBudget({ id }: { id: string }) {
    return (
        <Link
            href={`/dashboard/budget/${id}/edit`}
            className="rounded-md border p-2 hover:bg-gray-100"
        >
            <PencilIcon className="w-5" />
        </Link>
    );
}

export function DeleteBudget({ id }: { id: string }) {
    return (
        <button
            onClick={() => deleteBudget(id)} // Asegúrate de que `deleteBudget` maneje la interacción adecuadamente en el cliente
            className="rounded-md border p-2 hover:bg-gray-100"
        >
            <TrashIcon className="w-5" />
        </button>
    );
}
