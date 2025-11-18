import type { User } from '@/app/lib/definitions';
import { sql } from '@vercel/postgres';
import bcrypt from 'bcrypt';
import NextAuth from 'next-auth/next';
import CredentialsProvider from 'next-auth/providers/credentials';
import { z } from 'zod';

// Validar y obtener un usuario por correo
async function getUser(email: string): Promise<User | undefined> {
  try {
    const user = await sql<User>`SELECT * FROM users WHERE email=${email}`;
    return user.rows[0];
  } catch (error) {
    console.error('Falló en traer usuariosFalló en traer usuarios:', error);
    throw new Error('Falló en traer usuarios.');
  }
}

// Configuración de NextAuth
export default NextAuth({
  providers: [
    CredentialsProvider({
      credentials: {
        email: {
          label: 'Correo',
          type: 'text',
          placeholder: 'Ingresa tu correo',
        },
        password: {
          label: 'Contraseña',
          type: 'password',
          placeholder: 'Ingresa tu contraseña',
        },
      },
      async authorize(credentials) {
        if (!credentials) return null;

        // Validar las credenciales usando Zod
        const parsedCredentials = z
          .object({
            email: z.string().email(),
            password: z.string().min(6),
          })
          .safeParse(credentials);

        if (!parsedCredentials.success) {
          console.error('Invalid credentials format');
          return null;
        }

        const { email, password } = parsedCredentials.data;

        // Buscar usuario y validar contraseña
        const user = await getUser(email);
        if (!user) {
          console.error('User not found');
          return null;
        }

        const passwordsMatch = await bcrypt.compare(password, user.password);
        if (!passwordsMatch) {
          console.error('Invalid password');
          return null;
        }

        // Si todo es correcto, retornar el usuario
        return user;
      },
    }),
  ],
});
