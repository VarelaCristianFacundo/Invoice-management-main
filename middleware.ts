// middleware.ts

import { withAuth } from 'next-auth/middleware';

export default withAuth({
  callbacks: {
    authorized: ({ token, req }) => {
      // Obtiene el rol del usuario
      const userRole = token?.role;

      const { pathname } = req.nextUrl;

      // Define las rutas protegidas y los roles que pueden acceder
      const roleBasedRoutes: { [key: string]: string[] } = {
        '/dashboard/budgets': ['admin', 'usuario_presupuestos'],
        '/dashboard/invoices': ['admin', 'usuario', 'tesorero'],
        '/dashboard/allocations': ['admin', 'tesorero'],
        '/dashboard/customers': ['admin', 'tesorero'],
        '/dashboard/budgets/rejected': ['admin', 'usuario_presupuestos'],
      };

      // Recorre las rutas y verifica si el usuario tiene acceso
      for (const [route, roles] of Object.entries(roleBasedRoutes)) {
        if (pathname.startsWith(route)) {
          return roles.includes(userRole || '');
        }
      }

      // Por defecto, permitir acceso
      return true;
    },
  },
  pages: {
    // Página a la que se redirige si el usuario no está autorizado
    error: '/unauthorized',
  },
});

export const config = {
  matcher: ['/dashboard/:path*'],
};
