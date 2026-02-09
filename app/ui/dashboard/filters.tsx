'use client';

import { FunnelIcon } from '@heroicons/react/24/outline';
import { useRouter, useSearchParams } from 'next/navigation';
import { useCallback, useState } from 'react';

export default function DashboardFilters() {
    const router = useRouter();
    const searchParams = useSearchParams();

    const [statusFilter, setStatusFilter] = useState(
        searchParams.get('status') || 'all',
    );
    const [yearFilter, setYearFilter] = useState(
        searchParams.get('year') || 'all',
    );
    const [companyFilter, setCompanyFilter] = useState(
        searchParams.get('company') || '1',
    );

    const handleStatusChange = useCallback(
        (value: string) => {
            setStatusFilter(value);
            const params = new URLSearchParams(searchParams.toString());
            if (value === 'all') {
                params.delete('status');
            } else {
                params.set('status', value);
            }
            router.push(`?${params.toString()}`);
        },
        [router, searchParams],
    );

    const handleYearChange = useCallback(
        (value: string) => {
            setYearFilter(value);
            const params = new URLSearchParams(searchParams.toString());
            if (value === 'all') {
                params.delete('year');
            } else {
                params.set('year', value);
            }
            router.push(`?${params.toString()}`);
        },
        [router, searchParams],
    );

    const handleCompanyChange = useCallback(
        (value: string) => {
            setCompanyFilter(value);
            const params = new URLSearchParams(searchParams.toString());
            params.set('company', value);
            router.push(`?${params.toString()}`);
        },
        [router, searchParams],
    );

    const handleReset = useCallback(() => {
        setStatusFilter('all');
        setYearFilter('all');
        setCompanyFilter('1');
        router.push('/dashboard');
    }, [router]);

    return (
        <div className="mb-6 rounded-xl bg-gray-50 p-4 shadow-sm">
            <div className="flex items-center gap-2 mb-4">
                <FunnelIcon className="h-5 w-5 text-gray-700" />
                <h3 className="text-sm font-semibold text-gray-700">Filtros</h3>
            </div>

            <div className="grid grid-cols-1 gap-4 md:grid-cols-3">
                {/* Company Filter */}
                <div>
                    <label className="block text-xs font-medium text-gray-600 mb-2">
                        Empresa
                    </label>
                    <select
                        value={companyFilter}
                        onChange={(e) => handleCompanyChange(e.target.value)}
                        className="w-full rounded-md border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500"
                    >
                        <option value="1">CAMARCO</option>
                        <option value="2">FODECO</option>
                    </select>
                </div>

                {/* Status Filter */}
                <div>
                    <label className="block text-xs font-medium text-gray-600 mb-2">
                        Estado
                    </label>
                    <select
                        value={statusFilter}
                        onChange={(e) => handleStatusChange(e.target.value)}
                        className="w-full rounded-md border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500"
                    >
                        <option value="all">Todos los estados</option>
                        <option value="presentado">Presentado</option>
                        <option value="aprobado">Aprobado</option>
                        <option value="pagado">Pagado</option>
                        <option value="rechazado">Rechazado</option>
                    </select>
                </div>

                {/* Year Filter */}
                <div>
                    <label className="block text-xs font-medium text-gray-600 mb-2">
                        Año
                    </label>
                    <select
                        value={yearFilter}
                        onChange={(e) => handleYearChange(e.target.value)}
                        className="w-full rounded-md border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500"
                    >
                        <option value="all">Todos los años</option>
                        <option value="2024">2024</option>
                        <option value="2025">2025</option>
                        <option value="2026">2026</option>
                    </select>
                </div>
            </div>

            {/* Reset Button */}
            <div className="mt-4 flex gap-2">
                <button
                    onClick={handleReset}
                    className="text-xs px-3 py-2 rounded-md bg-gray-200 text-gray-700 hover:bg-gray-300 transition-colors font-medium"
                >
                    Limpiar filtros
                </button>
            </div>
        </div>
    );
}
