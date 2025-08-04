"use client";

import { updateInvoice } from "@/app/lib/actions";
import { CustomerField, InvoiceForm } from "@/app/lib/definitions";
import { Button } from "@/app/ui/button";
import { CurrencyDollarIcon, UserCircleIcon } from "@heroicons/react/24/outline";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { useState } from "react";
import Swal from "sweetalert2";
import "sweetalert2/dist/sweetalert2.min.css";
import CustomAutocompleteContableItem, { ContableItem } from "./custom-autocomplete-contable-item";

// Función auxiliar para convertir archivo a base64
async function fileToBase64(file: File): Promise<string> {
  return new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = () => resolve(reader.result as string);
    reader.onerror = (error) => reject(error);
  });
}

export default function EditInvoiceForm({ invoice, customers }: { invoice: InvoiceForm; customers: CustomerField[] }) {
  const router = useRouter();
  // El estado "currentFile" se inicializa con el PDF actual de la DB
  const [currentFile, setCurrentFile] = useState<string>(invoice.file || "");
  // Estado para guardar un nuevo archivo si se selecciona
  const [newFile, setNewFile] = useState<File | null>(null);
  const [contableItem, setContableItem] = useState<ContableItem | null>(
    invoice.contable_item || null
  );


  const [invoiceNumber, setInvoiceNumber] = useState(invoice.invoice_number || '');
  const [invoiceNumberError, setInvoiceNumberError] = useState('');
  const [issueDate, setIssueDate] = useState(
    invoice.issue_date
      ? typeof invoice.issue_date === 'string'
        ? invoice.issue_date.slice(0, 10)
        : new Date(invoice.issue_date).toISOString().slice(0, 10)
      : ''
  );


  const handlePdfChange = async (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files && e.target.files.length > 0) {
      const file = e.target.files[0];
      setNewFile(file);
      try {
        const base64 = await fileToBase64(file);
        // Actualizamos currentFile con el nuevo valor si se selecciona
        setCurrentFile(base64);
      } catch (error) {
        console.error("Error converting file", error);
      }
    }
  };

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    // Creamos el FormData del formulario
    const formData = new FormData(event.currentTarget);
    // Si no se seleccionó un nuevo archivo, se enviará el valor en el campo oculto 'oldPdfFile'
    // que ya fue precargado en el formulario.
    // (Si se selecciona un nuevo archivo, la lógica del backend usará ese valor)
    if (!invoiceNumber || !/^\d{5}-\d{8}$/.test(invoiceNumber)) {
      setInvoiceNumberError('El número debe ser 5 dígitos, guion, 8 dígitos. Ej: 00001-00001234');
      return;
    }
    setInvoiceNumberError('');
    if (!issueDate) {
      Swal.fire("Incomplete", "Debes ingresar la fecha de emisión.", "info");
      return;
    }

    try {
      const result = await Swal.fire({
        title: "Confirmar Actualización",
        text: "¿Está seguro de que desea actualizar esta factura?",
        icon: "question",
        showCancelButton: true,
        confirmButtonColor: "#1F2937",

        confirmButtonText: "Sí, actualizarla",
        cancelButtonText: "Cancelar",
      });
      if (!result.isConfirmed) return;

      const response = await updateInvoice(invoice.id, formData);
      if (!response.success) throw new Error(response.message);
      await Swal.fire("Actualizada!", "La factura fue actualizada con éxito.", "success");
      router.refresh();
      router.push("/dashboard/invoices");
    } catch (error: any) {
      console.error(error);
      await Swal.fire("Error!", error.message || "Falló la actualización de la factura.", "error");
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <div className="rounded-md bg-gray-50 p-4 md:p-6">
        {/* Customer Name */}
        <div className="mb-4">
          <label htmlFor="customer" className="mb-2 block text-sm font-medium">
            Choose customer
          </label>
          <div className="relative">
            <select
              id="customer"
              name="customerId"
              className="peer block w-full cursor-pointer rounded-md border border-gray-200 py-2 pl-10 text-sm"
              defaultValue={invoice.customer_id}
              required
            >
              <option value="" disabled>
                Seleccionar un Proveedor
              </option>
              {customers.map((customer) => (
                <option key={customer.id} value={customer.id}>
                  {customer.name}
                </option>
              ))}
            </select>
            <UserCircleIcon className="pointer-events-none absolute left-3 top-1/2 h-[18px] w-[18px] -translate-y-1/2 text-gray-500" />
          </div>
        </div>

        {/* Invoice Amount */}
        <div className="mb-4">
          <label htmlFor="amount" className="mb-2 block text-sm font-medium">
            Choose an amount
          </label>
          <div className="relative mt-2 rounded-md">
            <div className="relative">
              <input
                id="amount"
                name="amount"
                type="number"
                step="0.01"
                defaultValue={invoice.amount}
                placeholder="Enter USD amount"
                className="peer block w-full rounded-md border border-gray-200 py-2 pl-10 text-sm"
                required
              />
              <CurrencyDollarIcon className="pointer-events-none absolute left-3 top-1/2 h-[18px] w-[18px] -translate-y-1/2 text-gray-500" />
            </div>
          </div>
        </div>

        {/* Invoice Status */}
        <fieldset>
          <legend className="mb-2 block text-sm font-medium">
            Set the invoice status
          </legend>
          <div className="rounded-md border border-gray-200 bg-white px-[14px] py-3">
            <div className="flex gap-4">
              {["presentado", "aprobado", "pagado", "rechazado"].map((stat) => (
                <div key={stat} className="flex items-center">
                  <input
                    id={stat}
                    name="status"
                    type="radio"
                    value={stat}
                    defaultChecked={invoice.status === stat}
                    className="h-4 w-4 cursor-pointer border-gray-300 bg-gray-100 text-gray-600 focus:ring-2"
                  />
                  <label
                    htmlFor={stat}
                    className="ml-2 flex cursor-pointer items-center gap-1.5 rounded-full px-3 py-1.5 text-xs font-medium"
                  >
                    {stat.charAt(0).toUpperCase() + stat.slice(1)}
                  </label>
                </div>
              ))}
            </div>
          </div>
        </fieldset>

        {/* Número de Factura (ARCA) */}
        <div className="mb-4">
          <label htmlFor="invoice_number" className="mb-2 block text-sm font-medium">
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

        {/* Fecha de Emisión */}
        <div className="mb-4">
          <label htmlFor="issue_date" className="mb-2 block text-sm font-medium">
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
        <input
          type="hidden"
          name="contable_item_id"
          value={contableItem?.id || ""}
        />


        {/* Observaciones */}
        <div className="mb-4">
          <label htmlFor="observations" className="mb-2 block text-sm font-medium">
            Observaciones
          </label>
          <textarea
            id="observations"
            name="observations"
            defaultValue={invoice.observations || ''}
            rows={3}
            className="block w-full rounded-md border border-gray-200 py-2 px-3 text-sm"
            placeholder="Actualiza las observaciones si es necesario..."
          ></textarea>
        </div>

        {/* Input File para el PDF */}
        <div className="mb-4">
          <label htmlFor="pdfFile" className="mb-2 block text-sm font-medium">
            Cargar PDF <span className="text-red-500">*</span>
          </label>
          <input
            id="pdfFile"
            name="pdfFile"
            type="file"
            accept="application/pdf"
            onChange={handlePdfChange}
            required
            className="block w-full text-sm text-gray-500 file:mr-4 file:rounded-full file:border-0 file:bg-gray-100 file:py-2 file:px-4 file:text-sm file:font-semibold hover:file:bg-gray-200"
          />
          {currentFile && !newFile && (
            <p className="mt-1 text-xs text-gray-500">
              A current file exists. If you do not select a new file, the existing file will be kept.
            </p>
          )}
          {/* Campo oculto para enviar el PDF actual */}
          <input type="hidden" name="oldPdfFile" value={currentFile} />
        </div>
      </div>
      <div className="mt-6 flex justify-end gap-4">
        <Link
          href="/dashboard/invoices"
          className="flex h-10 items-center rounded-lg bg-gray-100 px-4 text-sm font-medium text-gray-600 hover:bg-gray-200"
        >
          Cancelar
        </Link>
        <Button type="submit">Editar Factura</Button>
      </div>
    </form>
  );
}
