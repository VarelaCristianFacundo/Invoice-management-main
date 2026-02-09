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

/**
 * Normalizes money input so users can type:
 * - "13213,21" or "13213.21"
 * - "1.234,56" or "1,234.56"
 * And we always submit a backend-friendly number string with "." as decimal separator.
 */
function normalizeMoneyInput(raw: string): string {
  const value = raw.trim().replace(/\s+/g, '');
  if (!value) return '';

  const hasComma = value.includes(',');
  const hasDot = value.includes('.');

  // If both separators exist, assume the last one is the decimal separator.
  if (hasComma && hasDot) {
    const lastComma = value.lastIndexOf(',');
    const lastDot = value.lastIndexOf('.');

    const decimalSep = lastComma > lastDot ? ',' : '.';
    const thousandsSep = decimalSep === ',' ? '.' : ',';

    const noThousands = value.split(thousandsSep).join('');
    return decimalSep === ',' ? noThousands.replace(',', '.') : noThousands;
  }

  // Only comma: treat it as decimal separator.
  if (hasComma) return value.replace(',', '.');

  // Only dot or none: already OK.
  return value;
}

/**
 * Formats a number/string to a nice money display (2 decimals, comma decimal for ES UI).
 * This is only for display; submission uses normalizeMoneyInput().
 */
function formatMoneyForDisplay(value: unknown): string {
  if (value === null || value === undefined) return '';
  const str = String(value).trim();
  if (!str) return '';

  const normalized = normalizeMoneyInput(str);
  const n = Number(normalized);
  if (!Number.isFinite(n)) return str;

  return n.toFixed(2).replace('.', ',');
}

/**
 * Sanitizes money input to only allow digits, comma, and dot.
 * Prevents multiple separators and ensures valid format.
 */
function sanitizeMoneyInput(raw: string): string {
  // Only allow digits, comma, and dot
  let sanitized = raw.replace(/[^\d,.]/g, '');

  // Limit commas to 1
  const commaCount = (sanitized.match(/,/g) || []).length;
  if (commaCount > 1) {
    sanitized = sanitized.replace(/,/g, '');
    // Keep the last comma position if needed
    const lastCommaIndex = raw.lastIndexOf(',');
    if (lastCommaIndex !== -1) {
      const beforeComma = sanitized.substring(0, Math.max(0, sanitized.length - 2));
      const afterComma = sanitized.substring(Math.max(0, sanitized.length - 2));
      sanitized = beforeComma + ',' + afterComma;
    }
  }

  // Limit dots to 1
  const dotCount = (sanitized.match(/\./g) || []).length;
  if (dotCount > 1) {
    sanitized = sanitized.replace(/\./g, '');
    // Keep the last dot position if needed
    const lastDotIndex = raw.lastIndexOf('.');
    if (lastDotIndex !== -1) {
      const beforeDot = sanitized.substring(0, Math.max(0, sanitized.length - 2));
      const afterDot = sanitized.substring(Math.max(0, sanitized.length - 2));
      sanitized = beforeDot + '.' + afterDot;
    }
  }

  return sanitized;
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

  function formatInvoiceNumber(raw: string) {
    const cleaned = raw.replace(/\s/g, '');
    if (!cleaned.includes('-')) return cleaned;

    const [rawPrefix, rawNumber] = cleaned.split('-');
    if (!rawPrefix || !rawNumber) return cleaned;

    const prefix = rawPrefix.padStart(5, '0').slice(-5);
    const number = rawNumber.padStart(8, '0').slice(-8);

    return `${prefix}-${number}`;
  }

  function isValidInvoiceNumber(num: string) {
    return /^\d{5}-\d{8}$/.test(num);
  }

  async function checkInvoiceNumberDuplicate(
    formattedNumber: string,
  ): Promise<boolean> {
    if (!formattedNumber) return false;

    try {
      const res = await fetch(
        `/api/invoices/check-number?invoice_number=${encodeURIComponent(
          formattedNumber,
        )}&excludeId=${encodeURIComponent(invoice.id)}`,
      );
      if (!res.ok) return false;

      const data = await res.json();
      if (data.exists) {
        setInvoiceNumberError('Factura cargada previamente.');
        return true;
      }

      return false;
    } catch (error) {
      console.error('Error checking invoice number:', error);
      return false;
    }
  }



  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();

    const formElement = event.currentTarget;
    const formData = new FormData(formElement);

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
      await Swal.fire('Error!', 'Factura cargada previamente.', 'error');
      return;
    }

    if (!issueDate) {
      Swal.fire('Incomplete', 'Debes ingresar la fecha de emisión.', 'info');
      return;
    }

    // Normalize amount to support both comma and dot as decimal separator
    const amountRaw = String(formData.get('amount') ?? '');
    formData.set('amount', normalizeMoneyInput(amountRaw));

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
            Elija un proveedor
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
            Elija un monto
          </label>
          <div className="relative mt-2 rounded-md">
            <div className="relative">
              <input
                id="amount"
                name="amount"
                type="text"
                inputMode="decimal"
                defaultValue={formatMoneyForDisplay(invoice.amount)}
                placeholder="Ej: 1000,00 o 1000.00"
                className="peer block w-full rounded-md border border-gray-200 py-2 pl-10 text-sm"
                onChange={(e) => {
                  const sanitized = sanitizeMoneyInput(e.currentTarget.value);
                  e.currentTarget.value = sanitized;
                }}
                required
              />
              <CurrencyDollarIcon className="pointer-events-none absolute left-3 top-1/2 h-[18px] w-[18px] -translate-y-1/2 text-gray-500" />
            </div>
          </div>
          <p className="mt-1 text-xs text-gray-500">
            Puedes usar &quot;,&quot; o &quot;.&quot; como separador decimal (ej: 1000,50 o 1000.50)
          </p>
        </div>

        {/* Invoice Status */}
        <fieldset>
          <legend className="mb-2 block text-sm font-medium">
            Elija el estado de la factura
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
            className="block w-full text-sm text-gray-500 file:mr-4 file:rounded-full file:border-0 file:bg-gray-100 file:py-2 file:px-4 file:text-sm file:font-semibold hover:file:bg-gray-200"
          />
          {currentFile && !newFile && (
            <p className="mt-1 text-xs text-gray-500">
              Existe un archivo actual. Si no selecciona uno nuevo, se conservará el existente.
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
