// app/ui/login-form.tsx

'use client';

import { signIn } from 'next-auth/react';
import { useRouter } from 'next/navigation';
import { useState } from 'react';

const USER_TYPES = [
  { value: 'direccionejecutiva', label: 'Dirección Ejecutiva' },
  { value: 'contaduria', label: 'Contaduría' },
  { value: 'escuela', label: 'Escuela' },
  { value: 'eventos', label: 'Eventos' },
  { value: 'comunicaciones', label: 'Comunicación' },
  { value: 'sistemas', label: 'Sistemas' },
  { value: 'secretaria', label: 'Secretaría' },
  { value: 'tecnica', label: 'Técnica' },
  { value: 'desarrolloeintegracion', label: 'D+I' },
];

export default function LoginForm() {
  const router = useRouter();
  const [error, setError] = useState('');
  const [isSubmitting, setIsSubmitting] = useState(false);

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    if (isSubmitting) return;

    const username = e.currentTarget.username.value;
    const password = e.currentTarget.password.value;

    setError('');
    setIsSubmitting(true);

    try {
      const res = await signIn('credentials', {
        redirect: false,
        username,
        password,
      });

      if (res?.error) {
        console.error('Authentication failed:', res.error);
        setError('Credenciales inválidas.');
        setIsSubmitting(false);
      } else {
        router.push('/dashboard');
        router.refresh();
      }
    } catch (err) {
      console.error('Authentication error:', err);
      setError('Ocurrió un error al iniciar sesión. Intentá nuevamente.');
      setIsSubmitting(false);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-6">
      {error && <p className="text-red-500">{error}</p>}
      <div>
        <label className="block text-sm font-medium text-gray-700">
          Tipo de usuario
        </label>
        <div className="mt-1">
          <select
            name="username"
            required
            disabled={isSubmitting}
            defaultValue=""
            className="block w-full rounded-md border-gray-300 shadow-sm focus:border-sky-500 focus:ring-sky-500 disabled:cursor-not-allowed disabled:bg-gray-50 disabled:text-gray-500 sm:text-sm"
          >
            <option value="" disabled>
              Seleccioná un tipo de usuario
            </option>
            {USER_TYPES.map((type) => (
              <option key={type.value} value={type.value}>
                {type.label}
              </option>
            ))}
          </select>
        </div>
      </div>
      <div>
        <label className="block text-sm font-medium text-gray-700">
          Contraseña
        </label>
        <div className="mt-1">
          <input
            name="password"
            type="password"
            autoComplete="current-password"
            required
            disabled={isSubmitting}
            className="block w-full rounded-md border-gray-300 shadow-sm focus:border-sky-500 focus:ring-sky-500 disabled:cursor-not-allowed disabled:bg-gray-50 disabled:text-gray-500 sm:text-sm"
          />
        </div>
      </div>
      <div>
        <button
          type="submit"
          disabled={isSubmitting}
          aria-busy={isSubmitting}
          className="flex w-full items-center justify-center gap-2 rounded-md border border-transparent bg-gray-800 py-2 px-4 text-sm font-medium text-white shadow-sm transition-opacity hover:bg-sky-700 focus:outline-none focus:ring-2 focus:ring-sky-500 focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-60 disabled:hover:bg-gray-800"
        >
          {isSubmitting ? 'Iniciando sesión…' : 'Iniciar Sesión'}
        </button>
      </div>
    </form>
  );
}
