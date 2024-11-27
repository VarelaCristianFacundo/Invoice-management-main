// app/ui/allocations/allocations-form.tsx
"use client";

import { formatCurrency } from '@/app/lib/utils';
import { useEffect, useState } from 'react';

export default function AllocationsForm() {
    const [areas, setAreas] = useState([]);
    const [funds, setFunds] = useState({});

    // Mover la función `loadAreas` dentro del componente
    const loadAreas = async () => {
        const res = await fetch('/api/areas');
        const areasData = await res.json();
        setAreas(areasData);
        // Inicializar los fondos con los valores actuales
        const initialFunds = {};
        // Dentro de loadAreas()
        areasData.forEach((area) => {
            initialFunds[area.id] = area.allocated_funds !== null ? area.allocated_funds : '';
        });

        setFunds(initialFunds);
    };

    // Mover el `useEffect` dentro del componente
    useEffect(() => {
        loadAreas();
    }, []);

    const handleChange = (areaId, value) => {
        setFunds({
            ...funds,
            [areaId]: value,
        });
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        const updates = Object.entries(funds)
            .map(([areaId, amount]) => ({
                areaId,
                amount: parseFloat(amount),
            }))
            .filter((update) => !isNaN(update.amount));

        if (updates.length === 0) {
            alert('No hay cambios para actualizar.');
            return;
        }

        const res = await fetch('/api/area-funds', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(updates),
        });
        if (res.ok) {
            alert('Fondos actualizados exitosamente');
            // Recargar las áreas para reflejar los cambios
            loadAreas();
        } else {
            alert('Error al actualizar los fondos');
        }
    };

    return (
        <form onSubmit={handleSubmit}>
            {areas.map((area) => (
                <div key={area.id} className="mb-4">
                    <label htmlFor={`area-${area.id}`} className="block text-sm font-medium">
                        {area.name} ({'Fondo actual: '}{formatCurrency(area.allocated_funds || 0)})
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
                Actualizar Fondos
            </button>
        </form>
    );
}
