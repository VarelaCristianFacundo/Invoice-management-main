import { Invoice } from "@/app/lib/definitions";
import { formatCurrency, formatDateToLocal } from "@/app/lib/utils";
import { XMarkIcon } from "@heroicons/react/24/solid";

export function InvoiceDetailsModal({ invoice, onClose }: { invoice: Invoice; onClose: () => void }) {
    return (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center z-50">
            <div className="bg-white p-6 rounded-md shadow-md w-96 relative">
                <button
                    onClick={onClose}
                    className="absolute top-2 right-2 text-gray-500 hover:text-gray-800"
                >
                    <XMarkIcon className="h-5 w-5" />
                </button>

                <h2 className="text-lg font-semibold mb-4">Detalle de la Factura</h2>

                <p><strong>Proveedor:</strong> {invoice.name}</p>
                <p><strong>Monto:</strong> {formatCurrency(invoice.amount)}</p>
                <p><strong>Estado:</strong> {invoice.status}</p>
                <p><strong>Fecha:</strong> {formatDateToLocal(invoice.date)}</p>

                {invoice.observations ? (
                    <div className="mt-4">
                        <h3 className="font-semibold text-sm">Observaciones:</h3>
                        <p className="text-gray-700 text-sm mt-1">{invoice.observations}</p>
                    </div>
                ) : (
                    <p className="text-gray-400 text-sm mt-4">Sin observaciones registradas.</p>
                )}
            </div>
        </div>
    );
}
