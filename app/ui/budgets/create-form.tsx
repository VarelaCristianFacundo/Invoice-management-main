"use client";

import {
  createBudgetAllocation,
  createProgram,
  createProject,
} from "@/app/lib/actions";
import { AreaType, CustomerField } from "@/app/lib/definitions";
import { Button } from "@/app/ui/button";
import { useRouter } from "next/navigation";
import { useEffect, useState } from "react";
import Swal from "sweetalert2";
import CustomAutocompleteProgram from "../autocomplete";

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

  // Programas
  const [programs, setPrograms] = useState<{ id: string; name: string }[]>([]);
  const [isLoadingPrograms, setIsLoadingPrograms] = useState(true);

  // Nuevo programa (opcional)
  const [newProgramCandidate, setNewProgramCandidate] = useState<string>("");

  // Form data
  const [formData, setFormData] = useState({
    company_id: 1,
    project_name: "",
    year: "",
    allocated_amount: 0,
    program: "",
    areaId: "",
    half: 1,
  });

  const router = useRouter();

  // Cargar años disponibles
  useEffect(() => {
    const fetchYears = async () => {
      try {
        const res = await fetch("/api/year");
        if (!res.ok) throw new Error("Error fetching years data");
        const data: number[] = await res.json();
        setYears(data.filter((y) => typeof y === "number"));
      } catch (error) {
        console.error("Error fetching years:", error);
        Swal.fire("Error", "Error fetching years. Please try again later.", "error");
      } finally {
        setIsLoadingYears(false);
      }
    };
    fetchYears();
  }, []);

  // Cargar programas disponibles
  useEffect(() => {
    const fetchPrograms = async () => {
      try {
        const res = await fetch("/api/programs");
        if (!res.ok) throw new Error("Error fetching programs");
        const data = await res.json();
        setPrograms(data);
      } catch (error) {
        console.error("Error fetching programs:", error);
        Swal.fire("Error", "Error fetching programs.", "error");
      } finally {
        setIsLoadingPrograms(false);
      }
    };
    fetchPrograms();
  }, []);

  // Manejo de cambios en inputs
  const handleChange = (
    e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>
  ) => {
    const { name, value } = e.target;
    setFormData((prev) => ({
      ...prev,
      [name]: name === "allocated_amount" ? parseFloat(value) : value,
    }));
  };

  // Crear proyecto
  const handleSubmitStep1 = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    try {
      const yearNumber = parseInt(formData.year, 10);
      if (!formData.project_name || !yearNumber) {
        Swal.fire("Error", "Please provide project name and valid year.", "error");
        return;
      }

      const res = await createProject(formData.project_name, yearNumber, formData.company_id);
      if (!res.success) {
        Swal.fire("Error", res.message, "error");
        return;
      }
      setProjectId(res.projectId || null);
      Swal.fire("Success", res.message, "success");
      setStep(2);
    } catch (error) {
      console.error("Error creating project:", error);
      Swal.fire("Error", "Unexpected error", "error");
    }
  };

  // Asignar área y programa
  const handleSubmitStep2 = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    try {
      if (!projectId || !formData.areaId) {
        Swal.fire("Error", "Please select a valid project and area.", "error");
        return;
      }

      const yearNumber = parseInt(formData.year, 10);
      let programToUse = formData.program;

      if (newProgramCandidate.trim().length > 0) {
        const result = await createProgram(newProgramCandidate);
        programToUse = newProgramCandidate;
        setNewProgramCandidate("");
        setFormData((prev) => ({ ...prev, program: programToUse }));
      }

      const res = await createBudgetAllocation(
        projectId,
        formData.areaId,
        formData.allocated_amount,
        formData.half,
        programToUse,
        yearNumber
      );
      if (!res.success) {
        Swal.fire("Error", res.message, "error");
        return;
      }
      Swal.fire("Success", res.message, "success");
      router.push("/dashboard/budgets");
    } catch (error) {
      console.error("Error assigning budget allocation:", error);
      Swal.fire("Error", "Unexpected error", "error");
    }
  };

  return (
    <div className="rounded-md bg-gray-50 p-4 md:p-6">
      {step === 1 && (
        <form onSubmit={handleSubmitStep1}>
          {/* Selector de compañía */}
          <div className="mb-4">
            <label htmlFor="company_id" className="mb-2 block text-sm font-medium">
              Company
            </label>
            <select
              id="company_id"
              name="company_id"
              value={formData.company_id}
              onChange={handleChange}
              className="block w-full rounded-md border py-2 px-3 text-sm"
              required
            >
              <option value="1">CAMARCO</option>
              <option value="2">FODECO</option>
            </select>
          </div>

          {/* Selector de año */}
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

          {/* Nombre del proyecto */}
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
            Assigning funds to &quot;{formData.project_name}&quot; ({formData.year})
          </h2>

          {/* Área */}
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
              <option value="">Select an area</option>
              {areas.map((area) => (
                <option key={area.id} value={area.id}>
                  {area.name}
                </option>
              ))}
            </select>
          </div>

          {/* Monto asignado */}
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

          {/* Autocomplete para programa */}
          <div className="mb-4">
            <CustomAutocompleteProgram
              onProgramSelected={(programName, isNew) => {
                setFormData((prev) => ({ ...prev, program: programName }));
                if (isNew) {
                  setNewProgramCandidate(programName);
                } else {
                  setNewProgramCandidate("");
                }
              }}
            />
          </div>

          {/* Semestre */}
          <div className="mb-4">
            <label htmlFor="half" className="mb-2 block text-sm font-medium">
              Semester
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
