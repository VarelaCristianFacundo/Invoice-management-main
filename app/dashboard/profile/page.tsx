import { fetchAreas } from '@/app/lib/data';
import { roboto } from '@/app/ui/fonts';
import { authOptions } from '@/authOptions';
import {
    AtSymbolIcon,
    BuildingOffice2Icon,
    IdentificationIcon,
    ShieldCheckIcon,
    UserCircleIcon,
} from '@heroicons/react/24/outline';
import { Metadata } from 'next';
import { getServerSession } from 'next-auth/next';
import { redirect } from 'next/navigation';

export const metadata: Metadata = {
    title: 'Mi Perfil',
};

const ROLE_LABELS: Record<string, string> = {
    admin: 'Director Ejecutivo',
    usuario: 'Superusuario',
    usuario_administracion: 'Usuario · Administración',
    usuario_contable: 'Usuario · Contable',
    usuario_logistica: 'Usuario · Logística',
    usuario_marketing: 'Usuario · Marketing',
    usuario_produccion: 'Usuario · Producción',
    usuario_rrhh: 'Usuario · Recursos Humanos',
    usuario_sistemas: 'Usuario · Sistemas',
    usuario_ventas: 'Usuario · Ventas',
    tesorero: 'Tesorero',
    usuario_presupuestos: 'Usuario · Presupuestos',
};

function getRoleBadgeStyle(role: string) {
    if (role === 'admin') return 'bg-purple-100 text-purple-700 ring-purple-200';
    if (role === 'tesorero') return 'bg-amber-100 text-amber-700 ring-amber-200';
    if (role === 'usuario' || role === 'usuario_presupuestos')
        return 'bg-emerald-100 text-emerald-700 ring-emerald-200';
    return 'bg-sky-100 text-sky-700 ring-sky-200';
}

function getInitials(name?: string | null) {
    if (!name) return '?';
    const parts = name.trim().split(/\s+/).slice(0, 2);
    return parts.map((p) => p[0]?.toUpperCase() ?? '').join('') || '?';
}

export default async function ProfilePage() {
    const session = await getServerSession(authOptions);

    if (!session || !session.user) {
        redirect('/login');
    }

    const user = session.user;
    const role = user.role || 'usuario';
    const roleLabel = ROLE_LABELS[role] ?? role;
    const badgeStyle = getRoleBadgeStyle(role);

    let areaName: string | null = null;
    if (user.area_id) {
        const areas = await fetchAreas();
        areaName = areas.find((a) => a.id === user.area_id)?.name ?? null;
    }

    return (
        <div className="w-full">
            <h1 className={`${roboto.className} mb-6 text-2xl`}>Mi Perfil</h1>

            <div className="rounded-xl bg-gray-50 p-6 shadow-sm md:p-8">
                <div className="flex flex-col items-center gap-5 border-b border-gray-200 pb-6 md:flex-row md:items-center md:gap-6 md:pb-8">
                    <div className="flex h-24 w-24 items-center justify-center rounded-full bg-gradient-to-br from-sky-400 to-sky-600 text-3xl font-semibold text-white shadow-md">
                        {getInitials(user.name)}
                    </div>
                    <div className="flex flex-col items-center text-center md:items-start md:text-left">
                        <h2 className={`${roboto.className} text-2xl font-semibold text-gray-900`}>
                            {user.name ?? 'Sin nombre'}
                        </h2>
                        <p className="mt-1 text-sm text-gray-500">{user.email}</p>
                        <span
                            className={`mt-3 inline-flex items-center gap-1.5 rounded-full px-3 py-1 text-xs font-medium ring-1 ring-inset ${badgeStyle}`}
                        >
                            <ShieldCheckIcon className="h-3.5 w-3.5" />
                            {roleLabel}
                        </span>
                    </div>
                </div>

                <div className="grid grid-cols-1 gap-4 pt-6 md:grid-cols-2 md:pt-8">
                    <InfoRow
                        icon={<UserCircleIcon className="h-5 w-5 text-gray-400" />}
                        label="Nombre completo"
                        value={user.name ?? '—'}
                    />
                    <InfoRow
                        icon={<AtSymbolIcon className="h-5 w-5 text-gray-400" />}
                        label="Correo electrónico"
                        value={user.email ?? '—'}
                    />
                    <InfoRow
                        icon={<ShieldCheckIcon className="h-5 w-5 text-gray-400" />}
                        label="Rol"
                        value={roleLabel}
                    />
                    <InfoRow
                        icon={<BuildingOffice2Icon className="h-5 w-5 text-gray-400" />}
                        label="Área asignada"
                        value={areaName ?? 'Sin área asignada'}
                    />
                    {user.id ? (
                        <InfoRow
                            icon={<IdentificationIcon className="h-5 w-5 text-gray-400" />}
                            label="ID de usuario"
                            value={user.id}
                            mono
                        />
                    ) : null}
                </div>
            </div>
        </div>
    );
}

function InfoRow({
    icon,
    label,
    value,
    mono = false,
}: {
    icon: React.ReactNode;
    label: string;
    value: string;
    mono?: boolean;
}) {
    return (
        <div className="flex items-start gap-3 rounded-lg bg-white p-4 ring-1 ring-gray-100">
            <div className="mt-0.5">{icon}</div>
            <div className="min-w-0 flex-1">
                <p className="text-xs uppercase tracking-wide text-gray-500">{label}</p>
                <p
                    className={`mt-0.5 break-words text-sm text-gray-900 ${
                        mono ? 'font-mono' : ''
                    }`}
                >
                    {value}
                </p>
            </div>
        </div>
    );
}
