import { inter } from '@/app/ui/fonts';
import '@/app/ui/global.css';
import { Metadata } from 'next';
import { Providers } from './Providers';

export const metadata: Metadata = {
  title: {
    template: '%s | Camarco Dashboard',
    default: ' Camarco Dashboard',
  },
  description: 'The official Next.js Learn Dashboard built with App Router.',
  metadataBase: new URL('https://next-learn-dashboard.vercel.sh'),
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <Providers><body className={`${inter.className} antialiased`}>{children}</body></Providers>
    </html>
  );
}
