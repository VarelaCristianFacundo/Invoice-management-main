"use client";

import { CustomerField } from '@/app/lib/definitions';
import { supabase } from '@/app/lib/supabaseClient';
import { Button } from '@/app/ui/button';
import {
  CheckIcon,
  ClockIcon,
  CurrencyDollarIcon,
  UserCircleIcon,
} from '@heroicons/react/24/outline';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { useEffect, useState } from 'react';

export default function CreateBudgetForm({ customers, areas }: { customers: CustomerField[], areas: any[] }) {
  const [message, setMessage] = useState<string | null>(null);
  const [selectedAreaId, setSelectedAreaId] = useState<string>('');
  const [availableFunds, setAvailableFunds] = useState<number>(0);
  const router = useRouter();

  useEffect(() => {
    async function fetchAvailableFunds(areaId: string) {
      if (!areaId) {
        // Cambiar console.error por un log condicional
        if (process.env.NODE_ENV === 'development') {
          console.debug('Area ID is required to fetch funds');
        }
        setAvailableFunds(0);
        return;
      }

      try {
        const res = await fetch(`/api/areas/${areaId}/funds`);

        if (!res.ok) {
          console.error(`API error: ${res.statusText}`);
          setAvailableFunds(0);
          return;
        }

        const text = await res.text();
        const data = text ? JSON.parse(text) : {};
        setAvailableFunds(data.allocated_funds || 0);
      } catch (error) {
        console.error('Error fetching available funds:', error);
        setAvailableFunds(0);
      }
    }


    fetchAvailableFunds(selectedAreaId);
  }, [selectedAreaId]);

  const handleAreaChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    const areaId = e.target.value;
    setSelectedAreaId(areaId);
  };

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    const form = e.currentTarget as HTMLFormElement;
    const formDataObj = new FormData(form);
    const fileInput = form.elements.namedItem('file') as HTMLInputElement;
    const file = fileInput?.files?.[0];
    let fileUrl = '';



    const formData = {
      year: formDataObj.get('year') as string,
      program: formDataObj.get('program') as string,
      areaId: selectedAreaId,
      project: formDataObj.get('project') as string,
      customerId: formDataObj.get('customerId') as string,
      concept: formDataObj.get('concept') as string,
      amount: parseFloat(formDataObj.get('amount') as string),
      status: formDataObj.get('status') as string,
      fileUrl,
    };
    console.log('Datos enviados al servidor:', formData);

    if (file) {
      const filePath = `budgets/${Date.now()}_${file.name}`;
      const { data: uploadData, error: uploadError } = await supabase.storage
        .from('budgets')
        .upload(filePath, file);

      if (uploadError) {
        console.error('Error uploading file:', uploadError);
        setMessage('Error uploading file');
        return;
      }

      // Obtener la URL pública del archivo
      const { data: publicUrlData } = supabase.storage
        .from('budgets')
        .getPublicUrl(filePath);

      formData.fileUrl = publicUrlData.publicUrl;
    }
    // Validar si el monto excede el fondo disponible
    if (formData.amount > availableFunds) {
      setMessage('El monto excede el fondo disponible del área seleccionada.');
      return;
    }

    try {
      const res = await fetch('/api/budget', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(formData),
      });

      if (!res.ok) throw new Error('Failed to create budget');

      setMessage('¡Presupuesto creado exitosamente!');
      router.push('/dashboard/budgets');
      router.refresh();
    } catch (error) {
      console.error('Failed to create budget:', error);
      setMessage('Error al crear el presupuesto');
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
          value={selectedAreaId}
          onChange={handleAreaChange}
          className="block w-full rounded-md border border-gray-200 bg-white py-2 pl-3 pr-10 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
        >
          <option value="" disabled>
            Seleccionar área
          </option>
          {areas.map((area) => (
            <option key={area.id} value={area.id}>
              {area.name}
            </option>
          ))}
        </select>
      </div>

      {/* Mostrar fondo disponible */}
      {selectedAreaId && (
        <div className="mb-4">
          <p className="text-sm font-medium">
            Fondo disponible: <span className="text-green-600">{availableFunds.toLocaleString('es-AR', { style: 'currency', currency: 'ARS' })}</span>
          </p>
        </div>
      )}



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

      <div className="mb-4">
        <label htmlFor="file" className="mb-2 block text-sm font-medium">
          Upload File
        </label>
        <input
          id="file"
          name="file"
          type="file"
          accept=".pdf,image/*"
          className="block w-full text-sm text-gray-500
               file:mr-4 file:py-2 file:px-4
               file:rounded-full file:border-0
               file:text-sm file:font-semibold
               file:bg-blue-50 file:text-blue-700
               hover:file:bg-blue-100"
        />
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
