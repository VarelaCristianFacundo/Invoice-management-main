"use client";

import { createInvoice } from "@/app/lib/actions";
import { normalizeMoneyInput, formatMoneyForDisplay, sanitizeMoneyInput } from "@/app/lib/money-utils";
import { useRouter } from "next/navigation";
import { FormEvent, useEffect, useState } from "react";
import Swal from "sweetalert2";
import "sweetalert2/dist/sweetalert2.min.css";
import CreateProviderModal from "./create-provider-modal";
import CustomAutocompleteContableItem, { ContableItem } from "./custom-autocomplete-contable-item";

// Actualizá el tipo para incluir company_id
type CustomerField = {
  id: string;
  name: string;
  cuit_cuil: string;
  company_id: number;
};

type BudgetAllocationItem = {
  id: string;
  project_name: string;
  area_id: string;
  area_name: string;
  year: number;
  company_id: number;
};

export default function CreateInvoiceForm({
  customers,
  userRole,
  userAreaId,
}: {
  customers: CustomerField[];
  userRole: string;
  userAreaId: string | null;
}) {
  const [budgetAllocations, setBudgetAllocations] = useState<BudgetAllocationItem[]>([]);
  const [customerList, setCustomerList] = useState(customers);

  // Para el autocomplete, mantenemos dos estados:
  const [customerInput, setCustomerInput] = useState("");
  const [customerId, setCustomerId] = useState("");
  // Nuevo estado para guardar el company_id del proveedor seleccionado
  const [selectedCompanyId, setSelectedCompanyId] = useState<number | null>(null);
  const [invoiceNumber, setInvoiceNumber] = useState('');
  const [invoiceNumberError, setInvoiceNumberError] = useState('');
  const [issueDate, setIssueDate] = useState('');
  const [amount, setAmount] = useState<number>(0);
  const [displayAmount, setDisplayAmount] = useState<string>("");
  // Siempre se crea en estado "presentado"
  const invoiceStatus: "presentado" | "aprobado" | "pagado" | "rechazado" = "presentado";
  const [selectedAllocationId, setSelectedAllocationId] = useState("");
  const [areaId, setAreaId] = useState("");
  const [year, setYear] = useState<number>(new Date().getFullYear());
  const [pdfFile, setPdfFile] = useState<File | null>(null);
  const router = useRouter();
  const [contableItem, setContableItem] = useState<ContableItem | null>(null);
  const [showAllCustomers, setShowAllCustomers] = useState(false);

  function isValidInvoiceNumber(num: string) {
    return /^\d{5}-\d{8}$/.test(num);
  }
  
  // Determinar si el usuario está limitado a su área
  const isAreaUser = userRole?.startsWith('usuario_') && 
                      userRole !== 'usuario' && 
                      userRole !== 'usuario_presupuestos' &&
                      userRole !== 'usuario_contable';
  
  // Cargar allocations
  useEffect(() => {
    async function fetchBudgetAllocations() {
      try {
        const res = await fetch("/api/budget-allocations");
        if (!res.ok) throw new Error("Error al obtener asignaciones de presupuesto");
        const data: BudgetAllocationItem[] = await res.json();
        
        // Filtrar por área si el usuario está limitado
        const filteredData = isAreaUser && userAreaId 
          ? data.filter(item => item.area_id === userAreaId)
          : data;
        
        setBudgetAllocations(filteredData);
      } catch (error) {
        console.error(error);
        Swal.fire("Error", "No se pudieron obtener las asignaciones de presupuesto.", "error");
      }
    }
    fetchBudgetAllocations();
  }, [isAreaUser, userAreaId]);

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

  function formatInvoiceNumber(raw: string) {
    // Remove spaces
    const cleaned = raw.replace(/\s/g, '');
    if (!cleaned.includes('-')) return cleaned;

    const [rawPrefix, rawNumber] = cleaned.split('-');
    if (!rawPrefix || !rawNumber) return cleaned;

    const prefix = rawPrefix.padStart(5, '0').slice(-5);
    const number = rawNumber.padStart(8, '0').slice(-8);

    return `${prefix}-${number}`;
  }

  async function checkInvoiceNumberDuplicate(
    formattedNumber: string,
  ): Promise<boolean> {
    if (!formattedNumber || !customerId) return false;

    try {
      const res = await fetch(
        `/api/invoices/check-number?invoice_number=${encodeURIComponent(
          formattedNumber,
        )}&customerId=${encodeURIComponent(customerId)}`,
      );
      if (!res.ok) return false;

      const data = await res.json();
      if (data.exists) {
        setInvoiceNumberError('Factura cargada previamente para este proveedor.');
        return true;
      }

      return false;
    } catch (error) {
      console.error('Error checking invoice number:', error);
      // En error de red no bloqueamos, solo no marcamos duplicado
      return false;
    }
  }


  function fileToBase64(file: File): Promise<string> {
    return new Promise((resolve, reject) => {
      const reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = () => resolve(reader.result as string);
      reader.onerror = (error) => reject(error);
    });
  }

  const filteredCustomers =
    customerId  // Si hay algo seleccionado, no mostrar dropdown
      ? []
      : showAllCustomers
        ? customerList
        : customerInput.length >= 3
          ? customerList.filter((c) =>
            c.name.toLowerCase().includes(customerInput.toLowerCase()) ||
            (c.cuit_cuil && c.cuit_cuil.includes(customerInput)),
          )
          : [];


  const handleCustomerSelect = (selected: CustomerField) => {
    const companyName = selected.company_id === 1 ? 'CAMARCO' : 'FODECO';
    const displayName = `${selected.name} (${companyName})`;
    setCustomerInput(displayName);
    setCustomerId(selected.id);
    setSelectedCompanyId(selected.company_id);
    setShowAllCustomers(false);

    // Al seleccionar un proveedor, si ya hay una allocation seleccionada
    // pero es de otra empresa, la limpiamos.
    if (selectedAllocationId) {
      const currentAlloc = budgetAllocations.find(a => a.id === selectedAllocationId);
      if (currentAlloc && currentAlloc.company_id !== selected.company_id) {
        setSelectedAllocationId("");
      }
    }
  };

  const handleProviderCreated = async () => {
    // Refrescar la lista de clientes desde la API
    try {
      const response = await fetch('/api/customers');
      if (response.ok) {
        const newCustomers = await response.json();
        setCustomerList(newCustomers);
      }
    } catch (error) {
      console.error('Error refreshing customer list:', error);
    }
  };

  const handleSubmit = async (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    const formattedInvoiceNumber = formatInvoiceNumber(invoiceNumber);
    setInvoiceNumber(formattedInvoiceNumber);

    if (!isValidInvoiceNumber(formattedInvoiceNumber)) {
      setInvoiceNumberError(
        'El número debe ser 5 dígitos, guion, 8 dígitos. Ej: 00001-00001234',
      );
      return;
    }
    setInvoiceNumberError('');

    const isDuplicate = await checkInvoiceNumberDuplicate(
      formattedInvoiceNumber,
    );
    if (isDuplicate) {
      Swal.fire('Error', 'Factura cargada previamente.', 'error');
      return;
    }

    if (!issueDate) {
      Swal.fire('Incomplete', 'Debes ingresar la fecha de emisión.', 'info');
      return;
    }


    if (!invoiceNumber || !isValidInvoiceNumber(invoiceNumber)) {
      setInvoiceNumberError('El número debe ser 5 dígitos, guion, 8 dígitos. Ej: 00001-00001234');
      return;
    }
    setInvoiceNumberError('');
    if (!issueDate) {
      Swal.fire("Incomplete", "Debes ingresar la fecha de emisión.", "info");
      return;
    }

    if (!customerId || !selectedAllocationId) {
      Swal.fire("Incomplete", "Selecciona proveedor y proyecto/área", "info");
      return;
    }
    if (amount <= 0) {
      Swal.fire("Incomplete", "El monto debe ser mayor a 0", "info");
      return;
    }

    if (!pdfFile) {
      Swal.fire("Incomplete", "El PDF es obligatorio para crear la factura.", "info");
      return;
    }

    let base64File = "";
    if (pdfFile) {
      base64File = await fileToBase64(pdfFile);
    }

    // Find the allocation based on the selected allocation id
    const allocation = budgetAllocations.find(ba => ba.id === selectedAllocationId);
    if (!allocation) {
      Swal.fire("Error", "No se encontró la budgetAllocation seleccionada", "error");
      return;
    }

    // Extract the company_id from the allocation
    const companyId = allocation.company_id;

    const formDataObj = {
      customerId,
      amount,
      status: invoiceStatus,
      areaId,
      year,
      budgetAllocationId: selectedAllocationId,
      file: base64File,
      company_id: companyId,
      observations: (e.target as any).observations?.value || '',
      invoice_number: formattedInvoiceNumber,
      issue_date: issueDate,
      contable_item_id: contableItem?.id,
    };



    const confirmation = await Swal.fire({
      title: "Confirmar Creación",
      text: "¿Está seguro de que desea crear esta factura?",
      icon: "question",
      showCancelButton: true,
      confirmButtonText: "Sí, crearla",
      confirmButtonColor: "#3085d6",
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
      Swal.fire("Error", error.message || "No se pudo crear la factura", "error");
    }
  };


  return (
    <form onSubmit={handleSubmit} className="space-y-6 rounded-md bg-gray-50 p-4 md:p-6">
      {/* Autocomplete para Customer */}
      <div>
        <label htmlFor="customerInput" className="mb-2 block text-sm font-medium">
          Elegir Proveedor (por nombre o CUIT/CUIL)
        </label>

        <div className="flex gap-2">
          <input
            type="text"
            id="customerInput"
            name="customerInput"
            value={customerInput}
            onChange={(e) => {
              setCustomerInput(e.target.value);
              setCustomerId("");            // limpiamos selección
              setSelectedCompanyId(null);   // limpiamos company_id
              setShowAllCustomers(false);   // salimos del modo "Ver lista"
            }}
            placeholder="Empieza a escribir..."
            className="flex-1 rounded-md border border-gray-200 py-2 px-3 text-sm"
            autoComplete="off"
          />

          <button
            type="button"
            onClick={() => {
              setShowAllCustomers((prev) => !prev);
              if (!showAllCustomers) {
                // al abrir la lista completa no filtramos por el input
                setCustomerInput("");
                setCustomerId("");
                setSelectedCompanyId(null);
              }
            }}
            className="rounded-lg bg-gray-800 px-3 py-2 text-xs font-medium text-white hover:bg-gray-700"
          >
            {showAllCustomers ? "Ocultar lista" : "Ver lista"}
          </button>

          <CreateProviderModal
            companyId={selectedCompanyId || 1}
            onProviderCreated={handleProviderCreated}
          />
        </div>

        {(showAllCustomers || customerInput.length >= 3) && filteredCustomers.length > 0 && (
          <ul className="border border-gray-200 rounded-md bg-white mt-1 max-h-60 overflow-y-auto">
            {filteredCustomers.map((customer) => (
              <li
                key={customer.id}
                className="p-2 cursor-pointer hover:bg-gray-100 text-sm"
                onClick={() => handleCustomerSelect(customer)}
              >
                {customer.name} — {customer.cuit_cuil} {customer.company_id === 1 ? '(CAMARCO)' : '(FODECO)'}
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
          {budgetAllocations
            .filter(alloc => !selectedCompanyId || alloc.company_id === selectedCompanyId)
            .map((alloc) => (
              <option key={alloc.id} value={alloc.id}>
                {`${alloc.project_name} - ${alloc.area_name} (Año ${alloc.year})`}
              </option>
            ))}
        </select>
        {!selectedCompanyId && (
          <p className="mt-1 text-xs text-orange-600">
            * Selecciona primero un proveedor para ver sus proyectos correspondientes.
          </p>
        )}
      </div>

      {/* Monto */}
      <div>
        <label htmlFor="amount" className="mb-2 block text-sm font-medium">
          Monto
        </label>
        <input
          id="amount"
          name="amount"
          type="text"
          inputMode="decimal"
          className="block w-full rounded-md border border-gray-200 py-2 px-3 text-sm"
          value={displayAmount}
          onChange={(e) => {
            const sanitized = sanitizeMoneyInput(e.target.value);
            setDisplayAmount(sanitized);
            
            const normalized = normalizeMoneyInput(sanitized);
            setAmount(normalized ? parseFloat(normalized) : 0);
          }}
          onBlur={() => {
            // Al perder foco, damos formato amigable
            if (amount > 0) {
              setDisplayAmount(formatMoneyForDisplay(amount));
            }
          }}
          onFocus={() => {
            // Removemos el formato al hacer foco para evitar que el cursor salte
            setDisplayAmount(sanitizeMoneyInput(displayAmount));
          }}
          required
          placeholder="Ej: 1000,00 o 1000.00"
        />
        <p className="mt-1 text-xs text-gray-500">
          Puedes usar &quot;,&quot; o &quot;.&quot; como separador decimal (ej: 1000,50 o 1000.50)
        </p>
      </div>

      {/* Número de Factura (ARCA) */}
      <div>
        <label htmlFor="invoiceNumber" className="mb-2 block text-sm font-medium">
          Número de Factura (ARCA) <span className="text-red-500">*</span>
        </label>
        <input
          id="invoice_number"
          name="invoice_number"
          type="text"
          value={invoiceNumber}
          onChange={e => {
            setInvoiceNumber(e.target.value);
            setInvoiceNumberError('');
          }}
          onBlur={async () => {
            if (!invoiceNumber) return;

            const formatted = formatInvoiceNumber(invoiceNumber);
            setInvoiceNumber(formatted);

            if (!isValidInvoiceNumber(formatted)) {
              setInvoiceNumberError(
                'El número debe ser 5 dígitos, guion, 8 dígitos. Ej: 00001-00001234',
              );
              return;
            }

            await checkInvoiceNumberDuplicate(formatted);
          }}
          placeholder="00001-00001234"
          className="block w-full rounded-md border border-gray-200 py-2 px-3 text-sm"
          required
          maxLength={14}
          pattern="\d{5}-\d{8}"
        />

        {invoiceNumberError && (
          <p className="mt-2 text-sm text-red-500">{invoiceNumberError}</p>
        )}
      </div>

      <div className="grid gap-2">
        <label className="text-sm font-medium">Fecha de ingreso</label>
        <input
          type="text"
          value={new Date().toLocaleDateString('es-AR')}
          readOnly
          className="rounded-md border px-3 py-2 bg-gray-50 text-gray-600"
          aria-readonly
        />
      </div>

      {/* Fecha de Emisión */}
      <div>
        <label htmlFor="issueDate" className="mb-2 block text-sm font-medium">
          Fecha de Emisión <span className="text-red-500">*</span>
        </label>
        <input
          id="issue_date"
          name="issue_date"
          type="date"
          value={issueDate}
          onChange={e => setIssueDate(e.target.value)}
          className="block w-full rounded-md border border-gray-200 py-2 px-3 text-sm"
          required
          max={new Date().toISOString().split('T')[0]}
        />
      </div>

      <CustomAutocompleteContableItem
        value={contableItem}
        onContableSelected={(item) => setContableItem(item)}
      />

      {/* Observaciones */}
      <div>
        <label htmlFor="observations" className="mb-2 block text-sm font-medium">
          Observaciones (Opcional)
        </label>
        <textarea
          id="observations"
          name="observations"
          rows={3}
          className="block w-full rounded-md border border-gray-200 py-2 px-3 text-sm"
          placeholder="Escribe aquí cualquier observación sobre la factura..."
        ></textarea>
      </div>

      {/* Archivo (PDF o imagen) */}
      <div>
        <label htmlFor="pdfFile" className="mb-2 block text-sm font-medium">
          Cargar archivo (PDF o imagen) <span className="text-red-500">*</span>
        </label>
        <input
          id="pdfFile"
          name="pdfFile"
          type="file"
          accept="application/pdf,image/png,image/jpeg,image/jpg,image/webp"
          onChange={handlePdfChange}
          required
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
          className="rounded-lg bg-gray-800 px-4 py-2 text-sm font-medium text-white hover:bg-gray-700"
        >
          Crear Factura
        </button>
      </div>
    </form>
  );
}
