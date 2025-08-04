"use client";
import { ArrowDownTrayIcon } from "@heroicons/react/24/outline";

export default function ExportButtons() {
    // Excel
    const handleExportExcel = () => {
        window.open("/api/invoices/export-excel", "_blank");
    };

    // TXT/CSV
    const handleExportTxt = () => {
        window.open("/api/invoices/export-txt", "_blank");
    };

    return (
        <div className="flex gap-2 justify-end mb-4">
            <button
                onClick={handleExportExcel}
                className="inline-flex items-center px-3 py-2 bg-green-600 hover:bg-green-700 text-white rounded shadow"
            >
                <ArrowDownTrayIcon className="w-5 h-5 mr-2" />
                Exportar
            </button>
            {/* Si querés mostrar también TXT */}
            {/* 
      <button
        onClick={handleExportTxt}
        className="inline-flex items-center px-3 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded shadow"
      >
        <ArrowDownTrayIcon className="w-5 h-5 mr-2" />
        Exportar a TXT
      </button>
      */}
        </div>
    );
}
