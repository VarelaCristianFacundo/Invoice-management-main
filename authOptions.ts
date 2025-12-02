// authOptions.ts

import bcrypt from 'bcrypt';
import type { NextAuthOptions } from 'next-auth';
import CredentialsProvider from 'next-auth/providers/credentials';
import { getUserByEmail } from './app/lib/user';

const isHttps = process.env.NEXTAUTH_URL?.startsWith('https://') ?? false;

export const authOptions: NextAuthOptions = {
  providers: [
    CredentialsProvider({
      name: 'Credentials',
      credentials: {
        email: {
          label: 'Correo',
          type: 'text',
          placeholder: 'usuario@ejemplo.com',
        },
        password: {
          label: 'Contraseña',
          type: 'password',
          placeholder: 'Ingresa tu contraseña',
        },
      },
      async authorize(credentials) {
        if (!credentials) return null;

        const user = await getUserByEmail(credentials.email);
        if (!user) return null;

        const isValid = await bcrypt.compare(
          credentials.password,
          user.password,
        );
        if (!isValid) return null;

        return {
          id: user.id,
          email: user.email,
          name: user.name,
          role: user.role,
        };
      },
    }),
  ],

  pages: {
    signIn: '/login',
  },

  // Cookies configuradas según si usamos HTTPS o no
  useSecureCookies: isHttps,
  cookies: {
    sessionToken: {
      name: isHttps
        ? '__Secure-next-auth.session-token'
        : 'next-auth.session-token',
      options: {
        httpOnly: true,
        sameSite: 'lax',
        path: '/',
        secure: isHttps, // solo Secure si realmente estamos en HTTPS
        // sin "domain": que se use el host actual (funciona en local y en facturas.camarco.org.ar)
      },
    },
  },

  secret: process.env.NEXTAUTH_SECRET,

  callbacks: {
    async jwt({ token, user }: any) {
      if (user) {
        token.id = user.id;
        token.role = user.role;
      }
      return token;
    },
    async session({ session, token }: any) {
      if (token) {
        session.user = {
          ...session.user,
          id: token.id,
          role: token.role,
        };
      }
      return session;
    },
  },
};
