'use client';

import { useEffect } from 'react';

export default function Error({
  error,
  reset,
}: {
  error: Error & { digest?: string };
  reset: () => void;
}) {
  useEffect(() => {
    // Optionally log the error to an error reporting service
    console.error(error);
  }, [error]);

  return (
    <main className="flex h-full flex-col items-center justify-center">
      <h2 className="text-center">¡Algo salió mal!</h2>
      <button
        className="mt-4 rounded-md bg-gray-800 px-4 py-2 text-sm text-white transition-colors hover:bg-gray-700"
        onClick={
          // Intenta recuperarse intentando re-renderizar la ruta de facturas
          () => reset()
        }
      >
        Intentar de nuevo
      </button>
    </main>
  );
}