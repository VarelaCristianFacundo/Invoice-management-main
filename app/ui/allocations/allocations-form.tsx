"use client";

import { formatCurrency } from '@/app/lib/utils';
import { useEffect, useState } from 'react';
import Swal from 'sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';

type Area = {
    id: string;
    name: string;
    allocated_funds: number | null;
};

const sanitizeText = (text: string) => {
    try {
        return decodeURIComponent(escape(text));
    } catch {
        return text;
    }
};

export default function AllocationsForm() {
    const [areas, setAreas] = useState<Area[]>([]);
    const [funds, setFunds] = useState<Record<string, string | number>>({});
    const [years, setYears] = useState<Record<string, string>>({});
    const [quarters, setQuarters] = useState<Record<string, string>>({});

    // Mover loadAreas fuera del useEffect para reutilizarla
    const loadAreas = async () => {
        try {
            const res = await fetch('/api/areas');
            const areasData: Area[] = await res.json();
            setAreas(areasData);
            const initialFunds: Record<string, string | number> = {};
            const initialYears: Record<string, string> = {};
            const initialQuarters: Record<string, string> = {};
            areasData.forEach((area) => {
                initialFunds[area.id] = area.allocated_funds ?? '';
                initialYears[area.id] = '';
                initialQuarters[area.id] = '';
            });
            setFunds(initialFunds);
            setYears(initialYears);
            setQuarters(initialQuarters);
        } catch (error) {
            Swal.fire('Error', 'Failed to load areas. Please try again later.', 'error');
        }
    };

    useEffect(() => {
        loadAreas(); // Invocar la función al montar el componente
    }, []);

    const handleChange = (areaId: string, field: string, value: string | number) => {
        if (field === 'funds') {
            setFunds({ ...funds, [areaId]: value });
        } else if (field === 'year') {
            setYears({ ...years, [areaId]: value as string });
        } else if (field === 'quarter') {
            setQuarters({ ...quarters, [areaId]: value as string});
        }
    };

    const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();

        const updates = Object.entries(funds)
            .map(([areaId, amount]) => ({
                areaId,
                amount: parseFloat(amount as string),
                year: parseInt(years[areaId]),
                quarter: parseInt(quarters[areaId]),
            }))
            .filter((update) => !isNaN(update.amount) && !isNaN(update.year) && !isNaN(update.quarter));

        if (updates.length === 0) {
            Swal.fire('No Changes', 'There are no updates to save.', 'info');
            return;
        }

        const result = await Swal.fire({
            title: 'Confirm Update',
            text: 'Are you sure you want to update the funds?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: 'Yes, update',
            cancelButtonText: 'Cancel',
        });

        if (!result.isConfirmed) return;

        try {
            const res = await fetch('/api/area-funds', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(updates),
            });

            const data = await res.json(); // Parsear la respuesta JSON

            if (!res.ok || !data.message.includes('successfully')) {
                throw new Error(data.error || 'Failed to update area funds');
            }

            Swal.fire('Success', 'Funds updated successfully!', 'success');
            loadAreas(); // Recargar las áreas después de la actualización
        } catch (error: any) {
            Swal.fire('Error', error.message || 'Failed to update area funds. Please try again.', 'error');
        }
    };

    return (
        <form onSubmit={handleSubmit}>
            {areas.map((area) => (
                <div key={area.id} className="mb-4">
                    <label htmlFor={`area-${area.id}`} className="block text-sm font-medium">
                        {sanitizeText(area.name)}{' '}
                        ({'Current funds: '}
                        {formatCurrency(area.allocated_funds || 0)})
                    </label>
                    <input
                        id={`area-${area.id}`}
                        type="number"
                        step="0.01"
                        value={funds[area.id]}
                        onChange={(e) => handleChange(area.id, 'funds', e.target.value)}
                        className="block w-full rounded-md border border-gray-200 py-2 px-3 text-sm"
                        min="0"
                    />
                    <label htmlFor={`year-${area.id}`} className="block text-sm font-medium mt-2">
                        Año:
                    </label>
                    <input
                        id={`year-${area.id}`}
                        type="number"
                        value={years[area.id]}
                        onChange={(e) => handleChange(area.id, 'year', e.target.value)}
                        className="block w-full rounded-md border border-gray-200 py-2 px-3 text-sm"
                        min="0"
                    />
                    <label htmlFor={`quarter-${area.id}`} className="block text-sm font-medium mt-2">
                        Quarter:
                    </label>
                    <input
                        id={`quarter-${area.id}`}
                        type="number"
                        value={quarters[area.id]}
                        onChange={(e) => handleChange(area.id, 'quarter', e.target.value)}
                        className="block w-full rounded-md border border-gray-200 py-2 px-3 text-sm"
                        min="1"
                        max="4"
                    />
                </div>
            ))}
            <button type="submit" className="mt-4 rounded-md bg-blue-500 px-4 py-2 text-white">
                Update Funds
            </button>
        </form>
    );
}