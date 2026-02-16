// next-auth.d.ts

import { DefaultSession, DefaultUser } from 'next-auth';

declare module 'next-auth' {
  interface Session {
    user: {
      id: string;
      name?: string | null;
      email?: string | null;
      image?: string | null;
      role?: string | null;
      area_id?: string | null;
    } & DefaultSession['user'];
  }

  interface User extends DefaultUser {
    id: string;
    role?: string | null;
    area_id?: string | null;
  }
}

declare module 'next-auth/jwt' {
  interface JWT {
    id: string;
    role?: string | null;
    area_id?: string | null;
  }
}
