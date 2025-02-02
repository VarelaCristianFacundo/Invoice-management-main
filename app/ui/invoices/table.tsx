"use client";

import { Invoice } from "@/app/lib/definitions";
import { formatCurrency, formatDateToLocal } from "@/app/lib/utils";
import { DeleteInvoice, UpdateInvoice } from "@/app/ui/invoices/buttons";
import InvoiceStatus from "@/app/ui/invoices/status";
import { DocumentTextIcon, EyeIcon } from "@heroicons/react/24/outline";
import Image from "next/image";
import { useEffect, useState } from "react";
import { InvoiceDetailsModal } from "./InvoiceDetailsModal";

export default function InvoicesTable({
  query,
  currentPage,
}: {
  query: string;
  currentPage: number;
}) {
  const [invoices, setInvoices] = useState<Invoice[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [selectedCompany, setSelectedCompany] = useState<number>(1); // Default: CAMARCO
  const [selectedInvoice, setSelectedInvoice] = useState<Invoice | null>(null); // Estado para el modal

  // Función para cargar facturas
  const loadInvoices = async () => {
    setLoading(true);
    try {
      const res = await fetch(
        `/api/invoices?query=${encodeURIComponent(
          query,
        )}&currentPage=${currentPage}&companyId=${selectedCompany}`,
      );
      const data = await res.json();
      setInvoices(data);
    } catch (error) {
      console.error("Error fetching invoices:", error);
    } finally {
      setLoading(false);
    }
  };

  // Cargar facturas al cambiar el query, la página o la empresa seleccionada
  useEffect(() => {
    loadInvoices();
  }, [query, currentPage, selectedCompany]);

  return (
    <div className="p-6 bg-gray-100 rounded-md shadow-md">
      <h2 className="text-lg font-semibold mb-4">Facturas por Compañía</h2>

      {/* Botonera para seleccionar la empresa */}
      <div className="flex gap-4 mb-4">
        <button
          className={`px-4 py-2 rounded ${selectedCompany === 1 ? "bg-gray-800 text-white" : "bg-gray-300"
            }`}
          onClick={() => setSelectedCompany(1)}
        >
          CAMARCO
        </button>
        <button
          className={`px-4 py-2 rounded ${selectedCompany === 2 ? "bg-gray-800 text-white" : "bg-gray-300"
            }`}
          onClick={() => setSelectedCompany(2)}
        >
          FODECO
        </button>
      </div>

      {/* Tabla de facturas */}
      <div className="overflow-x-auto bg-white rounded-md shadow">
        {loading ? (
          <p className="p-4">Cargando facturas...</p>
        ) : invoices.length === 0 ? (
          <p className="p-4">No se encontraron facturas.</p>
        ) : (
          <table className="min-w-full text-sm">
            <thead className="bg-gray-200 text-left">
              <tr>
                <th className="px-4 py-2">Proveedor</th>
                <th className="px-4 py-2">Área - Programa - Proyecto</th>
                <th className="px-4 py-2">Cantidad</th>
                <th className="px-4 py-2">Fecha</th>
                <th className="px-4 py-2">Estado</th>
                <th className="px-4 py-2">Archivo</th>
                <th className="px-4 py-2"></th>
              </tr>
            </thead>
            <tbody>
              {invoices.map((invoice) => (
                <tr key={invoice.id}>
                  <td className="px-4 py-2">
                    <div className="flex items-center gap-2">
                      <Image
                        src={invoice.image_url}
                        alt={invoice.name}
                        width={28}
                        height={28}
                        className="rounded-full"
                      />
                      {invoice.name}
                    </div>
                  </td>
                  <td className="px-4 py-2">
                    {invoice.area_name && invoice.program && invoice.project_name
                      ? `${invoice.area_name} - ${invoice.program} - ${invoice.project_name}`
                      : "N/A"}
                  </td>
                  <td className="px-4 py-2">{formatCurrency(invoice.amount)}</td>
                  <td className="px-4 py-2">{formatDateToLocal(invoice.date)}</td>
                  <td className="px-4 py-2">
                    <InvoiceStatus status={invoice.status} />
                  </td>
                  <td className="px-4 py-2">
                    {invoice.file ? (
                      <a
                        href={invoice.file}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="flex items-center text-blue-600 hover:underline"
                      >
                        <DocumentTextIcon className="h-5 w-5 mr-1" />
                        Ver PDF
                      </a>
                    ) : (
                      <span className="text-xs text-gray-400">
                        Ningún archivo
                      </span>
                    )}
                  </td>
                  <td className="px-4 py-2 flex gap-2 justify-end">
                    <button
                      onClick={() => setSelectedInvoice(invoice)}
                      className="rounded-md border p-2 hover:bg-gray-100 text-blue-500 hover:text-blue-700"

                    // className="flex items-center gap-1 "
                    >
                      <EyeIcon className="h-5 w-5" />
                    </button>
                    <UpdateInvoice id={invoice.id} />
                    <DeleteInvoice id={invoice.id} refreshInvoices={loadInvoices} />
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>
      {selectedInvoice && (
        <InvoiceDetailsModal
          invoice={selectedInvoice}
          onClose={() => setSelectedInvoice(null)}
        />
      )}
    </div>
  );
}
