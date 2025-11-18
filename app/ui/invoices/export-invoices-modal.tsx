'use client';
import { ArrowDownTrayIcon } from '@heroicons/react/24/outline';
import { useState } from 'react';

export default function ExportInvoicesModal() {
    const [showModal, setShowModal] = useState(false);
    const [loading, setLoading] = useState(false);

    const handleExport = async (format: 'excel' | 'txt') => {
        setLoading(true);
        try {
            const endpoint = format === 'excel'
                ? '/api/invoices/export-excel'
                : '/api/invoices/export-txt';

            const res = await fetch(endpoint, { method: 'GET' });
            if (!res.ok) throw new Error('Error al exportar archivo');
            const blob = await res.blob();

            const fileName = format === 'excel'
                ? 'facturas.xlsx'
                : 'facturas.txt';

            // Crear enlace temporal y descargar
            const url = window.URL.createObjectURL(blob);
            const link = document.createElement('a');
            link.href = url;
            link.download = fileName;
            document.body.appendChild(link);
            link.click();
            link.remove();
            window.URL.revokeObjectURL(url);

            setShowModal(false);
        } catch (err) {
            alert('No se pudo exportar el archivo');
        } finally {
            setLoading(false);
        }
    };

    return (
        <>
            <div className="flex gap-2 justify-end mb-4">
                <button
                    className="inline-flex items-center px-3 py-2 bg-green-600 hover:bg-green-700 text-white rounded shadow"
                    onClick={() => setShowModal(true)}
                >
                    <ArrowDownTrayIcon className="w-5 h-5 mr-2" />

                    Exportar
                </button>
            </div>
            {showModal && (
                <div className="fixed inset-0 bg-black/30 flex items-center justify-center z-50">
                    <div className="bg-white rounded-xl shadow-lg p-8 w-80">
                        <h2 className="text-lg font-bold mb-4 text-center">
                            ¿En qué formato querés exportar?
                        </h2>
                        <div className="flex flex-col gap-4">
                            <button
                                className="bg-green-600 text-white py-2 rounded hover:bg-green-700"
                                onClick={() => handleExport('excel')}
                                disabled={loading}
                            >
                                Excel (.xlsx)
                            </button>
                            <button
                                className="bg-gray-700 text-white py-2 rounded hover:bg-gray-800"
                                onClick={() => handleExport('txt')}
                                disabled={loading}
                            >
                                TXT (.txt)
                            </button>
                            <button
                                className="mt-2 text-gray-400 hover:text-gray-900 text-sm"
                                onClick={() => setShowModal(false)}
                                disabled={loading}
                            >
                                Cancelar
                            </button>
                        </div>
                    </div>
                </div>
            )}
        </>
    );
}
