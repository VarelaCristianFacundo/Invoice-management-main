// app/login/page.tsx

import CamarcoLogo from '@/app/ui/camarco-logo';
import LoginForm from '@/app/ui/login-form';
import { roboto } from '@/app/ui/fonts';
import { Metadata } from 'next';
import { ShieldCheckIcon, DocumentTextIcon, ChartBarSquareIcon } from '@heroicons/react/24/outline';

export const metadata: Metadata = {
  title: 'Ingresar · Camarco',
};

const features = [
  {
    icon: DocumentTextIcon,
    title: 'Gestión centralizada',
    desc: 'Facturas, presupuestos y aprobaciones en un solo lugar.',
  },
  {
    icon: ChartBarSquareIcon,
    title: 'Reportes en tiempo real',
    desc: 'Dashboards actualizados para decisiones informadas.',
  },
  {
    icon: ShieldCheckIcon,
    title: 'Acceso seguro',
    desc: 'Control de roles y permisos por área y función.',
  },
];

export default function LoginPage() {
  return (
    <main className={`${roboto.className} flex min-h-screen`}>
      {/* ── Left brand panel ─────────────────────────────── */}
      <div className="relative hidden w-[46%] flex-col justify-between overflow-hidden bg-gray-950 px-12 py-10 lg:flex">
        {/* Subtle dot-grid texture */}
        <div
          className="pointer-events-none absolute inset-0"
          style={{
            backgroundImage:
              'radial-gradient(circle, rgba(255,255,255,0.04) 1px, transparent 1px)',
            backgroundSize: '28px 28px',
          }}
        />
        {/* Red accent gradient top-left */}
        <div className="pointer-events-none absolute -left-24 -top-24 h-96 w-96 rounded-full bg-red-600/20 blur-3xl" />
        {/* Soft glow bottom-right */}
        <div className="pointer-events-none absolute -bottom-32 -right-16 h-80 w-80 rounded-full bg-rose-800/20 blur-3xl" />

        {/* Logo */}
        <div className="relative flex items-center gap-3">
          <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-white/10 p-2 ring-1 ring-white/10">
            <CamarcoLogo />
          </div>
          <span className="text-sm font-semibold tracking-wide text-white/80">
            Facturas Camarco
          </span>
        </div>

        {/* Headline */}
        <div className="relative space-y-6">
          <p className="text-[11px] font-semibold uppercase tracking-[0.2em] text-red-400">
            Plataforma interna
          </p>
          <h1 className="text-4xl font-bold leading-tight text-white">
            Gestión de facturas,{' '}
            <span className="bg-gradient-to-r from-red-400 to-rose-400 bg-clip-text text-transparent">
              sin fricción.
            </span>
          </h1>
          <p className="max-w-sm text-sm leading-relaxed text-white/50">
            Controlá presupuestos, seguí pagos y coordiná con tu equipo desde
            una sola plataforma diseñada para Camarco.
          </p>

          {/* Feature list */}
          <ul className="mt-8 space-y-5">
            {features.map(({ icon: Icon, title, desc }) => (
              <li key={title} className="flex items-start gap-4">
                <div className="mt-0.5 flex h-8 w-8 shrink-0 items-center justify-center rounded-lg bg-white/5 ring-1 ring-white/10">
                  <Icon className="h-4 w-4 text-red-400" />
                </div>
                <div>
                  <p className="text-sm font-semibold text-white/90">{title}</p>
                  <p className="text-xs leading-relaxed text-white/40">{desc}</p>
                </div>
              </li>
            ))}
          </ul>
        </div>

        {/* Footer note */}
        <p className="relative text-xs text-white/25">
          © {new Date().getFullYear()} Camarco · Solo para uso interno
        </p>
      </div>

      {/* ── Right form panel ─────────────────────────────── */}
      <div className="flex flex-1 flex-col items-center justify-center bg-white px-6 py-12">
        {/* Mobile logo */}
        <div className="mb-8 flex items-center gap-3 lg:hidden">
          <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-gray-900 p-2">
            <CamarcoLogo />
          </div>
          <span className="text-sm font-semibold text-gray-800">Facturas Camarco</span>
        </div>

        <div className="w-full max-w-[380px]">
          {/* Heading */}
          <div className="mb-8">
            <h2 className="text-2xl font-bold text-gray-900">Bienvenido de nuevo</h2>
            <p className="mt-1 text-sm text-gray-500">
              Ingresá con tu cuenta para continuar.
            </p>
          </div>

          <LoginForm />
        </div>
      </div>
    </main>
  );
}
