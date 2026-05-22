'use client';

import {
  ArrowDownTrayIcon,
  ArrowUpTrayIcon,
} from '@heroicons/react/24/outline';
import { useRef, useState } from 'react';
import Swal from 'sweetalert2';

export function ImportCustomersButton() {
  const fileInputRef = useRef<HTMLInputElement>(null);
  const [loading, setLoading] = useState(false);

  // ── Download template ────────────────────────────────────
  const handleDownloadTemplate = async () => {
    try {
      const res = await fetch('/api/customers/template');
      if (!res.ok) throw new Error('No se pudo generar el template.');
      const blob = await res.blob();
      const url = URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = 'template_proveedores.xlsx';
      a.click();
      URL.revokeObjectURL(url);
    } catch {
      Swal.fire('Error', 'No se pudo descargar el template.', 'error');
    }
  };

  // ── Import Excel ─────────────────────────────────────────
  const handleFileChange = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!e.target.files) return;
    // Reset so the same file can be re-selected
    e.target.value = '';

    if (!file) return;

    if (
      !file.name.endsWith('.xlsx') &&
      !file.name.endsWith('.xls')
    ) {
      await Swal.fire(
        'Formato inválido',
        'Solo se aceptan archivos .xlsx o .xls',
        'warning',
      );
      return;
    }

    const confirm = await Swal.fire({
      title: 'Importar proveedores',
      html: `<p>Archivo: <b>${file.name}</b></p><p class="mt-1 text-sm text-gray-500">Se importarán todos los proveedores válidos del archivo. Los duplicados (por CUIT/CUIL) serán omitidos.</p>`,
      icon: 'question',
      showCancelButton: true,
      confirmButtonText: 'Importar',
      cancelButtonText: 'Cancelar',
    });

    if (!confirm.isConfirmed) return;

    setLoading(true);

    try {
      const formData = new FormData();
      formData.append('file', file);

      const res = await fetch('/api/customers/import', {
        method: 'POST',
        body: formData,
      });

      const data = await res.json();

      if (!res.ok) {
        await Swal.fire('Error', data.error ?? 'Error al importar.', 'error');
        return;
      }

      const { inserted, skipped, message } = data as {
        inserted: number;
        skipped: { row: number; reason: string }[];
        message: string;
      };

      let html = `<p class="text-lg font-semibold mb-2">${message}</p>`;

      if (skipped.length > 0) {
        html += `<p class="text-sm text-yellow-700 mb-1 font-medium">${skipped.length} fila(s) omitida(s):</p>`;
        html += `<ul class="text-left text-xs text-gray-600 max-h-40 overflow-y-auto border rounded p-2">`;
        skipped.forEach(({ row, reason }) => {
          html += `<li class="mb-1">• Fila ${row}: ${reason}</li>`;
        });
        html += `</ul>`;
      }

      await Swal.fire({
        title: inserted > 0 ? 'Importación completada' : 'Sin cambios',
        html,
        icon: inserted > 0 ? 'success' : 'warning',
        confirmButtonText: 'Aceptar',
      });

      if (inserted > 0) {
        // Refresh page data without full reload
        window.location.reload();
      }
    } catch {
      await Swal.fire('Error', 'Error inesperado al importar.', 'error');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="flex gap-2">
      {/* Download template */}
      <button
        type="button"
        onClick={handleDownloadTemplate}
        title="Descargar template Excel"
        className="flex h-10 items-center gap-1.5 rounded-lg border border-gray-300 bg-white px-3 text-sm font-medium text-gray-700 transition-colors hover:bg-gray-50 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-400"
      >
        <ArrowDownTrayIcon className="h-4 w-4" />
        <span className="hidden md:block">Template</span>
      </button>

      {/* Import */}
      <button
        type="button"
        disabled={loading}
        onClick={() => fileInputRef.current?.click()}
        title="Importar proveedores desde Excel"
        className="flex h-10 items-center gap-1.5 rounded-lg border border-gray-300 bg-white px-3 text-sm font-medium text-gray-700 transition-colors hover:bg-gray-50 disabled:opacity-50 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-400"
      >
        <ArrowUpTrayIcon className="h-4 w-4" />
        <span className="hidden md:block">
          {loading ? 'Importando…' : 'Importar Excel'}
        </span>
      </button>

      <input
        ref={fileInputRef}
        type="file"
        accept=".xlsx,.xls"
        className="hidden"
        onChange={handleFileChange}
      />
    </div>
  );
}
