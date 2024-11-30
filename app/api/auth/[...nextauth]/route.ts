import { authOptions } from '@/authOptions'; // Asegúrate de que este archivo exista y tenga la configuración correcta.
import NextAuth from 'next-auth/next';

const handler = NextAuth(authOptions);

// Exporta los handlers GET y POST requeridos por Next.js.
export { handler as GET, handler as POST };
