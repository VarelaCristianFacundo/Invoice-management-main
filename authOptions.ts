// authOptions.ts

import bcrypt from 'bcrypt';
import { NextAuthOptions } from 'next-auth/index';
import CredentialsProvider from 'next-auth/providers/credentials';
import { getUserByEmail } from './app/lib/user';

export const authOptions: NextAuthOptions = {
  providers: [
    CredentialsProvider({
      name: 'Credentials',
      credentials: {
        email: {
          label: 'Email',
          type: 'text',
          placeholder: 'user@example.com',
        },
        password: { label: 'Password', type: 'password' },
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
  cookies: {
    sessionToken: {
      name: `next-auth.session-token`, // Cambia a un nombre genérico para evitar problemas en local
      options: {
        httpOnly: true,
        sameSite: 'lax',
        path: '/',
        secure: process.env.NODE_ENV === 'production', // Solo usa secure en producción
        domain:
          process.env.NODE_ENV === 'production'
            ? '.invoice-management-main.vercel.app'
            : undefined, // No configura dominio en local
      },
    },
  },

  secret: process.env.NEXTAUTH_SECRET,
  callbacks: {
    async jwt({ token, user }: any) {
      console.log('authOptions', user);
      console.log('authOptions', token);
      if (user) {
        token.id = user.id;
        token.role = user.role;
      }
      return token;
    },
    async session({ session, token }: any) {
      console.log('authOptions', session);
      console.log('authOptions', token);
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
