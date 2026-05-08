"use client";

import { Invoice } from "@/app/lib/definitions";
import { formatCurrency, formatDateToLocal } from "@/app/lib/utils";
import { DeleteInvoice, UpdateInvoice } from "@/app/ui/invoices/buttons";
import InvoiceStatus from "@/app/ui/invoices/status";
import { DocumentTextIcon, EyeIcon } from "@heroicons/react/24/outline";
import { useSession } from "next-auth/react";
import Image from "next/image";
import { useEffect, useMemo, useState } from "react";
import { InvoiceDetailsModal } from "./InvoiceDetailsModal";
import ExportExcelButton from "./export-excel-button";

type SortDir = "asc" | "desc";
type SortKey = "supplier" | "project" | "amount" | "date" | "status";

export default function InvoicesTable({
  query,
  currentPage,
  userAreaId,
}: {
  query: string;
  currentPage: number;
  userAreaId?: string | null;
}) {
  const [invoices, setInvoices] = useState<Invoice[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [selectedCompany, setSelectedCompany] = useState<number>(1); // Default: CAMARCO
  const [selectedInvoice, setSelectedInvoice] = useState<Invoice | null>(null);

  const [sortKey, setSortKey] = useState<SortKey>("date");
  const [sortDir, setSortDir] = useState<SortDir>("desc");

  const { data: session } = useSession();
  const isAdmin = session?.user?.role === "admin";

  const loadInvoices = async () => {
    setLoading(true);
    try {
      const areaParam = userAreaId ? `&areaId=${encodeURIComponent(userAreaId)}` : '';
      const res = await fetch(
        `/api/invoices?query=${encodeURIComponent(
          query,
        )}&currentPage=${currentPage}&companyId=${selectedCompany}${areaParam}`,
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
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [query, currentPage, selectedCompany, userAreaId]);

  const hasValidFile = (file?: string | null) => {
    if (!file) return false;
    const validPrefixes = [
      "data:application/pdf;base64,",
      "data:image/png;base64,",
      "data:image/jpeg;base64,",
      "data:image/jpg;base64,",
      "data:image/webp;base64,",
    ];
    return validPrefixes.some(prefix => file.startsWith(prefix) && file.length > prefix.length);
  };

  const toggleSort = (nextKey: SortKey) => {
    if (sortKey === nextKey) {
      setSortDir((prev) => (prev === "asc" ? "desc" : "asc"));
      return;
    }
    setSortKey(nextKey);
    setSortDir("asc");
  };

  const sortIndicator = (key: SortKey) => {
    if (sortKey !== key) return null;
    return sortDir === "asc" ? " ↑" : " ↓";
  };

  const sortedInvoices = useMemo(() => {
    const dirFactor = sortDir === "asc" ? 1 : -1;

    const getComparable = (inv: Invoice): string | number => {
      switch (sortKey) {
        case "supplier":
          return (inv.name ?? "").toString().toLowerCase();
        case "project":
          return (
            `${inv.area_name ?? ""} - ${inv.program ?? ""} - ${inv.project_name ?? ""}`
          )
            .toLowerCase()
            .trim();
        case "amount":
          return Number(inv.amount ?? 0);
        case "status":
          return (inv.status ?? "").toString().toLowerCase();
        case "date":
        default: {
          // Convert to timestamp for proper sorting
          const t = new Date(inv.date as any).getTime();
          return Number.isFinite(t) ? t : 0;
        }
      }
    };

    return [...invoices].sort((a, b) => {
      const av = getComparable(a);
      const bv = getComparable(b);

      if (typeof av === "number" && typeof bv === "number") {
        return (av - bv) * dirFactor;
      }

      return String(av).localeCompare(String(bv), "es", { sensitivity: "base" }) * dirFactor;
    });
  }, [invoices, sortKey, sortDir]);

  return (
    <div className="p-6 bg-gray-100 rounded-md shadow-md">
      <div className="flex justify-between items-center mb-4">
        <h2 className="text-lg font-semibold">Facturas por Compañía</h2>
        <ExportExcelButton />
      </div>

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

      <div className="overflow-x-auto bg-white rounded-md shadow">
        {loading ? (
          <p className="p-4">Cargando facturas...</p>
        ) : sortedInvoices.length === 0 ? (
          <p className="p-4">No se encontraron facturas.</p>
        ) : (
          <table className="min-w-full text-sm">
            <thead className="bg-gray-200 text-left">
              <tr>
                <th
                  className="px-4 py-2 cursor-pointer select-none hover:bg-gray-300"
                  onClick={() => toggleSort("supplier")}
                  title="Sort by supplier"
                >
                  Proveedor{sortIndicator("supplier")}
                </th>
                <th
                  className="px-4 py-2 cursor-pointer select-none hover:bg-gray-300"
                  onClick={() => toggleSort("project")}
                  title="Sort by area/program/project"
                >
                  Área - Programa - Proyecto{sortIndicator("project")}
                </th>
                <th
                  className="px-4 py-2 cursor-pointer select-none hover:bg-gray-300"
                  onClick={() => toggleSort("amount")}
                  title="Sort by amount"
                >
                  Cantidad{sortIndicator("amount")}
                </th>
                <th
                  className="px-4 py-2 cursor-pointer select-none hover:bg-gray-300"
                  onClick={() => toggleSort("date")}
                  title="Sort by date"
                >
                  Fecha{sortIndicator("date")}
                </th>
                <th
                  className="px-4 py-2 cursor-pointer select-none hover:bg-gray-300"
                  onClick={() => toggleSort("status")}
                  title="Sort by status"
                >
                  Estado{sortIndicator("status")}
                </th>
                <th className="px-4 py-2">Archivo</th>
                <th className="px-4 py-2"></th>
              </tr>
            </thead>

            <tbody>
              {sortedInvoices.map((invoice) => (
                <tr key={invoice.id}>
                  <td className="px-4 py-2">
                    <div className="flex items-center gap-2">
                      {invoice.image_url && invoice.image_url.trim() ? (
                        <Image
                          src={invoice.image_url}
                          alt={invoice.name || "invoice"}
                          width={28}
                          height={28}
                          className="rounded-full"
                        />
                      ) : (
                        <div className="flex h-7 w-7 items-center justify-center rounded-full bg-gray-200 text-xs font-semibold">
                          {invoice.name?.[0]?.toUpperCase() ?? "?"}
                        </div>
                      )}
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
                    {hasValidFile(invoice.file) ? (
                      <a
                        href={`/api/invoices/${invoice.id}/file`}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="flex items-center text-blue-600 hover:underline"
                      >
                        <DocumentTextIcon className="h-5 w-5 mr-1" />
                        Ver archivo
                      </a>
                    ) : (
                      <span className="text-xs text-gray-400">Ningún archivo</span>
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
                        <DeleteInvoice id={invoice.id} status={invoice.status} refreshInvoices={loadInvoices} />
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
