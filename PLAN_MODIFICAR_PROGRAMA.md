# Plan de Implementación: Modificación del Programa de un Proyecto

## Objetivo
Permitir a los usuarios modificar el programa al que pertenece un proyecto ya existente, desde la vista de edición de presupuestos/proyectos. 

## Cambios Realizados Previamente
- Se han reemplazado los textos hardcodeados `No Program` por `Proyecto sin programa` y `No Areas` por `Area sin programa` en la respuesta de la API `/api/budgets/route.ts`.

## Cambios Propuestos

Para permitir la edición del programa, se requiere actualizar el flujo desde el componente visual (Autocompletado) hasta la acción del servidor que actualiza la base de datos.

### 1. Actualizar el Componente Autocomplete
**Archivo:** `app/ui/autocomplete.tsx`
- **Cambio:** Agregar una prop opcional `initialValue?: string`.
- **Lógica:** Usar `initialValue` para inicializar el estado `userInput`. De esta forma, al abrir el formulario de edición, el input mostrará el programa actualmente asignado al proyecto.

### 2. Modificar el Formulario de Edición de Proyectos
**Archivo:** `app/ui/budgets/edit-form.tsx`
- **Cambio:** Integrar `<CustomAutocompleteProgram />`.
- **Lógica:**
  - Importar `createProgram` desde `app/lib/actions.ts`.
  - Añadir estados locales `programToUse` (inicializado en `budget.program`) y `newProgramCandidate`.
  - Colocar el componente `<CustomAutocompleteProgram initialValue={budget.program} ... />` en el JSX del formulario.
  - En la función `handleSubmit`:
    - Si `newProgramCandidate` tiene texto, ejecutar `await createProgram(newProgramCandidate)` para crearlo on-the-fly en la base de datos.
    - Asegurarse de adjuntar el nombre del programa final (`programToUse` o `newProgramCandidate`) al `formData` antes de enviarlo: `formData.set('program', programFinal)`.

### 3. Actualizar la Acción del Servidor
**Archivo:** `app/lib/actions.ts` -> función `updateBudgetProject`
- **Cambio:** Extraer y actualizar el campo `program`.
- **Lógica:**
  - Leer el valor del programa: `const program = String(formData.get('program') ?? '').trim() || null;`
  - En la consulta SQL que actualiza la tabla `budget_allocations`:
    - Modificar la consulta: 
      ```sql
      UPDATE budget_allocations
      SET allocated_amount = $1,
          program = $3
      WHERE project_id = $2
      ```
    - Pasar el valor extraído en la variable `$3`.

## Verificación

- Se verificará que el input de programa muestre el actual.
- Al cambiar el programa a uno existente o crear uno nuevo, el backend lo actualizará sin afectar el presupuesto o estado.
