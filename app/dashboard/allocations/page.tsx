import AllocationsForm from '@/app/ui/allocations/allocations-form';

export default function AllocationsPage() {
    return (
        <div className="p-6">
            <h1 className="mb-4 text-2xl font-semibold">Cantidad de Fondos por Área</h1>
            <AllocationsForm />
        </div>
    );
}
