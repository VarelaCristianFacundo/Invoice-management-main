"use client";

import { formatCurrency } from "@/app/lib/utils";
import { DeleteBudget, UpdateBudget } from "@/app/ui/budgets/buttons";
import { useEffect, useState } from "react";
import Swal from "sweetalert2";

type Budget = {
  budget_id: string;
  project_name: string;
  program: string;
  year: number;
  total_allocated_amount: number;
  total_executed_amount: number;
  area_names: string;
};

type TableProps = {
  query: string;
  currentPage: number;
};

export default function BudgetsTable({ query, currentPage }: TableProps) {
  const [budgets, setBudgets] = useState<Budget[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [selectedCompany, setSelectedCompany] = useState<number | null>(1); // Default CAMARCO
  const [search, setSearch] = useState<string>("");

  const fetchBudgets = async () => {
    try {
      setLoading(true);

      const res = await fetch(
        `/api/budgets?query=${encodeURIComponent(search)}&currentPage=1&companyId=${selectedCompany || ""}`
      );

      if (res.status === 404) {
        setBudgets([]);
        return;
      }

      if (!res.ok) {
        throw new Error(`Failed to fetch budgets. Status: ${res.status}`);
      }

      const data: Budget[] = await res.json();
      setBudgets(data);
    } catch (error) {
      console.error("Error fetching budgets:", error);
      Swal.fire(
        "Error",
        "Failed to fetch budgets. Please try again later.",
        "error"
      );
    } finally {
      setLoading(false);
    }
  };


  useEffect(() => {
    fetchBudgets();
  }, [selectedCompany, search]);

  const handleSearchChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setSearch(e.target.value);
  };

  return (
    <div className="p-6 bg-gray-100 rounded-md shadow-md">
      <h2 className="text-lg font-semibold mb-4">Presupuestos por Empresa</h2>

      {/* Selector de empresa */}
      <div className="flex gap-4 mb-4">
        <button
          className={`px-4 py-2 rounded ${selectedCompany === 1 ? "bg-gray-800 text-white" : "bg-gray-300"}`}
          onClick={() => setSelectedCompany(1)}
        >
          CAMARCO
        </button>
        <button
          className={`px-4 py-2 rounded ${selectedCompany === 2 ? "bg-gray-800 text-white" : "bg-gray-300"}`}
          onClick={() => setSelectedCompany(2)}
        >
          FODECO
        </button>
      </div>

      {/* Barra de búsqueda */}
      <div className="mb-4">
        <input
          type="text"
          placeholder="Buscar proyectos..."
          value={search}
          onChange={handleSearchChange}
          className="w-full rounded-md border border-gray-300 py-2 px-3 text-sm"
        />
      </div>

      {/* Tabla de presupuestos */}
      <div className="overflow-x-auto bg-white rounded-md shadow">
        {loading ? (
          <p className="p-4">Cargando proyectos...</p>
        ) : budgets.length === 0 ? (
          <p className="p-4">No se encontraron proyectos.</p>
        ) : (
          <table className="min-w-full text-sm">
            <thead className="bg-gray-200 text-left">
              <tr>
                <th className="px-4 py-2">Proyecto</th>
                <th className="px-4 py-2">Programa</th>
                <th className="px-4 py-2">Año</th>
                <th className="px-4 py-2">Monto Asignado</th>
                <th className="px-4 py-2">Monto Abonado</th>
                <th className="px-4 py-2">Areas</th>
                <th className="px-4 py-2">Acciones</th>
              </tr>
            </thead>
            <tbody>
              {budgets.map((budget) => (
                <tr key={budget.budget_id}>
                  <td className="px-4 py-2">{budget.project_name}</td>
                  <td className="px-4 py-2">{budget.program || "N/A"}</td>
                  <td className="px-4 py-2">{budget.year}</td>
                  <td className="px-4 py-2">{formatCurrency(budget.total_allocated_amount)}</td>
                  <td className="px-4 py-2">{formatCurrency(budget.total_executed_amount)}</td>
                  <td className="px-4 py-2">{budget.area_names}</td>
                  <td className="px-4 py-2 flex gap-2">
                    <>
                      <UpdateBudget id={budget.budget_id} />
                      <DeleteBudget id={budget.budget_id} refreshBudgets={fetchBudgets} />
                    </>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>
    </div>
  );
}
