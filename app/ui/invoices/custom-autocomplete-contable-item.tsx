"use client";
import React, { useEffect, useRef, useState } from "react";
import Swal from "sweetalert2";

export type ContableItem = { id: number; nombre: string; codigo?: string };

interface CustomAutocompleteContableProps {
    value?: ContableItem | null;
    onContableSelected: (contable: ContableItem, isNew?: boolean) => void;
}

export default function CustomAutocompleteContableItem({
    value,
    onContableSelected,
}: CustomAutocompleteContableProps) {
    const [items, setItems] = useState<ContableItem[]>([]);
    const [filtered, setFiltered] = useState<ContableItem[]>([]);
    const [userInput, setUserInput] = useState(value?.nombre ?? "");
    const [showSuggestions, setShowSuggestions] = useState(false);
    const [showAll, setShowAll] = useState(false); // <- NEW

    const containerRef = useRef<HTMLDivElement>(null);

    useEffect(() => {
        const fetchItems = async () => {
            try {
                const res = await fetch("/api/contable-items");
                if (!res.ok) throw new Error("Error al obtener artículos contables");
                const data = await res.json();
                setItems(data);
            } catch (error) {
                Swal.fire("Error", "Error al obtener artículos contables.", "error");
            }
        };
        fetchItems();
    }, []);

    const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        const val = e.target.value;
        setUserInput(val);
        setShowAll(false); // si escribe, salimos del modo "Ver lista"

        if (val.length >= 3) {
            const matches = items.filter((i) =>
                i.nombre.toLowerCase().includes(val.toLowerCase()),
            );
            setFiltered(matches);
            setShowSuggestions(true);
        } else {
            setFiltered([]);
            setShowSuggestions(false);
        }
    };

    const handleSelect = (item: ContableItem) => {
        setUserInput(item.nombre);
        setShowSuggestions(false);
        setShowAll(false);
        onContableSelected(item, false);
    };

    // cerrar sugerencias al hacer click fuera
    useEffect(() => {
        const handleClickOutside = (e: MouseEvent) => {
            if (containerRef.current && !containerRef.current.contains(e.target as Node)) {
                setShowSuggestions(false);
                setShowAll(false);
            }
        };
        document.addEventListener("mousedown", handleClickOutside);
        return () => document.removeEventListener("mousedown", handleClickOutside);
    }, []);

    // crear nuevo
    const handleCreateNew = async () => {
        try {
            const { value: codigo } = await Swal.fire({
                title: "Código de cuenta (opcional)",
                input: "text",
                showCancelButton: true,
                inputLabel: "Ingresá el código si aplica",
            });
            const { value: descripcion } = await Swal.fire({
                title: "Descripción (opcional)",
                input: "textarea",
                showCancelButton: true,
                inputLabel: "Agregá descripción si querés",
            });
            const res = await fetch("/api/contable-items", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({
                    nombre: userInput,
                    codigo: codigo || null,
                    descripcion: descripcion || null,
                }),
            });
            const nuevo = await res.json();
            setItems((prev) => [...prev, nuevo]);
            setUserInput(nuevo.nombre);
            setShowSuggestions(false);
            setShowAll(false);
            onContableSelected(nuevo, true);
        } catch {
            Swal.fire("Error", "No se pudo crear el artículo contable.", "error");
        }
    };

    // lista que realmente se muestra (filtrada o completa)
    const suggestions = showAll ? items : filtered;

    return (
        <div ref={containerRef} className="relative w-full max-w-md">
            <label className="block text-sm font-medium mb-2">Artículo Contable</label>

            <div className="flex gap-2 items-center">
                <input
                    type="text"
                    value={userInput}
                    onChange={handleInputChange}
                    className="border rounded w-full p-2 text-sm"
                    placeholder="Escriba las primeras 3 letras o use 'Ver lista'..."
                />
                <button
                    type="button"
                    onClick={() => {
                        setShowAll((prev) => !prev);
                        setShowSuggestions((prev) => !prev || !showAll); // abrir lista al activar
                        if (!showAll) {
                            setFiltered([]);
                        }
                    }}
                    className="rounded-lg bg-gray-800 px-3 py-2 text-xs font-medium text-white whitespace-nowrap hover:bg-gray-700"
                >
                    {showAll ? "Ocultar lista" : "Ver Lista"}
                </button>

            </div>

            {showSuggestions && (
                <ul
                    className="absolute z-50 mt-1 w-full max-h-60 overflow-y-auto bg-white border border-gray-300 rounded shadow-sm text-sm"
                >
                    {suggestions.length > 0 ? (
                        suggestions.map((item) => (
                            <li
                                key={item.id}
                                className="px-2 py-1 cursor-pointer hover:bg-gray-100"
                                onClick={() => handleSelect(item)}
                            >
                                {item.nombre} {item.codigo ? `- (${item.codigo})` : ""}
                            </li>
                        ))
                    ) : (
                        <li className="px-2 py-1 text-gray-400">No hay resultados...</li>
                    )}

                    {/* opción de crear nuevo cuando hay texto y no existe exactamente ese nombre */}
                    {userInput.length >= 3 &&
                        !items.some(
                            (i) => i.nombre.toLowerCase() === userInput.toLowerCase(),
                        ) && (
                            <li className="px-2 py-1">
                                <button
                                    onClick={handleCreateNew}
                                    type="button"
                                    className="text-blue-600 text-xs hover:underline"
                                >
                                    + Crear Nuevo Artículo &quot;{userInput}&quot;
                                </button>
                            </li>
                        )}
                </ul>
            )}
        </div>
    );
}
