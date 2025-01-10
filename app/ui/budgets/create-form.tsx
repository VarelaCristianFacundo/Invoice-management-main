"use client";

import {
  createBudgetAllocation,
  createProject
} from '@/app/lib/actions';
import { Button } from '@/app/ui/button';
import { useRouter } from 'next/navigation';
import { useEffect, useState } from 'react';
import Swal from 'sweetalert2';

type AreaType = {
  id: string;
  name: string;
};

export default function CreateBudgetForm({ areas }: { areas: AreaType[] }) {
  const [step, setStep] = useState(1);
  const [projectId, setProjectId] = useState<string | null>(null);

  // Años
  const [years, setYears] = useState<number[]>([]);
  const [isLoadingYears, setIsLoadingYears] = useState(true);

  // Datos del form
  const [formData, setFormData] = useState({
    project_name: '',
    year: '',
    allocated_amount: 0,
    program: '',
    areaId: '',
    half: 1
  });

  const router = useRouter();

  // 1. Cargar años desde la API
  useEffect(() => {
    const getYears = async () => {
      try {
        const res = await fetch('/api/year');
        if (!res.ok) throw new Error('Error fetching years data');
        const data: number[] = await res.json();
        const validYears = data.filter(y => typeof y === 'number');
        setYears(validYears);
      } catch (error) {
        console.error('Error fetching years:', error);
        Swal.fire('Error', 'Error fetching years. Please try again later.', 'error');
      } finally {
        setIsLoadingYears(false);
      }
    };
    getYears();
  }, []);

  // 2. Manejo de cambios en inputs
  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setFormData(prev => ({
      ...prev,
      [name]: name === 'allocated_amount' ? parseFloat(value) : value
    }));
  };

  // 3. Paso 1: Crear solo el proyecto (budgets)
  const handleSubmitStep1 = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    try {
      const yearNumber = parseInt(formData.year);
      if (!formData.project_name || !yearNumber) {
        Swal.fire('Error', 'Please provide project name and valid year.', 'error');
        return;
      }

      // Llamamos a createProject
      const res = await createProject(formData.project_name, yearNumber);
      if (!res.success) {
        Swal.fire('Error', res.message, 'error');
        return;
      }

      // Guardamos ID y pasamos a step 2
      setProjectId(res.projectId);
      Swal.fire('Success', res.message, 'success');
      setStep(2);

    } catch (error) {
      console.error('Error creating project:', error);
      Swal.fire('Error', 'Unexpected error', 'error');
    }
  };

  // 4. Paso 2: Crear la asignación (budget_allocations)
  const handleSubmitStep2 = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    try {
      if (!projectId) {
        Swal.fire('Error', 'No Project ID found.', 'error');
        return;
      }
      if (!formData.areaId) {
        Swal.fire('Error', 'Please select an area.', 'error');
        return;
      }
      const yearNumber = parseInt(formData.year);

      // Llamamos a createBudgetAllocation
      const res = await createBudgetAllocation(
        projectId,
        formData.areaId,
        formData.allocated_amount,
        formData.half,
        formData.program,
        yearNumber  // <--- Mandamos el año
      );

      if (!res.success) {
        Swal.fire('Error', res.message, 'error');
        return;
      }
      Swal.fire('Success', res.message, 'success');
      router.push('/dashboard/budgets');
    } catch (error) {
      console.error('Error creating budget allocation:', error);
      Swal.fire('Error', 'Unexpected error', 'error');
    }
  };

  return (
    <div className="rounded-md bg-gray-50 p-4 md:p-6">
      {step === 1 && (
        <form onSubmit={handleSubmitStep1}>
          <div className="mb-4">
            <label htmlFor="year" className="mb-2 block text-sm font-medium">
              Year
            </label>
            {isLoadingYears ? (
              <p>Loading years...</p>
            ) : (
              <select
                id="year"
                name="year"
                value={formData.year}
                onChange={handleChange}
                className="block w-full rounded-md border py-2 px-3 text-sm"
                required
              >
                <option value="">Select a year</option>
                {years.map(y => (
                  <option key={y} value={y}>
                    {y}
                  </option>
                ))}
              </select>
            )}
          </div>

          <div className="mb-4">
            <label htmlFor="project_name" className="mb-2 block text-sm font-medium">
              Project Name
            </label>
            <input
              id="project_name"
              name="project_name"
              type="text"
              value={formData.project_name}
              onChange={handleChange}
              className="block w-full rounded-md border py-2 px-3 text-sm"
              required
            />
          </div>

          <div className="mt-6 flex justify-end gap-4">
            <Button type="submit">Create Project</Button>
          </div>
        </form>
      )}

      {step === 2 && projectId && (
        <form onSubmit={handleSubmitStep2}>
          <h2 className="mb-4 text-lg font-semibold text-gray-700">
            Now assigning funds to "{formData.project_name}" ({formData.year})
          </h2>

          <div className="mb-4">
            <label htmlFor="areaId" className="mb-2 block text-sm font-medium">
              Select Area
            </label>
            <select
              id="areaId"
              name="areaId"
              value={formData.areaId}
              onChange={handleChange}
              className="block w-full rounded-md border py-2 px-3 text-sm"
              required
            >
              <option value="" disabled>Select an area</option>
              {areas.map(area => (
                <option key={area.id} value={area.id}>
                  {area.name}
                </option>
              ))}
            </select>
          </div>

          <div className="mb-4">
            <label htmlFor="allocated_amount" className="mb-2 block text-sm font-medium">
              Allocated Amount
            </label>
            <input
              id="allocated_amount"
              name="allocated_amount"
              type="number"
              value={formData.allocated_amount}
              onChange={handleChange}
              className="block w-full rounded-md border py-2 px-3 text-sm"
              required
            />
          </div>

          <div className="mb-4">
            <label htmlFor="program" className="mb-2 block text-sm font-medium">
              Program
            </label>
            <input
              id="program"
              name="program"
              type="text"
              value={formData.program}
              onChange={handleChange}
              className="block w-full rounded-md border py-2 px-3 text-sm"
              required
            />
          </div>

          <div className="mb-4">
            <label htmlFor="half" className="mb-2 block text-sm font-medium">
              Semestre
            </label>
            <select
              id="half"
              name="half"
              value={formData.half}
              onChange={handleChange}
              className="block w-full rounded-md border py-2 px-3 text-sm"
            >
              <option value={1}>First Semester</option>
              <option value={2}>Second Semester</option>
            </select>
          </div>

          <div className="mt-6 flex justify-end gap-4">
            <Button type="submit">Assign Area</Button>
          </div>
        </form>
      )}
    </div>
  );
}
