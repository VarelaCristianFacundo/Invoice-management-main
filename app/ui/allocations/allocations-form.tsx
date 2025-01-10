"use client";

import { useEffect, useState } from "react";
import Swal from "sweetalert2";
import "sweetalert2/dist/sweetalert2.min.css";

type Fund = {
    fund_id?: string;
    half: number;
    amount: number | null;
    year: number | null;
};

type Area = {
    id: string;
    name: string;
    funds: Fund[];
};

export default function AllocationsForm() {
    const [areas, setAreas] = useState<Area[]>([]);
    const [years, setYears] = useState<number[]>([]);
    const [loading, setLoading] = useState<boolean>(true);

    // Estado para el formulario de asignación
    const [selectedAreaId, setSelectedAreaId] = useState<string>("");
    const [selectedYear, setSelectedYear] = useState<number | "">("");
    const [selectedHalf, setSelectedHalf] = useState<number>(1);
    const [allocationAmount, setAllocationAmount] = useState<number>(0);

    // 1. Extraer la lógica de carga a una función reutilizable
    const fetchAllData = async () => {
        try {
            setLoading(true);

            // 1. Trae TODAS las áreas
            // 2. Trae LOS FONDOS
            // 3. Trae LOS AÑOS
            const [allAreasRes, areaFundsRes, yearsRes] = await Promise.all([
                fetch("/api/areas"),       // Devuelve TODAS las áreas
                fetch("/api/area-funds"),  // Devuelve fondos
                fetch("/api/year"),
            ]);

            if (!allAreasRes.ok || !areaFundsRes.ok || !yearsRes.ok) {
                throw new Error("Error fetching data from APIs");
            }

            const allAreasData = await allAreasRes.json();
            const areaFundsData = await areaFundsRes.json();
            const yearsData: number[] = await yearsRes.json();

            // Crear diccionario de áreas
            const areasDict: Record<string, Area> = {};

            // Rellenar el dict con TODAS las áreas
            for (const areaItem of allAreasData) {
                areasDict[areaItem.id] = {
                    id: areaItem.id,
                    name: areaItem.name,
                    funds: [],
                };
            }

            // Asignar fondos a cada área
            for (const fund of areaFundsData) {
                const areaId = fund.area_id;
                if (!areasDict[areaId]) {
                    areasDict[areaId] = {
                        id: areaId,
                        name: fund.area_name ?? "Área sin nombre",
                        funds: [],
                    };
                }
                areasDict[areaId].funds.push({
                    fund_id: fund.fund_id,
                    half: fund.half,
                    amount: fund.allocated_funds ? parseFloat(fund.allocated_funds) : null,
                    year: fund.year ? parseInt(fund.year) : null,
                });
            }

            const mergedAreas: Area[] = Object.values(areasDict);
            const validYears = yearsData.filter((yr) => typeof yr === "number" && yr > 0);

            setAreas(mergedAreas);
            setYears(validYears);
        } catch (error) {
            console.error("Error fetching data:", error);
            Swal.fire("Error", "Error fetching data. Please try again later.", "error");
        } finally {
            setLoading(false);
        }
    };

    // 2. Llamar a esa función en el useEffect inicial
    useEffect(() => {
        fetchAllData();
    }, []);

    // Manejo del submit de asignación de fondos a un área
    const handleSubmit = async () => {
        // Validar campos
        if (!selectedAreaId || !selectedYear || !selectedHalf || allocationAmount <= 0) {
            Swal.fire(
                "Incomplete",
                "Please select Area, Year, Semester, and a positive amount.",
                "info"
            );
            return;
        }

        const updates = [
            {
                areaId: selectedAreaId,
                year: selectedYear,
                half: selectedHalf,
                amount: allocationAmount,
            },
        ];

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

            // 3. Al completarse, mostramos SweetAlert
            Swal.fire({
                icon: "success",
                title: "Funds saved successfully!",
                confirmButtonText: "OK",
            }).then(() => {
                // 4. Volvemos a cargar los datos
                fetchAllData();
            });

            // Reseteamos el formulario
            setSelectedAreaId("");
            setSelectedYear("");
            setSelectedHalf(1);
            setAllocationAmount(0);
        } catch (error) {
            Swal.fire("Error", String(error), "error");
        }
    };

    if (loading) {
        return <div>Cargando datos...</div>;
    }

    return (
        <div className="relative flex flex-col md:flex-row gap-6">
            {/* Left Column: Formulario de Asignación */}
            <div className="flex-1 p-4 bg-white rounded-md shadow-md">
                <h2 className="text-lg font-semibold mb-4">Asignar Fondos a un Área</h2>

                {/* Selector de Área */}
                <label htmlFor="area" className="block mb-2 text-sm font-medium">
                    Área
                </label>
                <select
                    id="area"
                    name="area"
                    value={selectedAreaId}
                    onChange={(e) => setSelectedAreaId(e.target.value)}
                    className="block w-full mb-4 rounded-md border border-gray-300 py-2 px-3 text-sm"
                >
                    <option value="">Seleccione un área</option>
                    {areas.map((area) => (
                        <option key={area.id} value={area.id}>
                            {area.name}
                        </option>
                    ))}
                </select>

                {/* Selector de Año */}
                <label htmlFor="year" className="block mb-2 text-sm font-medium">
                    Año
                </label>
                <select
                    id="year"
                    name="year"
                    value={selectedYear}
                    onChange={(e) => setSelectedYear(parseInt(e.target.value))}
                    className="block w-full mb-4 rounded-md border border-gray-300 py-2 px-3 text-sm"
                >
                    <option value="">Seleccione un año</option>
                    {years.map((year) => (
                        <option key={year} value={year}>
                            {year}
                        </option>
                    ))}
                </select>

                {/* Selector de Semestre */}
                <label className="block mb-2 text-sm font-medium">Semestre</label>
                <div className="mb-4 flex gap-6">
                    <label className="flex items-center text-sm">
                        <input
                            type="radio"
                            name="half"
                            value="1"
                            checked={selectedHalf === 1}
                            onChange={() => setSelectedHalf(1)}
                            className="mr-2"
                        />
                        1er Semestre
                    </label>
                    <label className="flex items-center text-sm">
                        <input
                            type="radio"
                            name="half"
                            value="2"
                            checked={selectedHalf === 2}
                            onChange={() => setSelectedHalf(2)}
                            className="mr-2"
                        />
                        2do Semestre
                    </label>
                </div>

                {/* Monto a Asignar */}
                <label htmlFor="amount" className="block mb-2 text-sm font-medium">
                    Monto
                </label>
                <input
                    id="amount"
                    name="amount"
                    type="number"
                    step="0.01"
                    min="0"
                    value={allocationAmount.toString()}
                    onChange={(e) => setAllocationAmount(parseFloat(e.target.value))}
                    className="block w-full mb-6 rounded-md border border-gray-300 py-2 px-3 text-sm"
                />

                <button
                    onClick={handleSubmit}
                    className="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-md text-sm"
                >
                    Guardar Fondos
                </button>
            </div>

            {/* Right Column: Vista Actual de Fondos */}
            <div className="flex-1 p-4 bg-white rounded-md shadow-md">
                <h2 className="text-lg font-semibold mb-4">Montos Actuales por Área</h2>
                <ul className="space-y-4">
                    {areas.map((area) => (
                        <li key={area.id} className="p-3 border rounded-md">
                            <h3 className="text-md font-medium mb-2">{area.name}</h3>
                            {area.funds.length === 0 ? (
                                <p className="text-sm text-gray-500">Sin fondos asignados aún</p>
                            ) : (
                                area.funds.map((fund) => (
                                    <p key={fund.fund_id || `${area.id}-${fund.half}`} className="text-sm text-gray-700 mb-1">
                                        <strong>Año:</strong> {fund.year ?? "N/A"} —{" "}
                                        {fund.half === 1 ? "1er Semestre:" : "2do Semestre:"}{" "}
                                        <span className="ml-2 font-semibold">
                                            ${fund.amount ? fund.amount.toFixed(2) : "0.00"}
                                        </span>
                                    </p>
                                ))
                            )}
                        </li>
                    ))}
                </ul>
            </div>
        </div>
    );
}