"use client";

import { Invoice } from "@/app/lib/definitions";
import { formatCurrency, formatDateToLocal } from "@/app/lib/utils";
import { DeleteInvoice, UpdateInvoice } from "@/app/ui/invoices/buttons";
import InvoiceStatus from "@/app/ui/invoices/status";
import { DocumentTextIcon, EyeIcon } from "@heroicons/react/24/outline";
import { useSession } from "next-auth/react";
import Image from "next/image";
import { useEffect, useState } from "react";
import { InvoiceDetailsModal } from "./InvoiceDetailsModal";
import ExportExcelButton from "./export-excel-button";

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
  const [selectedInvoice, setSelectedInvoice] = useState<Invoice | null>(null);

  const { data: session } = useSession();
  const isAdmin = session?.user?.role === "admin";

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

  useEffect(() => {
    loadInvoices();
  }, [query, currentPage, selectedCompany]);

  // Helper para saber si el PDF es realmente válido (no solo el prefijo)
  const hasValidPdf = (file?: string | null) => {
    if (!file) return false;
    const prefix = "data:application/pdf;base64,";
    return file.startsWith(prefix) && file.length > prefix.length;
  };

  return (
    <div className="p-6 bg-gray-100 rounded-md shadow-md">
      <div className="flex justify-between items-center mb-4">
        <h2 className="text-lg font-semibold">Facturas por Compañía</h2>
        <ExportExcelButton />
      </div>

      <div className="flex gap-4 mb-4">
        <button
          className={`px-4 py-2 rounded ${selectedCompany === 1
              ? "bg-gray-800 text-white"
              : "bg-gray-300"
            }`}
          onClick={() => setSelectedCompany(1)}
        >
          CAMARCO
        </button>
        <button
          className={`px-4 py-2 rounded ${selectedCompany === 2
              ? "bg-gray-800 text-white"
              : "bg-gray-300"
            }`}
          onClick={() => setSelectedCompany(2)}
        >
          FODECO
        </button>
      </div>

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
                    {invoice.area_name &&
                      invoice.program &&
                      invoice.project_name
                      ? `${invoice.area_name} - ${invoice.program} - ${invoice.project_name}`
                      : "N/A"}
                  </td>
                  <td className="px-4 py-2">
                    {formatCurrency(invoice.amount)}
                  </td>
                  <td className="px-4 py-2">
                    {formatDateToLocal(invoice.date)}
                  </td>
                  <td className="px-4 py-2">
                    <InvoiceStatus status={invoice.status} />
                  </td>
                  <td className="px-4 py-2">
                    {hasValidPdf(invoice.file) ? (
                      <a
                        href={`/api/invoices/${invoice.id}/file`}
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
                    >
                      <EyeIcon className="h-5 w-5" />
                    </button>

                    {isAdmin && (
                      <>
                        <UpdateInvoice id={invoice.id} />
                        <DeleteInvoice
                          id={invoice.id}
                          refreshInvoices={loadInvoices}
                        />
                      </>
                    )}
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
