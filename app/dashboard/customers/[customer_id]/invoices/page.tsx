"use client";

import { formatCurrency, formatDateToLocal } from "@/app/lib/utils";
import { useRouter } from "next/navigation";
import { useEffect, useState } from "react";

type Invoice = {
  id: string;
  amount: number;
  status: string;
  date: string;
  file: string;
  area_name: string;
  program: string;
  project_name: string;
};

export default function CustomerInvoices({
  params,
}: {
  params: { customer_id: string };
}) {
  const [invoices, setInvoices] = useState<Invoice[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const router = useRouter();

  useEffect(() => {
    const fetchInvoices = async () => {
      setLoading(true);
      try {
        const res = await fetch(`/api/invoices/customer/${params.customer_id}`);
        const data = await res.json();
        setInvoices(data);
      } catch (error) {
        console.error("Error fetching invoices:", error);
      } finally {
        setLoading(false);
      }
    };

    fetchInvoices();
  }, [params.customer_id]);

  return (
    <div className="p-6 bg-gray-100 rounded-md shadow-md">
      <h2 className="text-lg font-semibold mb-4">Facturas del Proveedor</h2>
      {loading ? (
        <p>Cargando facturas...</p>
      ) : invoices.length === 0 ? (
        <p>No se encontraron facturas para este proveedor.</p>
      ) : (
        <table className="min-w-full text-sm bg-white rounded-md shadow">
          <thead className="bg-gray-200 text-left">
            <tr>
              <th className="px-4 py-2">Área - Programa - Proyecto</th>
              <th className="px-4 py-2">Monto</th>
              <th className="px-4 py-2">Fecha</th>
              <th className="px-4 py-2">Estado</th>
              <th className="px-4 py-2">Archivo</th>
            </tr>
          </thead>
          <tbody>
            {invoices.map((invoice) => (
              <tr key={invoice.id}>
                <td className="px-4 py-2">
                  {invoice.area_name
                    ? `${invoice.area_name} - ${invoice.program} - ${invoice.project_name}`
                    : "N/A"}
                </td>
                <td className="px-4 py-2">{formatCurrency(invoice.amount)}</td>
                <td className="px-4 py-2">{formatDateToLocal(invoice.date)}</td>
                <td className="px-4 py-2">{invoice.status}</td>
                <td className="px-4 py-2">
                  {invoice.file ? (
                    <a
                      href={invoice.file}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-blue-600 hover:underline"
                    >
                      Ver PDF
                    </a>
                  ) : (
                    "Sin archivo"
                  )}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      )}
      <button
        onClick={() => router.back()}
        className="mt-4 bg-gray-800 text-white px-4 py-2 rounded-md"
      >
        Volver
      </button>
    </div>
  );
}
