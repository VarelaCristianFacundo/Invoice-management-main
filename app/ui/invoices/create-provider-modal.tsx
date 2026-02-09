'use client';

import { useRouter } from 'next/navigation';

interface CreateProviderModalProps {
    companyId: number;
    onProviderCreated: () => void;
}

export default function CreateProviderModal({
    companyId,
}: CreateProviderModalProps) {
    const router = useRouter();

    const handleClick = () => {
        // Guardar la página actual en sessionStorage
        sessionStorage.setItem('returnToInvoiceCreate', 'true');

        // Navegar al formulario de crear proveedor
        router.push('/dashboard/customers/create');
    };

    return (
        <button
            onClick={handleClick}
            className="px-3 py-2 rounded text-sm font-medium bg-green-500 text-white hover:bg-green-600 transition-colors"
        >
            + Proveedor
        </button>
    );
}
