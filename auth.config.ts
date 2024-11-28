import type { Session, User } from 'next-auth';
import type { JWT } from 'next-auth/jwt';

// Usa "any" como tipo genérico para evitar errores de compilación
export const authConfig: any = {
  pages: {
    signIn: '/login',
  },
  callbacks: {
    session: async ({ session, token }: { session: Session; token: JWT }) => {
      // Agrega información personalizada al objeto `session`
      if (token) {
        session.user = {
          ...session.user,
          id: token.sub as string, // Asegúrate de que `sub` sea un string
          role: token.role as string, // Asegúrate de que `role` sea un string
        };
      }
      return session;
    },
    jwt: async ({ token, user }: { token: JWT; user?: User }) => {
      // Agrega propiedades adicionales al token JWT
      if (user) {
        token.id = user.id as string; // Asegúrate de que `id` sea un string
        token.role = user.role as string; // Asegúrate de que `role` sea un string
      }
      return token;
    },
  },
  providers: [], // Configura tus proveedores aquí
};
