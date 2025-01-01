"use client";

import { useEffect, useState } from "react";
import Swal from "sweetalert2";
import "sweetalert2/dist/sweetalert2.min.css";

type Fund = {
    half: number;
    amount: number | null;
};

type Area = {
    id: string;
    name: string;
    funds: Fund[];
};

export default function AllocationsForm() {
    const [areas, setAreas] = useState<Area[]>([]);
    const [years, setYears] = useState<number[]>([]);
    const [allocations, setAllocations] = useState<
        Record<string, { year: number; half: number; amount: number }>
    >({});
    const [loading, setLoading] = useState<boolean>(true);

    useEffect(() => {
        const fetchData = async () => {
            try {
                const [areasRes, yearsRes] = await Promise.all([
                    fetch("/api/areas"), // Endpoint de áreas con allocated_funds
                    fetch("/api/year"), // Endpoint de años disponibles
                ]);

                if (!areasRes.ok || !yearsRes.ok) {
                    throw new Error("Error fetching data from APIs");
                }

                const areasData = await areasRes.json();
                const yearsData: number[] = await yearsRes.json();

                // Agrupar fondos por área y semestre
                const groupedAreas: Area[] = Object.values(
                    areasData.reduce((acc: Record<string, Area>, item: any) => {
                        if (!acc[item.id]) {
                            acc[item.id] = { id: item.id, name: item.name, funds: [] };
                        }
                        acc[item.id].funds.push({
                            half: item.half || 1,
                            amount: item.allocated_funds ? parseFloat(item.allocated_funds) : null,
                        });
                        return acc;
                    }, {})
                );

                // Filtrar años válidos
                const yearList = yearsData.filter((year) => typeof year === "number" && year > 0);

                setAreas(groupedAreas);
                setYears(yearList);
            } catch (error) {
                console.error("Error fetching data:", error);
                Swal.fire("Error", "Error fetching data. Please try again later.", "error");
            } finally {
                setLoading(false);
            }
        };

        fetchData();
    }, []);

    const handleChange = (areaId: string, field: string, value: string | number) => {
        setAllocations((prev) => ({
            ...prev,
            [areaId]: {
                ...prev[areaId],
                [field]: value,
            },
        }));
    };

    const handleSubmit = async () => {
        const updates = Object.entries(allocations)
            .map(([areaId, data]) => ({
                areaId,
                year: data.year,
                half: data.half,
                amount: data.amount,
            }))
            .filter(
                (update) =>
                    update.year &&
                    update.half &&
                    !isNaN(update.amount) &&
                    update.amount > 0
            );

        if (updates.length === 0) {
            Swal.fire("No Changes", "Please complete all fields before submitting.", "info");
            return;
        }

        try {
            const res = await fetch("/api/area-funds", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(updates),
            });

            if (!res.ok) {
                const error = await res.json();
                throw new Error(error.error || "Failed to save area funds.");
            }

            Swal.fire("Success", "Funds saved successfully!", "success");
        } catch (error) {
            Swal.fire("Error", error.message, "error");
        }
    };

    if (loading) {
        return <div>Cargando datos...</div>;
    }

    return (
        <div className="relative flex flex-col md:flex-row gap-6">
            {/* Left Column */}
            <div className="flex-1">
                {areas.map((area) => (
                    <div key={area.id} className="mb-6 border-b pb-4">
                        <h3 className="text-lg font-semibold">{area.name}</h3>

                        <label htmlFor={`year-${area.id}`} className="block text-sm font-medium">
                            Año
                        </label>
                        <select
                            id={`year-${area.id}`}
                            value={allocations[area.id]?.year || ""}
                            onChange={(e) => handleChange(area.id, "year", parseInt(e.target.value))}
                            className="block w-full rounded-md border border-gray-300 py-2 px-3 text-sm"
                        >
                            <option value="">Seleccione un año</option>
                            {years.map((year) => (
                                <option key={`year-${area.id}-${year}`} value={year}>
                                    {year}
                                </option>
                            ))}
                        </select>

                        <label className="block text-sm font-medium mt-4">Semestre</label>
                        <div className="flex gap-4">
                            <label className="flex items-center">
                                <input
                                    type="radio"
                                    name={`half-${area.id}`}
                                    value="1"
                                    onChange={() => handleChange(area.id, "half", 1)}
                                    className="mr-2"
                                    checked={allocations[area.id]?.half === 1}
                                />
                                1er Semestre
                            </label>
                            <label className="flex items-center">
                                <input
                                    type="radio"
                                    name={`half-${area.id}`}
                                    value="2"
                                    onChange={() => handleChange(area.id, "half", 2)}
                                    className="mr-2"
                                    checked={allocations[area.id]?.half === 2}
                                />
                                2do Semestre
                            </label>
                        </div>

                        <label
                            htmlFor={`amount-${area.id}`}
                            className="block text-sm font-medium mt-4"
                        >
                            Monto
                        </label>
                        <input
                            id={`amount-${area.id}`}
                            type="number"
                            step="0.01"
                            min="0"
                            value={allocations[area.id]?.amount || ""}
                            onChange={(e) =>
                                handleChange(area.id, "amount", parseFloat(e.target.value))
                            }
                            className="block w-full rounded-md border border-gray-300 py-2 px-3 text-sm"
                        />
                    </div>
                ))}
            </div>

            {/* Right Column */}
            <div className="flex-1">
                <h2 className="text-lg font-semibold mb-4">Montos Actuales por Área</h2>
                <ul className="divide-y divide-gray-200">
                    {areas.map((area) => (
                        <li key={`current-${area.id}`} className="py-4">
                            <h3 className="text-sm font-medium">{area.name}</h3>
                            {area.funds.map((fund) => (
                                <p key={`fund-${area.id}-${fund.half}`} className="text-sm text-gray-500">
                                    {fund.half === 1 ? "1er Semestre:" : "2do Semestre:"}
                                    <span className="ml-2 font-semibold">
                                        ${fund.amount ? fund.amount.toFixed(2) : "0.00"}
                                    </span>
                                </p>
                            ))}
                        </li>
                    ))}
                </ul>
            </div>

            {/* Floating Button */}
            <button
                type="button"
                onClick={handleSubmit}
                className="fixed bottom-4 right-4 bg-blue-600 text-white rounded-full p-4 shadow-lg hover:bg-blue-700 focus:ring"
            >
                Guardar Fondos
            </button>
        </div>
    );
}
