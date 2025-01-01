import { lusitana } from '@/app/ui/fonts';
import logo from '@/public/logo.png'; // Replace with the actual path to your logo image
import Image from 'next/image';

export default function CamarcoLogo() {
  return (
    <div
      className={`${lusitana.className} flex flex-row items-center leading-none text-white justify-center`}
    >
      <Image
        src={logo}
        alt="Company logo"
        className="h-8 w-8"
        layout="fixed"
        objectFit="contain"
        objectPosition="top"
        style={{ width: '100%', height: '100%' }}
        priority
      />
    </div>
  );
}
