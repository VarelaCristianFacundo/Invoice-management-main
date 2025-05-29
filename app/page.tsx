import CamarcoLogo from '@/app/ui/camarco-logo';
import { roboto } from '@/app/ui/fonts';
import { ArrowRightIcon } from '@heroicons/react/24/outline';
import Image from 'next/image';
import Link from 'next/link';

export default function Page() {
  return (
    <main className="flex min-h-screen flex-col p-6">
      <div className="flex justify-center h-20 rounded-lg bg-gray-800 p-4 md:h-52">
        <CamarcoLogo />
      </div>
      <div className="mt-4 flex grow flex-col gap-4 md:flex-row">
        <div className="flex flex-col justify-center gap-6 rounded-lg bg-gray-50 px-6 py-10 md:w-2/5 md:px-20">
          <p className={`text-xl text-gray-800 md:text-3xl md:leading-normal ${roboto.className}`}>
            <strong>Bienvenido a Facturas Camarco.</strong> Simplifica la gestión de tus facturas con nuestra plataforma diseñada para
            optimizar tu flujo de trabajo. Mantén un control preciso de todos tus documentos, agiliza los procesos de pago y mejora
            la eficiencia de tu negocio con nuestras herramientas intuitivas y fáciles de usar. <br />

          </p>
          <Link
            href="/login"
            className="flex items-center gap-5 self-start rounded-lg bg-gray-800 px-6 py-3 text-sm font-medium text-white transition-colors hover:bg-gray-600 md:text-base"
          >
            <span>Ingresar</span> <ArrowRightIcon className="w-5 md:w-6" />
          </Link>
        </div>
        <div className="flex items-center justify-center p-6 md:w-3/5 md:px-28 md:py-12">
          <Image
            src="/hero-desktop.png"
            width={1000}
            height={760}
            priority
            className="hidden md:block"
            alt="Screenshots of the dashboard project showing desktop version"
          />
          {/* <Image
            src="/hero-mobile.png"
            width={560}
            height={620}
            className="blocl md:hidden"
            alt="Screenshots of the dashboard project showing desktop version"
          /> */}
        </div>
      </div>
    </main>
  );
}
