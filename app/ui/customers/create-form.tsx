'use client';

import { addCustomer } from '@/app/lib/actions';
import { Button } from '@/app/ui/button';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { useState } from 'react';
import Swal from 'sweetalert2';

interface State {
  errors: {
    name?: string[];
    email?: string[];
    cuit_cuil?: string[];
    cbu_cvu?: string[];
    phone?: string[];
    iva_condition?: string[];
  };
  message: string | null;
}
function isValidCuitCuil(cuit: string): boolean {
  if (!/^\d{11}$/.test(cuit)) return false;
  const multipliers = [5, 4, 3, 2, 7, 6, 5, 4, 3, 2];
  const digits = cuit.split('').map(Number);
  const check = digits
    .slice(0, 10)
    .reduce((acc, digit, idx) => acc + digit * multipliers[idx], 0);
  let verif = 11 - (check % 11);
  if (verif === 11) verif = 0;
  if (verif === 10) verif = 9;
  return digits[10] === verif;
}


export default function Form() {
  const [state, setState] = useState<State>({ errors: {}, message: null });
  const router = useRouter();
  const [cuitCuil, setCuitCuil] = useState('');
  const [cuitError, setCuitError] = useState('');
  // Estado para CBU/CVU y lógica dinámica
  const [cbuCvu, setCbuCvu] = useState('');
  const isCvu = cbuCvu.startsWith('000');

  const handleCbuCvuChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    // dejamos sólo dígitos
    const digits = e.target.value.replace(/\D/g, '');
    setCbuCvu(digits);
  };

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    if (cuitCuil.length !== 11 || !isValidCuitCuil(cuitCuil)) {
      setCuitError('CUIT/CUIL inválido.');
      return;
    }
    // Validaciones de CBU/CVU
    if (!cbuCvu) {
      return Swal.fire('Incomplete', `Debes completar el ${isCvu ? 'CVU' : 'CBU'}.`, 'info');
    }
    if (!isCvu && cbuCvu.startsWith('000')) {
      return Swal.fire('Error', 'Estás colocando un CVU en el campo CBU.', 'error');
    }

    const formData = {
      name: (event.currentTarget as any).name.value,
      email: (event.currentTarget as any).email.value,
      cuit_cuil: (event.currentTarget as any).cuit_cuil.value,
      cbu_cvu: cbuCvu,
      phone: (event.currentTarget as any).phone.value,
      iva_condition: (event.currentTarget as any).iva_condition.value,
    };


    try {
      const result = await Swal.fire({
        title: 'Confirmar Creación',
        text: '¿Está seguro de que desea agregar este proveedor?',
        icon: 'question',
        showCancelButton: true,
        confirmButtonText: 'Sí, agregar',
        cancelButtonText: 'Cancelar',
      });

      if (!result.isConfirmed) return;

      const response = await addCustomer(formData);

      if (!response.success) {
        // Captura errores de validación y muestra en pantalla
        setState({ errors: response.errors || {}, message: response.message });
        throw new Error(response.message);
      }

      await Swal.fire('Éxito', response.message, 'success');
      router.push('/dashboard/customers');
    } catch (error: any) {
      console.error(error);
      if (!error.errors) {
        await Swal.fire('Error', error.message || 'Ocurrió un error.', 'error');
      }
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <div className="rounded-md bg-gray-50 p-4 md:p-6">
        {/* Nombre */}
        <div className="mb-4">
          <label htmlFor="name" className="mb-2 block text-sm font-medium">
            Nombre del Proveedor
          </label>
          <div className="relative mt-2 rounded-md">
            <input
              id="name"
              name="name"
              type="text"
              placeholder="Ingresar el nombre completo"
              className="peer block w-full rounded-md border border-gray-200 py-2 text-sm placeholder:text-gray-500"
            />
          </div>
          {state.errors.name &&
            state.errors.name.map((error) => (
              <p key={error} className="mt-2 text-sm text-red-500">
                {error}
              </p>
            ))}
        </div>

        {/* Correo */}
        <div className="mb-4">
          <label htmlFor="email" className="mb-2 block text-sm font-medium">
            Correo del Proveedor
          </label>
          <div className="relative mt-2 rounded-md">
            <input
              id="email"
              name="email"
              type="email"
              placeholder="email@example.com"
              className="peer block w-full rounded-md border border-gray-200 py-2 text-sm placeholder:text-gray-500"
            />
          </div>
          {state.errors.email &&
            state.errors.email.map((error) => (
              <p key={error} className="mt-2 text-sm text-red-500">
                {error}
              </p>
            ))}
        </div>

        {/* Teléfono */}
        <div className="mb-4">
          <label htmlFor="phone" className="mb-2 block text-sm font-medium">
            Teléfono
          </label>
          <div className="relative mt-2 rounded-md">
            <input
              id="phone"
              name="phone"
              type="tel"
              placeholder="Ej: 1134567890"
              className="peer block w-full rounded-md border border-gray-200 py-2 text-sm placeholder:text-gray-500"
              pattern="\d{7,15}"
              maxLength={15}
            />
          </div>
          {/* Si en el futuro agregás errores para este campo */}
          {state.errors?.phone &&
            state.errors.phone.map((error) => (
              <p key={error} className="mt-2 text-sm text-red-500">{error}</p>
            ))}
        </div>

        <div className="mb-4">
          <label htmlFor="iva_condition" className="mb-2 block text-sm font-medium">
            Condición ante el IVA
          </label>
          <div className="relative mt-2 rounded-md">
            <select
              id="iva_condition"
              name="iva_condition"
              className="peer block w-full rounded-md border border-gray-200 py-2 text-sm placeholder:text-gray-500"
              defaultValue="Responsable Inscripto"
              required
            >
              <option value="Responsable Inscripto">Responsable Inscripto</option>
              <option value="Monotributista">Monotributista</option>
              <option value="Exento">Exento</option>
              <option value="Consumidor Final">Consumidor Final</option>
              <option value="No Responsable">No Responsable</option>
            </select>
          </div>
          {state.errors?.iva_condition &&
            state.errors.iva_condition.map((error) => (
              <p key={error} className="mt-2 text-sm text-red-500">{error}</p>
            ))}
        </div>


        {/* CUIT/CUIL */}
        <div className="mb-4">
          <label htmlFor="cuit_cuil" className="mb-2 block text-sm font-medium">
            CUIT/CUIL
          </label>
          <div className="relative mt-2 rounded-md">
            <input
              id="cuit_cuil"
              name="cuit_cuil"
              type="text"
              placeholder="Ingresar CUIT/CUIL"
              className="peer block w-full rounded-md border border-gray-200 py-2 text-sm placeholder:text-gray-500"
              value={cuitCuil}
              onChange={(e) => {
                const val = e.target.value.replace(/\D/g, '');
                setCuitCuil(val);
                if (val.length === 11 && !isValidCuitCuil(val)) {
                  setCuitError('CUIT/CUIL inválido.');
                } else {
                  setCuitError('');
                }
              }}
              maxLength={11}
            />
          </div>
          {/* Error en vivo */}
          {cuitError && (
            <p className="mt-2 text-sm text-red-500">{cuitError}</p>
          )}
          {/* Error backend */}
          {state.errors.cuit_cuil &&
            state.errors.cuit_cuil.map((error) => (
              <p key={error} className="mt-2 text-sm text-red-500">
                {error}
              </p>
            ))}
        </div>


        {/* CBU/CVU */}
        <div className="mb-4">
          <label htmlFor="cbu_cvu" className="mb-2 block text-sm font-medium">
            {isCvu ? 'CVU' : 'CBU'} <span className="text-red-500">*</span>
          </label>
          <div className="relative mt-2 rounded-md">
            <input
              id="cbu_cvu"
              name="cbu_cvu"
              type="text"
              placeholder={isCvu ? 'Ingresar CVU' : 'Ingresar CBU'}
              value={cbuCvu}
              onChange={handleCbuCvuChange}
              required
              className="peer block w-full rounded-md border border-gray-200 py-2 text-sm placeholder:text-gray-500"
            />
          </div>
          {state.errors.cbu_cvu &&
            state.errors.cbu_cvu.map((error) => (
              <p key={error} className="mt-2 text-sm text-red-500">
                {error}
              </p>
            ))}
        </div>
      </div>

      <div className="mt-6 flex justify-end gap-4">
        <Link
          href="/dashboard/customers"
          className="flex h-10 items-center rounded-lg bg-gray-100 px-4 text-sm font-medium text-gray-600 hover:bg-gray-200"
        >
          Cancelar
        </Link>
        <Button type="submit">Agregar Proveedor</Button>
      </div>
    </form>
  );
}
