// app/ui/autocomplete.tsx
"use client";

import React, { useEffect, useRef, useState } from "react";
import Swal from "sweetalert2";

export type Program = { id: string; name: string };

interface CustomAutocompleteProps {
    onProgramSelected: (programName: string, isNew?: boolean) => void;
    initialValue?: string;
}

export default function CustomAutocompleteProgram({
    onProgramSelected,
    initialValue = "",
}: CustomAutocompleteProps) {
    const [allPrograms, setAllPrograms] = useState<Program[]>([]);
    const [filtered, setFiltered] = useState<Program[]>([]);
    const [userInput, setUserInput] = useState(initialValue);
    const [showSuggestions, setShowSuggestions] = useState(false);

    const containerRef = useRef<HTMLDivElement>(null);

    // 1. Cargar la lista completa de programas
    useEffect(() => {
        const fetchPrograms = async () => {
            try {
                const res = await fetch("/api/programs");
                if (!res.ok) throw new Error("Error fetching programs");
                const data = await res.json();
                setAllPrograms(data);
            } catch (error) {
                console.error(error);
                Swal.fire("Error", "Error fetching programs.", "error");
            }
        };
        fetchPrograms();
    }, []);

    // 2. Filtrar mientras se teclea (si la cadena tiene 3 o más letras)
    const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        const inputVal = e.target.value;
        setUserInput(inputVal);

        if (inputVal.length >= 3) {
            const filterResult = allPrograms.filter((p) =>
                p.name.toLowerCase().includes(inputVal.toLowerCase())
            );
            setFiltered(filterResult);
            setShowSuggestions(true);
        } else {
            setFiltered([]);
            setShowSuggestions(false);
        }
    };

    // 3. Al seleccionar una sugerencia
    const handleSelectProgram = (prog: Program) => {
        setUserInput(prog.name);
        setShowSuggestions(false);
        // Se notifica al padre que se seleccionó un programa existente.
        onProgramSelected(prog.name, false);
    };

    // 4. Cerrar sugerencias al hacer clic fuera
    useEffect(() => {
        const handleClickOutside = (e: MouseEvent) => {
            if (
                containerRef.current &&
                !containerRef.current.contains(e.target as Node)
            ) {
                setShowSuggestions(false);
            }
        };
        document.addEventListener("mousedown", handleClickOutside);
        return () =>
            document.removeEventListener("mousedown", handleClickOutside);
    }, []);

    // 5. Función para indicar que se desea crear un nuevo programa
    const handleCreateNewProgram = () => {
        // No se hace llamado al endpoint aquí; simplemente se informa al padre
        // y se actualiza la entrada del usuario.
        onProgramSelected(userInput, true);
        setShowSuggestions(false);
    };

    return (
        <div ref={containerRef} style={{ position: "relative", width: 300 }}>
            <label className="block text-sm font-medium mb-2">Programa</label>
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
                        filtered.map((prog) => (
                            <li
                                key={prog.id}
                                style={{ padding: "8px", cursor: "pointer" }}
                                onClick={() => handleSelectProgram(prog)}
                            >
                                {prog.name}
                            </li>
                        ))
                    ) : (
                        <li style={{ padding: "8px", color: "#999" }}>No hay resultados...</li>
                    )}
                    {/* Si no hay match exacto, mostrar botón para crear nuevo programa */}
                    {userInput.length >= 3 &&
                        !filtered.some(
                            (p) => p.name.toLowerCase() === userInput.toLowerCase()
                        ) && (
                            <li style={{ padding: "8px", cursor: "pointer" }}>
                                <button
                                    onClick={handleCreateNewProgram}
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
                                    + Crear Nuevo Programa &quot;{userInput}&quot;
                                </button>
                            </li>
                        )}
                </ul>
            )}
        </div>
    );
}
