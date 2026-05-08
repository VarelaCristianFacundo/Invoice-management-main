"use client";

import { PencilIcon, PlusIcon, TrashIcon } from '@heroicons/react/24/outline';
import Link from 'next/link';
import Swal from 'sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';

export function CreateInvoice() {
  return (
    <Link
      href="/dashboard/invoices/create"
      className="flex h-10 items-center rounded-lg bg-gray-800 px-4 text-sm font-medium text-white transition-colors hover:bg-gray-700"
    >
      <PlusIcon className="w-5" />
      <span>Crear Factura</span>
    </Link>
  );
}

export function UpdateInvoice({ id }: { id: string }) {
  return (
    <Link
      href={`/dashboard/invoices/${id}/edit`}
      className="rounded-md border p-2 hover:bg-gray-100"
    >
      <PencilIcon className="w-5" />
    </Link>
  );
}

export function DeleteInvoice({
  id,
  status,
  refreshInvoices,
}: {
  id: string;
  status?: string;
  refreshInvoices: () => Promise<void>;
}) {
  const isPaid = status === 'pagado';

  const handleDelete = async () => {
    if (isPaid) {
      Swal.fire("No permitido", "No se puede eliminar una factura que ya fue abonada.", "warning");
      return;
    }

    const result = await Swal.fire({
      title: "Confirmar Eliminación",
      text: "¿Está seguro de que desea eliminar esta factura?",
      icon: "warning",
      showCancelButton: true,
      confirmButtonText: "Sí, eliminarla",
      cancelButtonText: "Cancelar",
    });

    if (!result.isConfirmed) return;

    try {
      const res = await fetch(`/api/invoice/${id}`, { method: "DELETE" });

      if (res.status === 403) {
        const data = await res.json();
        await Swal.fire("No permitido", data.message || "No se puede eliminar esta factura.", "warning");
        return;
      }

      if (!res.ok) throw new Error("Error al eliminar la factura");

      await Swal.fire("¡Eliminada!", "La factura fue eliminada con éxito.", "success");
      await refreshInvoices(); // Actualiza la lista de facturas
    } catch (error) {
      console.error("Error al eliminar factura:", error);
      Swal.fire("Error!", "Hubo un error al eliminar la factura.", "error");
    }
  };

  return (
    <button
      onClick={handleDelete}
      disabled={isPaid}
      title={isPaid ? "No se puede eliminar una factura abonada" : "Eliminar factura"}
      className={`rounded-md border p-2 ${
        isPaid
          ? "text-gray-300 cursor-not-allowed"
          : "text-red-600 hover:bg-gray-100 hover:text-red-800"
      }`}
    >
      <TrashIcon className="w-5" />
    </button>
  );
}
