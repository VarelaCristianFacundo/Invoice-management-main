"use client";

import { createInvoice } from "@/app/lib/actions";
import { useRouter } from "next/navigation";
import { FormEvent, useEffect, useState } from "react";
import Swal from "sweetalert2";
import "sweetalert2/dist/sweetalert2.min.css";

// Actualizá el tipo para incluir CUIT/CUIL
type CustomerField = { id: string; name: string; cuit_cuil: string };

type BudgetAllocationItem = {
  id: string;
  project_name: string;
  area_id: string;
  area_name: string;
  year: number;
};

export default function CreateInvoiceForm({
  customers,
}: {
  customers: CustomerField[];
}) {
  const [budgetAllocations, setBudgetAllocations] = useState<BudgetAllocationItem[]>([]);
  // En vez de usar select, usaremos dos estados:
  // uno para el valor del input y otro para el id seleccionado
  const [customerInput, setCustomerInput] = useState("");
  const [customerId, setCustomerId] = useState("");
  const [amount, setAmount] = useState(0);
  // Este formulario siempre crea facturas en estado "presentado"
  const invoiceStatus: "presentado" | "aprobado" | "pagado" | "rechazado" = "presentado";
  const [selectedAllocationId, setSelectedAllocationId] = useState("");
  const [areaId, setAreaId] = useState("");
  const [year, setYear] = useState<number>(new Date().getFullYear());
  const [pdfFile, setPdfFile] = useState<File | null>(null);
  const router = useRouter();

  // Cargar allocations
  useEffect(() => {
    async function fetchBudgetAllocations() {
      try {
        const res = await fetch("/api/budget-allocations");
        if (!res.ok) throw new Error("Error fetching Budget Allocations");
        const data: BudgetAllocationItem[] = await res.json();
        setBudgetAllocations(data);
      } catch (error) {
        console.error(error);
        Swal.fire("Error", "Failed to fetch Budget Allocations.", "error");
      }
    }
    fetchBudgetAllocations();
  }, []);

  // Actualiza areaId y year cuando se selecciona una allocation
  useEffect(() => {
    if (!selectedAllocationId) return;
    const found = budgetAllocations.find(item => item.id === selectedAllocationId);
    if (found) {
      setAreaId(found.area_id);
      setYear(found.year);
    }
  }, [selectedAllocationId, budgetAllocations]);

  const handlePdfChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files && e.target.files.length > 0) {
      setPdfFile(e.target.files[0]);
    } else {
      setPdfFile(null);
    }
  };

  function fileToBase64(file: File): Promise<string> {
    return new Promise((resolve, reject) => {
      const reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = () => resolve(reader.result as string);
      reader.onerror = (error) => reject(error);
    });
  }

  // Función para filtrar los customers según lo ingresado
  const filteredCustomers = customerInput.length >= 3
    ? customers.filter(c =>
      c.name.toLowerCase().includes(customerInput.toLowerCase()) ||
      c.cuit_cuil.includes(customerInput)
    )
    : [];

  const handleCustomerSelect = (selected: CustomerField) => {
    setCustomerInput(`${selected.name} (${selected.cuit_cuil})`);
    setCustomerId(selected.id);
  };

  const handleSubmit = async (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    if (!customerId || !selectedAllocationId) {
      Swal.fire("Incomplete", "Selecciona cliente y proyecto/área", "info");
      return;
    }
    if (amount <= 0) {
      Swal.fire("Incomplete", "El monto debe ser mayor a 0", "info");
      return;
    }

    let base64File = "";
    if (pdfFile) {
      base64File = await fileToBase64(pdfFile);
    }

    const allocation = budgetAllocations.find(ba => ba.id === selectedAllocationId);
    if (!allocation) {
      Swal.fire("Error", "No se encontró la budgetAllocation seleccionada", "error");
      return;
    }

    const formDataObj = {
      customerId,
      amount,
      status: invoiceStatus,
      areaId,
      year,
      budgetAllocationId: selectedAllocationId,
      file: base64File,
      company_id: 1, // Ejemplo
    };

    const confirmation = await Swal.fire({
      title: "Confirmar Creación",
      text: "¿Está seguro de que desea crear esta factura?",
      icon: "question",
      showCancelButton: true,
      confirmButtonText: "Sí, crearla",
      cancelButtonText: "Cancelar",
    });
    if (!confirmation.isConfirmed) return;

    try {
      const response = await createInvoice(formDataObj);
      if (response.success) {
        Swal.fire("Éxito", response.message, "success").then(() => {
          router.push("/dashboard/invoices");
        });
      } else {
        Swal.fire("Error", response.message, "error");
      }
    } catch (error: any) {
      console.error("Error creating invoice:", error);
      Swal.fire("Error", error.message || "Failed to create Invoice", "error");
    }
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-6 rounded-md bg-gray-50 p-4 md:p-6">
      {/* Autocomplete para Customer */}
      <div>
        <label htmlFor="customerInput" className="mb-2 block text-sm font-medium">
          Elegir Proveedor (Por nombre o CUIT/CUIL)
        </label>
        <input
          type="text"
          id="customerInput"
          name="customerInput"
          value={customerInput}
          onChange={(e) => {
            setCustomerInput(e.target.value);
            setCustomerId(""); // Limpiamos el id cuando se escribe
          }}
          placeholder="Empieza a escribir..."
          className="block w-full rounded-md border border-gray-200 py-2 px-3 text-sm"
          autoComplete="off"
        />
        {/* Mostrar sugerencias */}
        {customerInput.length >= 3 && filteredCustomers.length > 0 && (
          <ul className="border border-gray-200 rounded-md bg-white mt-1 max-h-60 overflow-y-auto">
            {filteredCustomers.map((customer) => (
              <li
                key={customer.id}
                className="p-2 cursor-pointer hover:bg-gray-100"
                onClick={() => handleCustomerSelect(customer)}
              >
                {customer.name} — {customer.cuit_cuil}
              </li>
            ))}
          </ul>
        )}
      </div>

      {/* Project + Area */}
      <div>
        <label htmlFor="allocation" className="mb-2 block text-sm font-medium">
          Elegir Proyecto + Área (Año)
        </label>
        <select
          id="allocation"
          name="allocation"
          value={selectedAllocationId}
          onChange={(e) => setSelectedAllocationId(e.target.value)}
          className="block w-full rounded-md border border-gray-200 py-2 px-3 text-sm"
          required
        >
          <option value="">Seleccionar Proyecto/Área</option>
          {budgetAllocations.map((alloc) => (
            <option key={alloc.id} value={alloc.id}>
              {`${alloc.project_name} - ${alloc.area_name} (Año ${alloc.year})`}
            </option>
          ))}
        </select>
      </div>

      {/* Monto */}
      <div>
        <label htmlFor="amount" className="mb-2 block text-sm font-medium">
          Cantidad
        </label>
        <input
          id="amount"
          name="amount"
          type="number"
          step="0.01"
          className="block w-full rounded-md border border-gray-200 py-2 px-3 text-sm"
          value={amount}
          onChange={(e) => setAmount(parseFloat(e.target.value) || 0)}
          required
        />
      </div>

      {/* PDF Upload */}
      <div>
        <label htmlFor="pdfFile" className="mb-2 block text-sm font-medium">
          Cargar PDF (Opcional)
        </label>
        <input
          id="pdfFile"
          name="pdfFile"
          type="file"
          accept="application/pdf"
          onChange={handlePdfChange}
          className="block w-full text-sm text-gray-500 file:mr-4 file:rounded-full file:border-0 file:bg-gray-100 file:py-2 file:px-4 file:text-sm file:font-semibold hover:file:bg-gray-200"
        />
      </div>

      {/* Botones */}
      <div className="flex justify-end gap-4">
        <button
          type="button"
          onClick={() => router.push("/dashboard/invoices")}
          className="rounded-lg bg-gray-200 px-4 py-2 text-sm text-gray-600 hover:bg-gray-300"
        >
          Cancelar
        </button>
        <button
          type="submit"
          className="rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700"
        >
          Crear Factura
        </button>
      </div>
    </form>
  );
}
