import CamarcoLogo from '@/app/ui/camarco-logo';
import { roboto } from '@/app/ui/fonts';
import {
  ArrowRightIcon,
  ArrowTrendingUpIcon,
  BoltIcon,
  ChartBarIcon,
  CheckBadgeIcon,
  DocumentCheckIcon,
  DocumentTextIcon,
  SparklesIcon,
} from '@heroicons/react/24/outline';
import Link from 'next/link';

export default function Page() {
  return (
    <main
      className={`${roboto.className} flex min-h-screen flex-col bg-gradient-to-b from-white via-slate-50 to-white`}
    >
      <header className="flex items-center justify-between px-6 py-5 md:px-12">
        <div className="flex items-center gap-3">
          <div className="flex h-14 w-14 items-center justify-center rounded-xl bg-slate-100 p-2.5 shadow-md ring-1 ring-red-700/20">
            <CamarcoLogo />
          </div>
          <div className="flex flex-col leading-tight">
            <span className="text-lg font-bold tracking-tight text-gray-900">
              Facturas Camarco
            </span>
          </div>
        </div>
        <Link
          href="/login"
          className="rounded-lg border border-gray-200 bg-white px-4 py-2 text-sm font-medium text-gray-800 shadow-sm transition-colors hover:border-gray-300 hover:bg-gray-50"
        >
          Ingresar
        </Link>
      </header>

      <section className="grid grow grid-cols-1 items-center gap-10 px-6 py-12 md:grid-cols-2 md:gap-12 md:px-12 md:py-16">
        <div className="flex flex-col gap-6">
          <span className="inline-flex w-fit items-center gap-2 rounded-full bg-red-50 px-3 py-1 text-xs font-medium text-red-700 ring-1 ring-inset ring-red-200">
            <BoltIcon className="h-3.5 w-3.5" />
            Plataforma interna de gestión
          </span>

          <h1 className="text-4xl font-bold leading-tight tracking-tight text-gray-900 md:text-5xl md:leading-[1.1]">
            Gestión de facturas,{' '}
            <span className="bg-gradient-to-r from-red-600 to-rose-600 bg-clip-text text-transparent">
              simplificada
            </span>
            .
          </h1>

          <p className="max-w-xl text-base leading-relaxed text-gray-600 md:text-lg">
            Mantén un control preciso de tus documentos, agiliza los procesos
            de pago y mejora la eficiencia de tu negocio con herramientas
            intuitivas, pensadas para tu flujo de trabajo.
          </p>

          <div className="mt-2 flex flex-col gap-3 sm:flex-row sm:items-center">
            <Link
              href="/login"
              className="inline-flex items-center justify-center gap-2 rounded-lg bg-gray-900 px-6 py-3 text-sm font-medium text-white shadow-sm transition-colors hover:bg-gray-700 md:text-base"
            >
              <span>Ingresar al panel</span>
              <ArrowRightIcon className="h-5 w-5" />
            </Link>
            <Link
              href="/dashboard"
              className="inline-flex items-center justify-center gap-2 rounded-lg px-4 py-3 text-sm font-medium text-gray-700 transition-colors hover:text-gray-900 md:text-base"
            >
              Ver dashboard
              <ArrowRightIcon className="h-4 w-4" />
            </Link>
          </div>
        </div>

        <FuturisticHero />
      </section>

      <section className="px-6 pb-16 md:px-12">
        <div className="grid grid-cols-1 gap-4 md:grid-cols-3 md:gap-6">
          <FeatureCard
            icon={<DocumentCheckIcon className="h-6 w-6" />}
            title="Control preciso"
            description="Centraliza facturas, presupuestos y aprobaciones en un solo lugar."
          />
          <FeatureCard
            icon={<BoltIcon className="h-6 w-6" />}
            title="Procesos ágiles"
            description="Acelera los flujos de pago con herramientas pensadas para cada área."
          />
          <FeatureCard
            icon={<ChartBarIcon className="h-6 w-6" />}
            title="Visión clara"
            description="Reportes y dashboards para tomar decisiones informadas."
          />
        </div>
      </section>

      <footer className="border-t border-gray-100 px-6 py-6 text-center text-xs text-gray-500 md:px-12">
        © {new Date().getFullYear()} Camarco · Plataforma interna de gestión de
        facturas
      </footer>
    </main>
  );
}

