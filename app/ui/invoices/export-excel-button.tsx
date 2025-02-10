"use client";

import { ArrowDownTrayIcon } from "@heroicons/react/24/outline"; // Asegúrate de tener instalado heroicons
import { useState } from "react";

export default function ExportExcelButton() {
    const [loading, setLoading] = useState(false);

    const handleExport = async () => {
        setLoading(true);
        try {
            // Llamamos a la API que genera el Excel
            const res = await fetch("/api/report/invoices");
            if (!res.ok) {
                throw new Error("Error exporting report");
            }
            // Obtenemos el blob del archivo
            const blob = await res.blob();
            // Creamos una URL para el blob
            const url = window.URL.createObjectURL(blob);
            // Creamos un enlace <a> para descargar el archivo
            const a = document.createElement("a");
            a.href = url;
            a.download = "report.xlsx";
            document.body.appendChild(a);
            a.click();
            a.remove();
            // Liberamos la URL
            window.URL.revokeObjectURL(url);
        } catch (error) {
            console.error("Error exporting Excel:", error);
            alert("Error exporting Excel report");
        } finally {
            setLoading(false);
        }
    };

    return (
        <button
            onClick={handleExport}
            disabled={loading}
            title="Exportar Excel"
            className="p-2 rounded-full hover:bg-gray-200 transition"
        >
            {loading ? (
                // Ícono de carga (spinner)
                <svg
                    className="animate-spin h-6 w-6 text-black"
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    viewBox="0 0 24 24"
                >
                    <circle
                        className="opacity-25"
                        cx="12"
                        cy="12"
                        r="10"
                        stroke="currentColor"
                        strokeWidth="4"
                    ></circle>
                    <path
                        className="opacity-75"
                        fill="currentColor"
                        d="M4 12a8 8 0 018-8v8H4z"
                    ></path>
                </svg>
            ) : (
                <ArrowDownTrayIcon className="h-6 w-6 text-black" />
            )}
        </button>
    );
}
