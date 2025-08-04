'use client';

import { updateCustomer } from '@/app/lib/actions';
import { CustomerForm } from '@/app/lib/definitions';
import { isValidCuitCuil } from '@/app/lib/utils';
import { Button } from '@/app/ui/button';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { useState } from 'react';
import Swal from 'sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';

export default function EditCustomerForm({ customer }: { customer: CustomerForm }) {
  const router = useRouter();
  // Estado y lógica igual que en create
  const [cuitCuil, setCuitCuil] = useState(customer.cuit_cuil || '');
  const [cuitError, setCuitError] = useState('');

  const [cbuCvu, setCbuCvu] = useState(customer.cbu_cvu || '');
  const isCvu = cbuCvu.startsWith('000');
  const handleCbuCvuChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const digits = e.target.value.replace(/\D/g, '');
    setCbuCvu(digits);
  };

  const [state, setState] = useState<{
    errors?: {
      name?: string[];
      email?: string[];
      cuit_cuil?: string[];
      cbu_cvu?: string[];
      phone?: string[];
      iva_condition?: string[];
    };
    message?: string | null;
  }>({ errors: {}, message: null });



  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    // Validaciones
    if (cuitCuil.length !== 11 || !isValidCuitCuil(cuitCuil)) {
      setCuitError('CUIT/CUIL inválido.');
      return;
    }

    if (!cbuCvu) {
      return Swal.fire('Incomplete', `Debes completar el ${isCvu ? 'CVU' : 'CBU'}.`, 'info');
    }
    if (!isCvu && cbuCvu.startsWith('000')) {
      return Swal.fire('Error', 'Estás colocando un CVU en el campo CBU.', 'error');
    }

    const formData = {
      id: customer.id,
      name: (event.currentTarget as any).name.value,
      email: (event.currentTarget as any).email.value,
      cuit_cuil: (event.currentTarget as any).cuit_cuil.value,
      cbu_cvu: cbuCvu,
      phone: (event.currentTarget as any).phone.value,
      iva_condition: (event.currentTarget as any).iva_condition.value,
    };

    try {
      const result = await Swal.fire({
        title: 'Confirmar Actualización',
        text: '¿Está seguro de que desea actualizar este cliente?',
        icon: 'question',
        showCancelButton: true,
        confirmButtonText: 'Sí, actualizarlo',
        cancelButtonText: 'Cancelar',
      });

      if (!result.isConfirmed) return;

      const response = await updateCustomer(customer.id, formData);

      if (!response.success) throw new Error(response.message);

      await Swal.fire('Actualizado', response.message, 'success');
      router.push('/dashboard/customers');
      router.refresh();
    } catch (error: any) {
      console.error(error);
      await Swal.fire('Error', error.message || 'Ocurrió un error.', 'error');
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
              defaultValue={customer.name}
              className="peer block w-full rounded-md border border-gray-200 py-2 text-sm placeholder:text-gray-500"
            />
          </div>
        </div>

        {/* Email */}
        <div className="mb-4">
          <label htmlFor="email" className="mb-2 block text-sm font-medium">
            Correo del Proveedor
          </label>
          <div className="relative mt-2 rounded-md">
            <input
              id="email"
              name="email"
              type="email"
              defaultValue={customer.email}
              className="peer block w-full rounded-md border border-gray-200 py-2 text-sm placeholder:text-gray-500"
            />
          </div>
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
              defaultValue={customer.phone || ''}
            />
          </div>
          {/* Si usás validaciones */}
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
              defaultValue={customer?.iva_condition || 'Responsable Inscripto'}
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
          {state.errors?.cuit_cuil &&
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
        </div>
      </div>

      <div className="mt-6 flex justify-end gap-4">
        <Link
          href="/dashboard/customers"
          className="flex h-10 items-center rounded-lg bg-gray-100 px-4 text-sm font-medium text-gray-600 hover:bg-gray-200"
        >
          Cancelar
        </Link>
        <Button type="submit">Editar Proveedor</Button>
      </div>
    </form>
  );
}
