"use client";

import { Fragment, useCallback, useEffect, useState } from "react";
import Swal from "sweetalert2";
import "sweetalert2/dist/sweetalert2.min.css";

type Line = {
    allocation_id: string;
    project_id: string;
    project_name: string;
    program: string | null;
    allocated: number;
    executed: number;
};

type Fund = {
    year: number;
    half: number;
    allocated: number;
    executed: number;
    lines: Line[];
};

type Area = {
    id: string;
    name: string;
    funds: Fund[];
};

export default function AreaFundsView() {
    const [areas, setAreas] = useState<Area[]>([]);
    const [loading, setLoading] = useState<boolean>(true);
    const [selectedArea, setSelectedArea] = useState<Area | null>(null);
    const [search, setSearch] = useState<string>("");
    const [selectedCompany, setSelectedCompany] = useState<number>(1); // Default CAMARCO
    // Filas (año/semestre) expandidas para ver el detalle de líneas.
    const [expanded, setExpanded] = useState<Record<string, boolean>>({});

    const formatMoney = (value: number) =>
        value.toLocaleString("es-AR", {
            style: "currency",
            currency: "ARS",
            minimumFractionDigits: 2,
        });

    const fetchAreaFunds = useCallback(async () => {
        try {
            setLoading(true);

            const res = await fetch(
                `/api/area-funds-summary?companyId=${selectedCompany}`
            );
            if (!res.ok) throw new Error("Error fetching area funds data");

            const data = await res.json();
            setAreas(data);
            setSelectedArea(data[0] || null);
            setExpanded({});
        } catch (error) {
            console.error("Error fetching data:", error);
            Swal.fire(
                "Error",
                "Error fetching area funds. Please try again later.",
                "error"
            );
        } finally {
            setLoading(false);
        }
    }, [selectedCompany]);

    useEffect(() => {
        fetchAreaFunds();
    }, [fetchAreaFunds]);

    const filteredAreas = areas.filter((area) =>
        area.name.toLowerCase().includes(search.toLowerCase())
    );

    if (loading) {
        return <div className="p-6">Cargando datos...</div>;
    }

    return (
        <div className="p-6 bg-gray-100 rounded-md shadow-md">
            <h2 className="text-lg font-semibold mb-4">Fondos por Área y Semestre</h2>

            {/* Selector de compañía */}
            <div className="flex gap-4 mb-4">
                <button
                    className={`px-4 py-2 rounded ${selectedCompany === 1 ? "bg-gray-800 text-white" : "bg-gray-300"
                        }`}
                    onClick={() => setSelectedCompany(1)}
                >
                    CAMARCO
                </button>
                <button
                    className={`px-4 py-2 rounded ${selectedCompany === 2 ? "bg-gray-800 text-white" : "bg-gray-300"
                        }`}
                    onClick={() => setSelectedCompany(2)}
                >
                    FODECO
                </button>
            </div>

            {/* Search Bar */}
            <div className="mb-4">
                <input
                    type="text"
                    placeholder="Buscar área..."
                    value={search}
                    onChange={(e) => setSearch(e.target.value)}
                    className="w-full rounded-md border border-gray-300 py-2 px-3 text-sm"
                />
            </div>

            <div className="flex flex-col md:flex-row gap-6">
                {/* Sidebar with Areas */}
                <div className="flex-shrink-0 w-full md:w-1/4">
                    <ul className="space-y-2 border border-gray-300 rounded-md bg-white">
                        {filteredAreas.map((area) => (
                            <li
                                key={area.id}
                                className={`p-3 cursor-pointer ${selectedArea?.id === area.id
                                    ? "bg-blue-100 text-blue-600"
                                    : "hover:bg-gray-200"
                                    }`}
                                onClick={() => setSelectedArea(area)}
                            >
                                {area.name}
                            </li>
                        ))}
                    </ul>
                </div>

                {/* Main Content */}
                <div className="flex-1">
                    {selectedArea ? (
                        <>
                            <div className="mb-4 flex flex-wrap items-baseline gap-2">
                                <h3 className="text-md font-medium">{selectedArea.name}</h3>
                                <span className="text-xs text-gray-500">
                                    El monto de cada semestre es la suma de sus líneas de presupuesto.
                                </span>
                            </div>
                            {selectedArea.funds.length === 0 ? (
                                <p className="text-sm text-gray-500">
                                    Sin fondos asignados aún
                                </p>
                            ) : (
                                <table className="w-full text-sm border-collapse border border-gray-300 bg-white">
                                    <thead>
                                        <tr className="bg-gray-200">
                                            <th className="border border-gray-300 px-2 py-1 text-left">
                                                Año
                                            </th>
                                            <th className="border border-gray-300 px-2 py-1 text-left">
                                                Semestre
                                            </th>
                                            <th className="border border-gray-300 px-2 py-1 text-left">
                                                Líneas
                                            </th>
                                            <th className="border border-gray-300 px-2 py-1 text-left">
                                                Asignado
                                            </th>
                                            <th className="border border-gray-300 px-2 py-1 text-left">
                                                Abonado
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {selectedArea.funds.map((fund) => {
                                            const rowKey = `${selectedArea.id}-${fund.year}-${fund.half}`;
                                            const isExpanded = Boolean(expanded[rowKey]);
                                            const lines = fund.lines ?? [];

                                            return (
                                                <Fragment key={rowKey}>
                                                    <tr className="font-medium">
                                                        <td className="border border-gray-300 px-2 py-1">
                                                            {fund.year}
                                                        </td>
                                                        <td className="border border-gray-300 px-2 py-1">
                                                            {fund.half === 1
                                                                ? "1er Semestre"
                                                                : "2do Semestre"}
                                                        </td>
                                                        <td className="border border-gray-300 px-2 py-1">
                                                            {lines.length > 0 ? (
                                                                <button
                                                                    type="button"
                                                                    onClick={() =>
                                                                        setExpanded((prev) => ({
                                                                            ...prev,
                                                                            [rowKey]: !prev[rowKey],
                                                                        }))
                                                                    }
                                                                    className="text-blue-600 hover:underline"
                                                                >
                                                                    {isExpanded ? "- " : "+ "}
                                                                    {lines.length}{" "}
                                                                    {lines.length === 1
                                                                        ? "línea"
                                                                        : "líneas"}
                                                                </button>
                                                            ) : (
                                                                <span className="text-gray-500">-</span>
                                                            )}
                                                        </td>
                                                        <td className="border border-gray-300 px-2 py-1">
                                                            {formatMoney(fund.allocated)}
                                                        </td>
                                                        <td className="border border-gray-300 px-2 py-1">
                                                            {formatMoney(fund.executed)}
                                                        </td>
                                                    </tr>

                                                    {isExpanded &&
                                                        lines.map((line) => (
                                                            <tr
                                                                key={line.allocation_id}
                                                                className="bg-gray-50 text-xs text-gray-700"
                                                            >
                                                                <td className="border border-gray-300 px-2 py-1" />
                                                                <td
                                                                    className="border border-gray-300 px-2 py-1"
                                                                    colSpan={2}
                                                                >
                                                                    {line.project_name}
                                                                    {line.program ? (
                                                                        <span className="text-gray-500">
                                                                            {" "}
                                                                            / {line.program}
                                                                        </span>
                                                                    ) : null}
                                                                </td>
                                                                <td className="border border-gray-300 px-2 py-1">
                                                                    {formatMoney(line.allocated)}
                                                                </td>
                                                                <td className="border border-gray-300 px-2 py-1">
                                                                    {formatMoney(line.executed)}
                                                                </td>
                                                            </tr>
                                                        ))}
                                                </Fragment>
                                            );
                                        })}
                                    </tbody>
                                </table>
                            )}
                        </>
                    ) : (
                        <p className="text-sm text-gray-500">
                            Seleccione un área para ver los fondos
                        </p>
                    )}
                </div>
            </div>
        </div>
    );
}
