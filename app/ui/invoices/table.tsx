import { fetchFilteredInvoices } from "@/app/lib/data";
import { formatCurrency, formatDateToLocal } from "@/app/lib/utils";
import { DeleteInvoice, UpdateInvoice } from "@/app/ui/invoices/buttons";
import InvoiceStatus from "@/app/ui/invoices/status";
import Image from "next/image";

export default async function InvoicesTable({
  query,
  currentPage,
}: {
  query: string;
  currentPage: number;
}) {

  const invoices = await fetchFilteredInvoices(query, currentPage);

  return (
    <div className="mt-6 flow-root">
      <div className="inline-block min-w-full align-middle">
        <div className="rounded-lg bg-gray-50 p-2 md:pt-0">
          <table className="min-w-full text-gray-900">
            <thead className="rounded-lg text-left text-sm font-normal">
              <tr>
                <th scope="col" className="px-4 py-5 font-medium">Customer</th>
                <th scope="col" className="px-3 py-5 font-medium">Project - Area</th>
                <th scope="col" className="px-3 py-5 font-medium">Amount</th>
                <th scope="col" className="px-3 py-5 font-medium">Date</th>
                <th scope="col" className="px-3 py-5 font-medium">Status</th>
                <th scope="col" className="px-3 py-5 font-medium">File</th>
                <th scope="col" className="px-3 py-5"></th>
              </tr>
            </thead>
            <tbody className="bg-white">
              {invoices?.map((invoice) => (
                <tr key={invoice.id} className="border-b last:border-none">
                  <td className="px-4 py-3">
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

                  <td className="px-3 py-3">
                    {invoice.project_name
                      ? `${invoice.project_name} - ${invoice.area_name} (${invoice.year})`
                      : "N/A"}
                  </td>

                  <td className="px-3 py-3">{formatCurrency(invoice.amount)}</td>
                  <td className="px-3 py-3">{formatDateToLocal(invoice.date)}</td>
                  <td className="px-3 py-3">
                    <InvoiceStatus status={invoice.status} />
                  </td>

                  <td className="px-3 py-3">
                    {/* PDF Link o ícono */}
                    {invoice.pdf_url ? (
                      <a
                        href={invoice.pdf_url}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="text-blue-600 hover:underline"
                      >
                        View PDF
                      </a>
                    ) : (
                      <span className="text-xs text-gray-400">No file</span>
                    )}
                  </td>

                  <td className="px-3 py-3 text-right">
                    <div className="flex items-center justify-end gap-2">
                      <UpdateInvoice id={invoice.id} />
                      <DeleteInvoice id={invoice.id} />
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}
