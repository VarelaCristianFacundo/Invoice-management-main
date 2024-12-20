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

    // Mover loadAreas fuera del useEffect para reutilizarla
    const loadAreas = async () => {
        try {
            const res = await fetch('/api/areas');
            const areasData: Area[] = await res.json();
            setAreas(areasData);
            const initialFunds: Record<string, string | number> = {};
            areasData.forEach((area) => {
                initialFunds[area.id] = area.allocated_funds ?? '';
            });
            setFunds(initialFunds);
        } catch (error) {
            Swal.fire('Error', 'Failed to load areas. Please try again later.', 'error');
        }
    };

    useEffect(() => {
        loadAreas(); // Invocar la función al montar el componente
    }, []);

    const handleChange = (areaId: string, value: string | number) => {
        setFunds({ ...funds, [areaId]: value });
    };

    const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();

        const updates = Object.entries(funds)
            .map(([areaId, amount]) => ({
                areaId,
                amount: parseFloat(amount as string),
            }))
            .filter((update) => !isNaN(update.amount));

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
                        onChange={(e) => handleChange(area.id, e.target.value)}
                        className="block w-full rounded-md border border-gray-200 py-2 px-3 text-sm"
                        min="0"
                    />
                </div>
            ))}
            <button type="submit" className="mt-4 rounded-md bg-blue-500 px-4 py-2 text-white">
                Update Funds
            </button>
        </form>
    );
}
