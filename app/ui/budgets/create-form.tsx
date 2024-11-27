"use client";

import { CustomerField } from '@/app/lib/definitions';
import { Button } from '@/app/ui/button';
import {
  CheckIcon,
  ClockIcon,
  CurrencyDollarIcon,
  UserCircleIcon,
} from '@heroicons/react/24/outline';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { useState } from 'react';

export default function CreateBudgetForm({ customers }: { customers: CustomerField[] }) {
  const [message, setMessage] = useState<string | null>(null);
  const router = useRouter();

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    const formData = {
      year: (e.currentTarget as any).year.value,
      program: (e.currentTarget as any).program.value,
      area: (e.currentTarget as any).area.value,
      project: (e.currentTarget as any).project.value,
      customerId: (e.currentTarget as any).customerId.value,
      concept: (e.currentTarget as any).concept.value,
      amount: parseFloat((e.currentTarget as any).amount.value),
      status: (e.currentTarget as any).status.value,
    };

    console.log('Form data to be sent:', formData); // Log para ver los datos antes de enviarlos

    try {
      const res = await fetch('/api/budget', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(formData),
      });

      console.log('Response status:', res.status); // Log del estado de la respuesta

      if (!res.ok) throw new Error('Failed to create budget');

      setMessage('Budget created successfully!');
      router.push('/dashboard/budgets');
    } catch (error) {
      console.error('Failed to create budget:', error);
      setMessage('Failed to create budget');
    }
  };

  return (
    <form onSubmit={handleSubmit} className="rounded-md bg-gray-50 p-4 md:p-6">
      {/* Form fields */}
      <div className="mb-4">
        <label htmlFor="year" className="mb-2 block text-sm font-medium">
          Year
        </label>
        <input
          id="year"
          name="year"
          type="number"
          className="peer block w-full rounded-md border border-gray-200 py-2 pl-10 text-sm outline-2 placeholder:text-gray-500"
          placeholder="Enter year"
        />
      </div>
      <div className="mb-4">
        <label htmlFor="area" className="mb-2 block text-sm font-medium">
          Área
        </label>
        <select
          id="area"
          name="area"
          required
          defaultValue=""
          className="block w-full rounded-md border border-gray-200 bg-white py-2 pl-3 pr-10 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
        >
          <option value="" disabled>
            Seleccionar área
          </option>
          <option value="Secretaría">Secretaría</option>
          <option value="Sistemas">Sistemas</option>
          <option value="Comunicación">Comunicación</option>
          <option value="GDI">GDI</option>
          <option value="EGC">EGC</option>
          <option value="GT">GT</option>
        </select>
      </div>



      <div className="mb-4">
        <label htmlFor="program" className="mb-2 block text-sm font-medium">
          Program
        </label>
        <input
          id="program"
          name="program"
          type="text"
          className="peer block w-full rounded-md border border-gray-200 py-2 pl-10 text-sm outline-2 placeholder:text-gray-500"
          placeholder="Enter program name"
        />
      </div>

      <div className="mb-4">
        <label htmlFor="project" className="mb-2 block text-sm font-medium">
          Project
        </label>
        <input
          id="project"
          name="project"
          type="text"
          className="peer block w-full rounded-md border border-gray-200 py-2 pl-10 text-sm outline-2 placeholder:text-gray-500"
          placeholder="Enter project name"
        />
      </div>

      <div className="mb-4">
        <label htmlFor="customerId" className="mb-2 block text-sm font-medium">
          Choose customer
        </label>
        <div className="relative">
          <select
            id="customerId"
            name="customerId"
            className="peer block w-full cursor-pointer rounded-md border border-gray-200 py-2 pl-10 text-sm outline-2 placeholder:text-gray-500"
            defaultValue=""
            aria-describedby="customer-error"
          >
            <option value="" disabled>Select a customer</option>
            {customers.map((customer) => (
              <option key={customer.id} value={customer.id}>{customer.name}</option>
            ))}
          </select>
          <UserCircleIcon className="pointer-events-none absolute left-3 top-1/2 h-[18px] w-[18px] -translate-y-1/2 text-gray-500" />
        </div>
      </div>

      <div className="mb-4">
        <label htmlFor="concept" className="mb-2 block text-sm font-medium">
          Concept
        </label>
        <input
          id="concept"
          name="concept"
          type="text"
          className="peer block w-full rounded-md border border-gray-200 py-2 pl-10 text-sm outline-2 placeholder:text-gray-500"
          placeholder="Enter concept"
        />
      </div>

      <div className="mb-4">
        <label htmlFor="amount" className="mb-2 block text-sm font-medium">
          Choose an amount
        </label>
        <div className="relative">
          <input
            id="amount"
            name="amount"
            type="number"
            step="0.01"
            className="peer block w-full rounded-md border border-gray-200 py-2 pl-10 text-sm outline-2 placeholder:text-gray-500"
            placeholder="Enter amount in USD"
          />
          <CurrencyDollarIcon className="pointer-events-none absolute left-3 top-1/2 h-[18px] w-[18px] -translate-y-1/2 text-gray-500" />
        </div>
      </div>

      <fieldset>
        <legend className="mb-2 block text-sm font-medium">Set the budget status</legend>
        <div className="rounded-md border border-gray-200 bg-white px-[14px] py-3">
          <div className="flex gap-4">
            <div className="flex items-center">
              <input
                id="pending"
                name="status"
                type="radio"
                value="pending"
                className="h-4 w-4 cursor-pointer border-gray-300 bg-gray-100 text-gray-600 focus:ring-2"
                defaultChecked
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

      <div className="mt-6 flex justify-end gap-4">
        <Link href="/dashboard/budgets" className="flex h-10 items-center rounded-lg bg-gray-100 px-4 text-sm font-medium text-gray-600 transition-colors hover:bg-gray-200">
          Cancel
        </Link>
        <Button type="submit">Create Budget</Button>
      </div>
    </form>
  );
}
