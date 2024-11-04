import CamarcoLogo from '@/app/ui/camarco-logo';
import LoginForm from '@/app/ui/login-form';
import { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'login'
}

export default function LoginPage() {
  return (
    <main className="flex items-center justify-center md:h-screen">
      <div className="relative mx-auto flex w-full max-w-[400px] flex-col space-y-2.5 p-4 md:-mt-32">
        <div className="flex w-full items-center justify-center rounded-lg bg-gray-800 md:h-36">
          <div className=" text-white md:w-36">
            <CamarcoLogo />
          </div>
        </div>
        <LoginForm />
      </div>
    </main>
  );
}