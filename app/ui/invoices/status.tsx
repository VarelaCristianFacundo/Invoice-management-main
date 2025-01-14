// app/ui/invoices/InvoiceStatus.tsx
"use client";

import { CheckIcon, ClockIcon, XMarkIcon } from "@heroicons/react/24/outline";
import clsx from "clsx";

interface InvoiceStatusProps {
  status: string;
}

export default function InvoiceStatus({ status }: InvoiceStatusProps) {
  // Podemos mapear (en minúsculas) cada estado a:
  // - Texto a mostrar
  // - Clases para fondo y texto
  // - Ícono a mostrar
  const statusData: Record<string, { label: string; className: string; icon: JSX.Element }> = {
    presentado: {
      label: "Presentado",
      className: "bg-gray-100 text-gray-500",
      icon: <ClockIcon className="ml-1 h-4 w-4 text-gray-500" />,
    },
    aprobado: {
      label: "Aprobado",
      className: "bg-blue-500 text-white",
      icon: <CheckIcon className="ml-1 h-4 w-4 text-white" />,
    },
    pagado: {
      label: "Pagado",
      className: "bg-green-500 text-white",
      icon: <CheckIcon className="ml-1 h-4 w-4 text-white" />,
    },
    rechazado: {
      label: "Rechazado",
      className: "bg-red-500 text-white",
      icon: <XMarkIcon className="ml-1 h-4 w-4 text-white" />,
    },
  };

  const data = statusData[status.toLowerCase()];

  return (
    <span className={clsx("inline-flex items-center rounded-full px-2 py-1 text-xs", data ? data.className : "bg-gray-100 text-gray-500")}>
      {data ? (
        <>
          {data.label}
          {data.icon}
        </>
      ) : (
        <>
          {status}
          <ClockIcon className="ml-1 h-4 w-4 text-gray-500" />
        </>
      )}
    </span>
  );
}
