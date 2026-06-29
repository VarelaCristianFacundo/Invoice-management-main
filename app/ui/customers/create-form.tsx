'use client';

import { addCustomer } from '@/app/lib/actions';
import { Button } from '@/app/ui/button';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { useMemo, useState } from 'react';
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

  const [cbuCvu, setCbuCvu] = useState('');
  const isCvu = useMemo(() => cbuCvu.startsWith('000'), [cbuCvu]);

  const handleCbuCvuChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const digits = e.target.value.replace(/\D/g, '');
    setCbuCvu(digits);
  };

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();

    const formEl = event.currentTarget as any;

    const name = String(formEl.name.value || '').trim();
    const email = String(formEl.email.value || '').trim();
    const phone = String(formEl.phone.value || '').trim();
    const ivaCondition = String(formEl.iva_condition.value || '').trim();

    // 1) Name is mandatory
    if (!name) {
      await Swal.fire('Datos incompletos', 'Debes completar el nombre del proveedor.', 'info');
      return;
    }

    // 2) If CUIT is provided, validate it (optional field, but if present must be valid)
    if (cuitCuil.length > 0) {
      if (cuitCuil.length !== 11 || !isValidCuitCuil(cuitCuil)) {
        setCuitError('CUIT/CUIL inválido.');
        return;
      }
    }

    // 3) Warning if CUIT and/or CBU missing, but allow continue
    const missingCuit = cuitCuil.length === 0;
    const missingCbu = cbuCvu.length === 0;

    if (missingCuit || missingCbu) {
      const detailParts: string[] = [];
      if (missingCuit) detailParts.push('CUIT/CUIL');
      if (missingCbu) detailParts.push('CBU/CVU');

      const warnResult = await Swal.fire({
        title: 'Faltan datos fiscales/bancarios',
        html: `
          <p>Estás por crear el proveedor sin completar:</p>
          <p><b>${detailParts.join(' y ')}</b></p>
          <p class="mt-2">Podés crearlo igual, pero luego vas a tener que completar esos datos para operar normalmente (por ejemplo, pagos/transferencias).</p>
        `,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Crear igual',
        cancelButtonText: 'Volver y completar',
      });

      if (!warnResult.isConfirmed) return;
    }

    // 4) Build payload with optional fields as undefined (not null) to avoid TS issues
    const payload = {
      name,
      email: email || undefined,
      cuit_cuil: cuitCuil || undefined,
      cbu_cvu: cbuCvu || undefined,
      phone: phone || undefined,
      iva_condition: ivaCondition || undefined,
      company_id: Number(formEl.company_id.value),
      mode: 'loose' as const,
    };


    try {
      const result = await Swal.fire({
        title: 'Confirmar creación',
        text: '¿Estás seguro de que querés agregar este proveedor?',
        icon: 'question',
        showCancelButton: true,
        confirmButtonText: 'Sí, agregar',
        cancelButtonText: 'Cancelar',
      });

      if (!result.isConfirmed) return;

      const response = await addCustomer(payload);

      if (!response.success) {
        setState({ errors: response.errors || {}, message: response.message });
        throw new Error(response.message);
      }

      await Swal.fire('Proveedor creado', response.message, 'success');

      // Verificar si viene de crear facturas
      const fromInvoiceCreate = typeof window !== 'undefined'
        ? sessionStorage.getItem('returnToInvoiceCreate')
        : false;

      if (fromInvoiceCreate) {
        sessionStorage.removeItem('returnToInvoiceCreate');
        router.back();
      } else {
        router.push('/dashboard/customers');
      }
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
            Nombre del Proveedor <span className="text-red-500">*</span>
          </label>
          <div className="relative mt-2 rounded-md">
            <input
              id="name"
              name="name"
              type="text"
              placeholder="Ingresar el nombre / razón social"
              className="peer block w-full rounded-md border border-gray-200 py-2 text-sm placeholder:text-gray-500"
              required
            />
          </div>
          {state.errors.name?.map((error) => (
            <p key={error} className="mt-2 text-sm text-red-500">
              {error}
            </p>
          ))}
        </div>

        {/* Empresa */}
        <div className="mb-4">
          <label htmlFor="company_id" className="mb-2 block text-sm font-medium">
            Empresa <span className="text-red-500">*</span>
          </label>
          <div className="relative mt-2 rounded-md">
            <select
              id="company_id"
              name="company_id"
              required
              className="peer block w-full rounded-md border border-gray-200 py-2 text-sm placeholder:text-gray-500"
              defaultValue="1"
            >
              <option value="1">CAMARCO</option>
              <option value="2">FODECO</option>
            </select>
          </div>
        </div>

        {/* Correo */}
        <div className="mb-4">
          <label htmlFor="email" className="mb-2 block text-sm font-medium">
            Correo del Proveedor (opcional)
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
          {state.errors.email?.map((error) => (
            <p key={error} className="mt-2 text-sm text-red-500">
              {error}
            </p>
          ))}
        </div>

        {/* Teléfono */}
        <div className="mb-4">
          <label htmlFor="phone" className="mb-2 block text-sm font-medium">
            Teléfono (opcional)
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
          {state.errors.phone?.map((error) => (
            <p key={error} className="mt-2 text-sm text-red-500">
              {error}
            </p>
          ))}
        </div>

        {/* IVA */}
        <div className="mb-4">
          <label htmlFor="iva_condition" className="mb-2 block text-sm font-medium">
            Condición ante el IVA (opcional)
          </label>
          <div className="relative mt-2 rounded-md">
            <select
              id="iva_condition"
              name="iva_condition"
              className="peer block w-full rounded-md border border-gray-200 py-2 text-sm placeholder:text-gray-500"
              defaultValue=""
            >
              <option value="">Sin especificar</option>
              <option value="Responsable Inscripto">Responsable Inscripto</option>
              <option value="Monotributista">Monotributista</option>
              <option value="Exento">Exento</option>
              <option value="Consumidor Final">Consumidor Final</option>
              <option value="No Responsable">No Responsable</option>
            </select>
          </div>
          {state.errors.iva_condition?.map((error) => (
            <p key={error} className="mt-2 text-sm text-red-500">
              {error}
            </p>
          ))}
        </div>

        {/* CUIT/CUIL */}
        <div className="mb-4">
          <label htmlFor="cuit_cuil" className="mb-2 block text-sm font-medium">
            CUIT/CUIL (opcional)
          </label>
          <div className="relative mt-2 rounded-md">
            <input
              id="cuit_cuil"
              name="cuit_cuil"
              type="text"
              placeholder="11 dígitos (solo números)"
              className="peer block w-full rounded-md border border-gray-200 py-2 text-sm placeholder:text-gray-500"
              value={cuitCuil}
              onChange={(e) => {
                const val = e.target.value.replace(/\D/g, '');
                setCuitCuil(val);

                // Validate only when it reaches 11 digits
                if (val.length === 11 && !isValidCuitCuil(val)) {
                  setCuitError('CUIT/CUIL inválido.');
                } else {
                  setCuitError('');
                }
              }}
              maxLength={11}
            />
          </div>
          {cuitError && <p className="mt-2 text-sm text-red-500">{cuitError}</p>}
          {state.errors.cuit_cuil?.map((error) => (
            <p key={error} className="mt-2 text-sm text-red-500">
              {error}
            </p>
          ))}
        </div>

        {/* CBU/CVU */}
        <div className="mb-4">
          <label htmlFor="cbu_cvu" className="mb-2 block text-sm font-medium">
            {isCvu ? 'CVU' : 'CBU'} (opcional)
          </label>
          <div className="relative mt-2 rounded-md">
            <input
              id="cbu_cvu"
              name="cbu_cvu"
              type="text"
              placeholder={isCvu ? 'Ingresar CVU (solo números)' : 'Ingresar CBU (solo números)'}
              value={cbuCvu}
              onChange={handleCbuCvuChange}
              className="peer block w-full rounded-md border border-gray-200 py-2 text-sm placeholder:text-gray-500"
            />
          </div>
          {state.errors.cbu_cvu?.map((error) => (
            <p key={error} className="mt-2 text-sm text-red-500">
              {error}
            </p>
          ))}
        </div>
        {/* Info block */}
        <div className="mt-2 rounded-md border border-yellow-200 bg-yellow-50 p-3 text-sm text-yellow-900">
          Podés crear el proveedor únicamente con el nombre.
          <br />
          El <b>CUIT/CUIL</b> y el <b>CBU/CVU</b> pueden completarse más adelante, pero serán obligatorios para poder realizar pagos.
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
