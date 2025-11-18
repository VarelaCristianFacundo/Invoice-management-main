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
        if (val.length >= 3) {
            const matches = items.filter((i) =>
                i.nombre.toLowerCase().includes(val.toLowerCase())
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
        onContableSelected(item, false);
    };

    // Cerrar sugerencias al hacer click fuera
    useEffect(() => {
        const handleClickOutside = (e: MouseEvent) => {
            if (containerRef.current && !containerRef.current.contains(e.target as Node)) {
                setShowSuggestions(false);
            }
        };
        document.addEventListener("mousedown", handleClickOutside);
        return () => document.removeEventListener("mousedown", handleClickOutside);
    }, []);

    // Crear nuevo
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
            onContableSelected(nuevo, true);
        } catch {
            Swal.fire("Error", "No se pudo crear el artículo contable.", "error");
        }
    };

    return (
        <div ref={containerRef} style={{ position: "relative", width: 300 }}>
            <label className="block text-sm font-medium mb-2">Artículo Contable</label>
            <input
                type="text"
                value={userInput}
                onChange={handleInputChange}
                className="border rounded w-full p-2"
                placeholder="Escriba las primeras 3 letras..."
            />
            {showSuggestions && (
                <ul
                    style={{
                        position: "absolute",
                        top: "100%",
                        left: 0,
                        width: "100%",
                        backgroundColor: "white",
                        border: "1px solid #ccc",
                        zIndex: 999,
                        margin: 0,
                        padding: 0,
                        listStyleType: "none",
                    }}
                >
                    {filtered.length > 0 ? (
                        filtered.map((item) => (
                            <li
                                key={item.id}
                                style={{ padding: "8px", cursor: "pointer" }}
                                onClick={() => handleSelect(item)}
                            >
                                {item.nombre} {item.codigo ? `- (${item.codigo})` : ""}
                            </li>
                        ))
                    ) : (
                        <li style={{ padding: "8px", color: "#999" }}>No hay resultados...</li>
                    )}
                    {userInput.length >= 3 &&
                        !filtered.some(
                            (i) => i.nombre.toLowerCase() === userInput.toLowerCase()
                        ) && (
                            <li style={{ padding: "8px", cursor: "pointer" }}>
                                <button
                                    onClick={handleCreateNew}
                                    style={{
                                        display: "flex",
                                        alignItems: "center",
                                        gap: "4px",
                                        backgroundColor: "transparent",
                                        border: "none",
                                        color: "blue",
                                        cursor: "pointer",
                                    }}
                                    type="button"
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
