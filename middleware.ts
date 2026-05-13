// middleware.ts

import { withAuth } from 'next-auth/middleware';

export default withAuth({
  callbacks: {
    authorized: ({ token, req }) => {
      console.log('Token:', token);
      console.log('Requested Path:', req.nextUrl.pathname);

      // Si no hay token, redirige al login
      if (!token) {
        console.log('No token found, redirecting to login');
        return false;
      }

      const userRole = token?.role || 'guest';
      console.log('User Role:', userRole);

      const { pathname } = req.nextUrl;

      // Helper function to check if a user is an area user
      const isAreaUser = userRole.startsWith('usuario_') && userRole !== 'usuario_presupuestos' && userRole !== 'usuario_contable';

      // Define las rutas protegidas y los roles permitidos
      // IMPORTANTE: rutas más específicas deben ir ANTES que las más generales
      const roleBasedRoutes: { [key: string]: string[] } = {
        '/dashboard/budgets/rejected': ['admin', 'usuario_presupuestos', 'usuario_contable'],
        '/dashboard/budgets': ['admin', 'usuario_presupuestos', 'usuario_contable', 'AREA_USER'],
        '/dashboard/invoices': [
          'admin', 
          'usuario', 
          'tesorero',
          'usuario_contable',
          'AREA_USER'
        ],
        '/dashboard/allocations': ['admin', 'tesorero'],
        '/dashboard/customers': [
          'admin', 
          'tesorero', 
          'usuario',
          'usuario_contable',
          'AREA_USER'
        ],
      };

      // Verifica si la ruta coincide y si el rol tiene acceso
      for (const [route, roles] of Object.entries(roleBasedRoutes)) {
        if (pathname.startsWith(route)) {
          const hasAccess = roles.includes(userRole) || (roles.includes('AREA_USER') && isAreaUser);
          console.log(`Access to ${route}:`, hasAccess);
          return hasAccess;
        }
      }

      // Permitir acceso por defecto
      console.log('No specific restrictions for this route');
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
