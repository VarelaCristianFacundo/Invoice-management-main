// app/login/page.tsx

import CamarcoLogo from '@/app/ui/camarco-logo';
import LoginForm from '@/app/ui/login-form';
import { roboto } from '@/app/ui/fonts';
import { Metadata } from 'next';
import {
  ArrowTrendingUpIcon,
  BoltIcon,
  CheckBadgeIcon,
  ChartBarIcon,
  DocumentTextIcon,
} from '@heroicons/react/24/outline';

export const metadata: Metadata = {
  title: 'login',
};

export default function LoginPage() {
  return (
    <main
      className={`${roboto.className} relative flex min-h-screen items-center justify-center overflow-hidden bg-gradient-to-b from-white via-slate-50 to-white`}
    >
      {/* Grid background */}
      <div
        className="pointer-events-none absolute inset-0 -z-10 opacity-50"
        style={{
          backgroundImage:
            'linear-gradient(to right, rgba(239,68,68,0.10) 1px, transparent 1px), linear-gradient(to bottom, rgba(244,63,94,0.10) 1px, transparent 1px)',
          backgroundSize: '32px 32px',
        }}
      />

      {/* Glow blobs */}
      <div className="pointer-events-none absolute -top-20 left-1/4 -z-10 h-72 w-72 rounded-full bg-red-300/30 blur-3xl animate-pulse-glow" />
      <div
        className="pointer-events-none absolute bottom-0 right-1/4 -z-10 h-80 w-80 rounded-full bg-rose-300/30 blur-3xl animate-pulse-glow"
        style={{ animationDelay: '1.5s' }}
      />

      {/* Floating card: Factura */}
      <div
        className="pointer-events-none absolute left-[5%] top-[16%] hidden w-[158px] animate-float-slow md:block"
        style={{ animationDelay: '0.2s' }}
      >
        <div className="relative overflow-hidden rounded-2xl border border-white/60 bg-white/90 p-4 shadow-xl backdrop-blur-md ring-1 ring-red-100">
          <div className="pointer-events-none absolute inset-y-0 -left-1/2 w-1/2 bg-gradient-to-r from-transparent via-white/70 to-transparent animate-shimmer-sweep" />
          <div className="flex items-center gap-2">
            <div className="flex h-7 w-7 items-center justify-center rounded-lg bg-gradient-to-br from-red-500 to-rose-600 text-white">
              <DocumentTextIcon className="h-3.5 w-3.5" />
            </div>
            <div>
              <p className="text-[9px] font-semibold uppercase tracking-wider text-gray-400">
                Factura
              </p>
              <p className="text-[10px] font-semibold text-gray-800">#FC-0024-A</p>
            </div>
          </div>
          <div className="mt-3 space-y-1.5">
            <div className="flex items-center justify-between">
              <div className="h-1.5 w-20 rounded-full bg-gray-100" />
              <div className="h-1.5 w-8 rounded-full bg-gray-200" />
            </div>
            <div className="flex items-center justify-between">
              <div className="h-1.5 w-24 rounded-full bg-gray-100" />
              <div className="h-1.5 w-10 rounded-full bg-gray-200" />
            </div>
          </div>
          <div className="mt-3 flex items-end justify-between border-t border-gray-100 pt-2">
            <div>
              <p className="text-[9px] font-medium uppercase tracking-wider text-gray-400">Total</p>
              <p className="text-sm font-bold text-gray-900">$ 1.245.000</p>
            </div>
            <span className="rounded-full bg-emerald-50 px-1.5 py-0.5 text-[9px] font-semibold text-emerald-700 ring-1 ring-inset ring-emerald-200">
              Aprobada
            </span>
          </div>
        </div>
      </div>

      {/* Floating card: Mensual chart */}
      <div
        className="pointer-events-none absolute right-[5%] top-[14%] hidden w-[148px] animate-float-medium md:block"
        style={{ animationDelay: '0.6s' }}
      >
        <div className="rounded-xl border border-white/60 bg-white/90 p-3 shadow-lg backdrop-blur-md ring-1 ring-rose-100">
          <div className="mb-2 flex items-center gap-1.5">
            <ChartBarIcon className="h-3.5 w-3.5 text-rose-500" />
            <p className="text-[10px] font-semibold uppercase tracking-wider text-gray-500">
              Mensual
            </p>
          </div>
          <div className="flex h-10 items-end gap-1">
            {[0.4, 0.7, 0.5, 0.85, 0.6, 1, 0.75].map((h, i) => (
              <div
                key={i}
                className="flex-1 rounded-sm bg-gradient-to-t from-red-400 to-rose-500 animate-bar-grow"
                style={{ height: `${h * 100}%`, animationDelay: `${i * 0.15}s` }}
              />
            ))}
          </div>
        </div>
      </div>

      {/* Floating card: Estado */}
      <div
        className="pointer-events-none absolute right-[6%] bottom-[20%] hidden w-[152px] animate-float-fast md:block"
        style={{ animationDelay: '1s' }}
      >
        <div className="flex items-center gap-3 rounded-xl border border-white/60 bg-white/90 p-3 shadow-lg backdrop-blur-md ring-1 ring-emerald-100">
          <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-emerald-50 text-emerald-600">
            <CheckBadgeIcon className="h-4 w-4" />
          </div>
          <div>
            <p className="text-[9px] font-semibold uppercase tracking-wider text-gray-400">Estado</p>
            <p className="text-[11px] font-semibold text-gray-800">98% al día</p>
          </div>
        </div>
      </div>

      {/* Floating card: Procesadas hoy */}
      <div
        className="pointer-events-none absolute left-[5%] bottom-[18%] hidden w-[144px] animate-float-medium md:block"
        style={{ animationDelay: '0.4s' }}
      >
        <div className="rounded-xl border border-white/60 bg-white/90 p-3 shadow-lg backdrop-blur-md ring-1 ring-red-100">
          <p className="text-[9px] font-semibold uppercase tracking-wider text-gray-400">
            Procesadas hoy
          </p>
          <div className="mt-1 flex items-baseline gap-1">
            <p className="text-2xl font-bold text-gray-900">37</p>
            <span className="inline-flex items-center gap-0.5 text-[9px] font-semibold text-emerald-600">
              <ArrowTrendingUpIcon className="h-3 w-3" />
              12%
            </span>
          </div>
        </div>
      </div>

      {/* Floating card: Auto-pago */}
      <div
        className="pointer-events-none absolute left-[3%] top-1/2 hidden w-[142px] -translate-y-1/2 animate-float-slow lg:block"
        style={{ animationDelay: '1.8s' }}
      >
        <div className="rounded-xl border border-white/60 bg-gradient-to-br from-gray-900 to-gray-800 p-3 shadow-lg ring-1 ring-gray-700">
          <div className="flex items-center gap-2">
            <div className="flex h-7 w-7 items-center justify-center rounded-lg bg-white/10 text-white backdrop-blur">
              <BoltIcon className="h-3.5 w-3.5" />
            </div>
            <div>
              <p className="text-[9px] font-semibold uppercase tracking-wider text-gray-400">
                Auto-pago
              </p>
              <p className="text-[11px] font-semibold text-white">Activo</p>
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
            <span className="ml-auto text-[9px] text-gray-400">en línea</span>
          </div>
        </div>
      </div>

      {/* Login form */}
      <div className="relative z-10 mx-auto flex w-full max-w-[400px] flex-col space-y-2.5 p-4">
        <div className="flex w-full items-center justify-center rounded-xl bg-gray-900 px-6 py-5 shadow-lg">
          <div className="w-36 text-white">
            <CamarcoLogo />
          </div>
        </div>
        <LoginForm />
      </div>
    </main>
  );
}
