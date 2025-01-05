"use client";

import { createInvoice } from "@/app/lib/actions";
import { useRouter } from "next/navigation";
import { FormEvent, useEffect, useState } from "react";
import Swal from "sweetalert2";
import "sweetalert2/dist/sweetalert2.min.css";
// Ejemplo si usas Supabase para subir PDFs
// import { supabase } from "@/app/lib/supabaseClient";

/** Tipos mínimos, ajústalos a tus datos reales */
type CustomerField = {
  id: string;
  name: string;
};

type BudgetAllocationItem = {
  id: string;         // budgetAllocationId
  project_name: string;
  area_id: string;
  area_name: string;
  year: number;
};

/** Props que recibirá este formulario */
export default function CreateInvoiceForm({
  customers,
}: {
  customers: CustomerField[];
}) {
  const [budgetAllocations, setBudgetAllocations] = useState<BudgetAllocationItem[]>([]);
  const [customerId, setCustomerId] = useState("");
  const [amount, setAmount] = useState(0);
  const [status, setStatus] = useState<"pending" | "paid">("pending");

  // Para la selección del project/área:
  const [selectedAllocationId, setSelectedAllocationId] = useState("");
  const [areaId, setAreaId] = useState("");
  const [year, setYear] = useState<number>(new Date().getFullYear());

  // Para manejo de PDF
  const [pdfFile, setPdfFile] = useState<File | null>(null);

  const router = useRouter();

  // 1. Cargar Budget Allocations
  useEffect(() => {
    const fetchBudgetAllocations = async () => {
      try {
        // Ajusta la ruta o la lógica a tu backend
        const res = await fetch("/api/budget-allocations");
        if (!res.ok) {
          throw new Error("Error fetching Budget Allocations");
        }
        const data: BudgetAllocationItem[] = await res.json();
        setBudgetAllocations(data);
      } catch (error) {
        console.error(error);
        Swal.fire("Error", "Failed to fetch Budget Allocations.", "error");
      }
    };
    fetchBudgetAllocations();
  }, []);

  // 2. Cada vez que cambie selectedAllocationId, obtenemos areaId y year
  useEffect(() => {
    if (!selectedAllocationId) return;
    const found = budgetAllocations.find((item) => item.id === selectedAllocationId);
    if (found) {
      setAreaId(found.area_id);
      setYear(found.year);
    }
  }, [selectedAllocationId, budgetAllocations]);

  /** Manejo de archivos PDF */
  const handlePdfChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files && e.target.files.length > 0) {
      setPdfFile(e.target.files[0]);
    } else {
      setPdfFile(null);
    }
  };

  /** onSubmit principal */
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

    // 1. Subir PDF (Opcional)
    let pdfUrl = "";
    if (pdfFile) {
      // Ejemplo si usas Supabase:
      // const filePath = `invoices/${Date.now()}_${pdfFile.name}`;
      // const { data, error } = await supabase.storage
      //   .from("invoices")
      //   .upload(filePath, pdfFile);
      // if (error) {
      //   console.error("Error uploading PDF:", error);
      //   Swal.fire("Error", "Failed to upload PDF", "error");
      //   return;
      // }
      // pdfUrl = `${process.env.NEXT_PUBLIC_SUPABASE_URL}/storage/v1/object/public/invoices/${filePath}`;
      // O si usas tu propio backend para subir archivos, etc.
    }

    // 2. Llamar createInvoice
    // Buscamos la budgetAllocation elegida
    const allocation = budgetAllocations.find((ba) => ba.id === selectedAllocationId);
    if (!allocation) {
      Swal.fire("Error", "No se encontró la budgetAllocation seleccionada", "error");
      return;
    }

    const formData = {
      customerId,
      amount,
      status,
      areaId: allocation.area_id,         // Lo sacamos del allocation
      year: allocation.year,              // O un state, si prefieres
      budgetAllocationId: selectedAllocationId,
      // Si quisieras adjuntar la url del PDF en la base de datos:
      // pdfUrl,
    };

    const result = await Swal.fire({
      title: "Confirm Creation",
      text: "Are you sure you want to create this invoice?",
      icon: "question",
      showCancelButton: true,
      confirmButtonText: "Yes, create it",
      cancelButtonText: "Cancel",
    });
    if (!result.isConfirmed) return;

    try {
      const response = await createInvoice(formData);
      if (response.success) {
        Swal.fire("Success", response.message, "success").then(() => {
          // Redirigir al listado de facturas
          router.push("/dashboard/invoices");
          router.refresh();
        });
      } else {
        Swal.fire("Error", response.message, "error");
      }
    } catch (error) {
      console.error("Error creating invoice:", error);
      Swal.fire("Error", "Failed to create Invoice", "error");
    }
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-6 rounded-md bg-gray-50 p-4 md:p-6">
      {/* Cliente */}
      <div>
        <label htmlFor="customerId" className="mb-2 block text-sm font-medium">
          Choose customer
        </label>
        <select
          id="customerId"
          name="customerId"
          value={customerId}
          onChange={(e) => setCustomerId(e.target.value)}
          className="block w-full rounded-md border border-gray-200 py-2 px-3 text-sm"
          required
        >
          <option value="">Select a customer</option>
          {customers.map((cus) => (
            <option key={cus.id} value={cus.id}>
              {cus.name}
            </option>
          ))}
        </select>
      </div>

      {/* BudgetAllocation: Project + Area */}
      <div>
        <label htmlFor="allocation" className="mb-2 block text-sm font-medium">
          Choose Project + Area
        </label>
        <select
          id="allocation"
          name="allocation"
          value={selectedAllocationId}
          onChange={(e) => setSelectedAllocationId(e.target.value)}
          className="block w-full rounded-md border border-gray-200 py-2 px-3 text-sm"
          required
        >
          <option value="">Select Project/Area</option>
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
          Amount
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

      {/* Status */}
      <fieldset>
        <legend className="mb-2 block text-sm font-medium">
          Invoice Status
        </legend>
        <div className="flex items-center gap-4">
          <label className="flex items-center text-sm">
            <input
              type="radio"
              name="status"
              value="pending"
              checked={status === "pending"}
              onChange={() => setStatus("pending")}
              className="mr-2"
            />
            Pending
          </label>
          <label className="flex items-center text-sm">
            <input
              type="radio"
              name="status"
              value="paid"
              checked={status === "paid"}
              onChange={() => setStatus("paid")}
              className="mr-2"
            />
            Paid
          </label>
        </div>
      </fieldset>

      {/* Subir PDF */}
      <div>
        <label htmlFor="pdfFile" className="mb-2 block text-sm font-medium">
          Upload PDF (optional)
        </label>
        <input
          id="pdfFile"
          name="pdfFile"
          type="file"
          accept="application/pdf"
          onChange={handlePdfChange}
          className="block w-full text-sm text-gray-500
                     file:mr-4 file:rounded-full file:border-0
                     file:bg-gray-100 file:py-2 file:px-4
                     file:text-sm file:font-semibold
                     hover:file:bg-gray-200"
        />
      </div>

      {/* Botones */}
      <div className="flex justify-end gap-4">
        <button
          type="button"
          onClick={() => router.push("/dashboard/invoices")}
          className="rounded-lg bg-gray-200 px-4 py-2 text-sm text-gray-600 hover:bg-gray-300"
        >
          Cancel
        </button>
        <button
          type="submit"
          className="rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700"
        >
          Create Invoice
        </button>
      </div>
    </form>
  );
}
