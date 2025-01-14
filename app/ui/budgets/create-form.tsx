"use client";

import {
  createBudgetAllocation,
  createProgram,
  createProject,
} from '@/app/lib/actions';
import { AreaType, CustomerField } from '@/app/lib/definitions';
import { Button } from '@/app/ui/button';
import { useRouter } from 'next/navigation';
import { useEffect, useState } from 'react';
import Swal from 'sweetalert2';
import CustomAutocompleteProgram from '../autocomplete';

export default function CreateBudgetForm({
  areas,
  customers,
}: {
  areas: AreaType[];
  customers: CustomerField[];
}) {
  const [step, setStep] = useState(1);
  const [projectId, setProjectId] = useState<string | null>(null);

  // Años
  const [years, setYears] = useState<number[]>([]);
  const [isLoadingYears, setIsLoadingYears] = useState(true);

  // (Opcional) Cargar programas para otros fines
  const [programs, setPrograms] = useState<{ id: string; name: string }[]>([]);
  const [isLoadingPrograms, setIsLoadingPrograms] = useState(true);

  // Estado para almacenar un candidato nuevo (texto) que se quiere crear
  const [newProgramCandidate, setNewProgramCandidate] = useState<string>("");

  // Form data
  const [formData, setFormData] = useState({
    project_name: '',
    year: '',
    allocated_amount: 0,
    program: '',
    areaId: '',
    half: 1,
  });

  const router = useRouter();

  // 1. Cargar años
  useEffect(() => {
    const getYears = async () => {
      try {
        const res = await fetch('/api/year');
        if (!res.ok) throw new Error('Error fetching years data');
        const data: number[] = await res.json();
        const validYears = data.filter((y) => typeof y === 'number');
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

  // (Opcional) 2. Cargar programas
  useEffect(() => {
    const fetchPrograms = async () => {
      try {
        const res = await fetch('/api/programs');
        if (!res.ok) throw new Error('Error fetching programs');
        const data = await res.json();
        setPrograms(data);
      } catch (error) {
        console.error(error);
        Swal.fire('Error', 'Error fetching programs.', 'error');
      } finally {
        setIsLoadingPrograms(false);
      }
    };
    fetchPrograms();
  }, []);

  // 3. Manejo de cambios en inputs
  const handleChange = (
    e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>
  ) => {
    const { name, value } = e.target;
    setFormData((prev) => ({
      ...prev,
      [name]: name === 'allocated_amount' ? parseFloat(value) : value,
    }));
  };

  // 4. Paso 1: Crear el Project
  const handleSubmitStep1 = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    try {
      const yearNumber = parseInt(formData.year);
      if (!formData.project_name || !yearNumber) {
        Swal.fire('Error', 'Please provide project name and valid year.', 'error');
        return;
      }
      const res = await createProject(formData.project_name, yearNumber);
      if (!res.success) {
        Swal.fire('Error', res.message, 'error');
        return;
      }
      setProjectId(res.projectId || null);
      Swal.fire('Success', res.message, 'success');
      setStep(2);
    } catch (error) {
      console.error('Error creating project:', error);
      Swal.fire('Error', 'Unexpected error', 'error');
    }
  };

  // 5. Paso 2: Asignar Área y Program
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

      // Si hay un candidato nuevo, crearlo
      let programToUse = formData.program;
      if (newProgramCandidate.trim().length > 0) {
        const result = await createProgram(newProgramCandidate);
        console.log('New program created with ID:', result);
        programToUse = newProgramCandidate;
        setNewProgramCandidate(""); // Limpiar candidato
        setFormData((prev) => ({ ...prev, program: programToUse }));
      } else {
        console.log("Using existing program:", formData.program);
      }

      // Crear la asignación con createBudgetAllocation
      const res = await createBudgetAllocation(
        projectId,
        formData.areaId,
        formData.allocated_amount,
        formData.half,
        programToUse,
        yearNumber
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
                {years.map((y) => (
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
            Now assigning funds to &quot;{formData.project_name}&quot; ({formData.year})
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
              <option value="" disabled>
                Select an area
              </option>
              {areas.map((area) => (
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

          {/* Autocomplete de Program con callback */}
          <div className="mb-4">
            <CustomAutocompleteProgram
              onProgramSelected={(programName: string, isNew?: boolean) => {
                setFormData((prev) => ({ ...prev, program: programName }));
                if (isNew) {
                  setNewProgramCandidate(programName);
                } else {
                  setNewProgramCandidate("");
                }
              }}
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