function FuturisticHero() {
  return (
    <div className="relative mx-auto h-[360px] w-full max-w-[460px] md:h-[420px]" aria-hidden="true">
      <div
        className="absolute inset-0 -z-10 opacity-60 [mask-image:radial-gradient(ellipse_at_center,black_40%,transparent_75%)]"
        style={{
          backgroundImage:
            'linear-gradient(to right, rgba(239,68,68,0.12) 1px, transparent 1px), linear-gradient(to bottom, rgba(244,63,94,0.12) 1px, transparent 1px)',
          backgroundSize: '32px 32px',
        }}
      />

      <div className="absolute left-1/4 top-1/4 -z-10 h-56 w-56 rounded-full bg-red-300/40 blur-3xl animate-pulse-glow" />
      <div
        className="absolute right-1/4 bottom-1/4 -z-10 h-64 w-64 rounded-full bg-rose-300/40 blur-3xl animate-pulse-glow"
        style={{ animationDelay: '1.5s' }}
      />

      <div className="absolute left-1/2 top-1/2 -z-10 h-[280px] w-[280px] -translate-x-1/2 -translate-y-1/2 animate-orbit">
        <div className="absolute left-1/2 top-0 h-2 w-2 -translate-x-1/2 rounded-full bg-red-400 shadow-[0_0_12px_2px_rgba(248,113,113,0.7)]" />
        <div className="absolute right-0 top-1/2 h-1.5 w-1.5 -translate-y-1/2 rounded-full bg-rose-400 shadow-[0_0_10px_2px_rgba(251,113,133,0.7)]" />
        <div className="absolute bottom-0 left-1/2 h-2 w-2 -translate-x-1/2 rounded-full bg-amber-400 shadow-[0_0_12px_2px_rgba(251,191,36,0.7)]" />
      </div>

      <div className="absolute left-1/2 top-1/2 w-[240px] -translate-x-1/2 -translate-y-1/2 animate-float-slow md:w-[280px]">
        <div className="relative overflow-hidden rounded-2xl border border-white/60 bg-white/90 p-5 shadow-2xl backdrop-blur-md ring-1 ring-red-100">
          <div
            className="pointer-events-none absolute inset-y-0 -left-1/2 w-1/2 bg-gradient-to-r from-transparent via-white/70 to-transparent animate-shimmer-sweep"
          />
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-2">
              <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-gradient-to-br from-red-500 to-rose-600 text-white">
                <DocumentTextIcon className="h-4 w-4" />
              </div>
              <div>
                <p className="text-[10px] font-semibold uppercase tracking-wider text-gray-400">
                  Factura
                </p>
                <p className="text-xs font-semibold text-gray-800">
                  #FC-0024-A
                </p>
              </div>
            </div>
            <span className="rounded-full bg-emerald-50 px-2 py-0.5 text-[10px] font-semibold text-emerald-700 ring-1 ring-inset ring-emerald-200">
              Aprobada
            </span>
          </div>
          <div className="mt-4 space-y-2">
            <div className="flex items-center justify-between">
              <div className="h-2 w-24 rounded-full bg-gray-100" />
              <div className="h-2 w-10 rounded-full bg-gray-200" />
            </div>
            <div className="flex items-center justify-between">
              <div className="h-2 w-32 rounded-full bg-gray-100" />
              <div className="h-2 w-12 rounded-full bg-gray-200" />
            </div>
            <div className="flex items-center justify-between">
              <div className="h-2 w-20 rounded-full bg-gray-100" />
              <div className="h-2 w-8 rounded-full bg-gray-200" />
            </div>
          </div>
          <div className="mt-4 flex items-end justify-between border-t border-gray-100 pt-3">
            <div>
              <p className="text-[10px] font-medium uppercase tracking-wider text-gray-400">
                Total
              </p>
              <p className="text-lg font-bold text-gray-900">$ 1.245.000</p>
            </div>
            <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-red-50 text-red-600">
              <SparklesIcon className="h-4 w-4" />
            </div>
          </div>
        </div>
      </div>

      <div
        className="absolute left-4 top-4 w-[150px] animate-float-medium md:left-8 md:top-6 md:w-[160px]"
        style={{ animationDelay: '0.4s' }}
      >
        <div className="rounded-xl border border-white/60 bg-white/90 p-3 shadow-lg backdrop-blur-md ring-1 ring-rose-100">
          <div className="mb-2 flex items-center gap-1.5">
            <ChartBarIcon className="h-3.5 w-3.5 text-rose-500" />
            <p className="text-[10px] font-semibold uppercase tracking-wider text-gray-500">
              Mensual
            </p>
          </div>
          <div className="flex h-12 items-end gap-1">
            {[0.4, 0.7, 0.5, 0.85, 0.6, 1, 0.75].map((h, i) => (
              <div
                key={i}
                className="flex-1 rounded-sm bg-gradient-to-t from-red-400 to-rose-500 animate-bar-grow"
                style={{
                  height: `${h * 100}%`,
                  animationDelay: `${i * 0.15}s`,
                }}
              />
            ))}
          </div>
        </div>
      </div>

      <div
        className="absolute right-4 top-8 w-[160px] animate-float-fast md:right-8 md:top-10 md:w-[170px]"
        style={{ animationDelay: '0.8s' }}
      >
        <div className="flex items-center gap-3 rounded-xl border border-white/60 bg-white/90 p-3 shadow-lg backdrop-blur-md ring-1 ring-emerald-100">
          <div className="flex h-9 w-9 items-center justify-center rounded-lg bg-emerald-50 text-emerald-600">
            <CheckBadgeIcon className="h-5 w-5" />
          </div>
          <div className="min-w-0">
            <p className="text-[10px] font-semibold uppercase tracking-wider text-gray-400">
              Estado
            </p>
            <p className="text-xs font-semibold text-gray-800">
              98% al día
            </p>
          </div>
        </div>
      </div>

      <div
        className="absolute bottom-4 left-6 w-[150px] animate-float-medium md:left-10 md:bottom-6 md:w-[160px]"
        style={{ animationDelay: '1.2s' }}
      >
        <div className="rounded-xl border border-white/60 bg-white/90 p-3 shadow-lg backdrop-blur-md ring-1 ring-red-100">
          <p className="text-[10px] font-semibold uppercase tracking-wider text-gray-400">
            Procesadas hoy
          </p>
          <div className="mt-1 flex items-baseline gap-1">
            <p className="text-2xl font-bold text-gray-900">37</p>
            <span className="inline-flex items-center gap-0.5 text-[10px] font-semibold text-emerald-600">
              <ArrowTrendingUpIcon className="h-3 w-3" />
              12%
            </span>
          </div>
        </div>
      </div>

      <div
        className="absolute bottom-2 right-4 w-[150px] animate-float-slow md:bottom-4 md:right-8 md:w-[170px]"
        style={{ animationDelay: '0.6s' }}
      >
        <div className="rounded-xl border border-white/60 bg-gradient-to-br from-gray-900 to-gray-800 p-3 shadow-lg ring-1 ring-gray-700">
          <div className="flex items-center gap-2">
            <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-white/10 text-white backdrop-blur">
              <BoltIcon className="h-4 w-4" />
            </div>
            <div>
              <p className="text-[10px] font-semibold uppercase tracking-wider text-gray-400">
                Auto-pago
              </p>
              <p className="text-xs font-semibold text-white">Activo</p>
            </div>
          </div>
          <div className="mt-2 flex items-center gap-1">
            <span className="h-1 w-1 rounded-full bg-emerald-400 animate-pulse" />
            <span
              className="h-1 w-1 rounded-full bg-emerald-400 animate-pulse"
              style={{ animationDelay: '0.3s' }}
            />
            <span
              className="h-1 w-1 rounded-full bg-emerald-400 animate-pulse"
              style={{ animationDelay: '0.6s' }}
            />
            <span className="ml-auto text-[10px] text-gray-400">en línea</span>
          </div>
        </div>
      </div>
    </div>
  );
}

function FeatureCard({
  icon,
  title,
  description,
}: {
  icon: React.ReactNode;
  title: string;
  description: string;
}) {
  return (
    <div className="rounded-xl border border-gray-100 bg-white p-6 shadow-sm transition-shadow hover:shadow-md">
      <div className="mb-4 flex h-11 w-11 items-center justify-center rounded-lg bg-red-50 text-red-600">
        {icon}
      </div>
      <h3 className="mb-1.5 text-base font-semibold text-gray-900">{title}</h3>
      <p className="text-sm leading-relaxed text-gray-600">{description}</p>
    </div>
  );
}
