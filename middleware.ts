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

      // Roles con acceso a todas las áreas
      const adminRoles = ['admin', 'usuario'];
      
      const areaRoles = [
        'usuario_administracion',
        'usuario_contable',
        'usuario_logistica',
        'usuario_marketing',
        'usuario_produccion',
        'usuario_rrhh',
        'usuario_sistemas',
        'usuario_ventas',
        'usuario_eventos'
      ];

      // Define las rutas protegidas y los roles permitidos
      // IMPORTANTE: rutas más específicas deben ir ANTES que las más generales
      const roleBasedRoutes: { [key: string]: string[] } = {
        '/dashboard/budgets/rejected': ['admin', 'usuario_presupuestos'],
        '/dashboard/budgets': ['admin', 'usuario_presupuestos', ...areaRoles],
        '/dashboard/invoices': [
          'admin', 
          'usuario', 
          'tesorero',
          'usuario_contable',
          ...areaRoles
        ],
        '/dashboard/allocations': ['admin', 'tesorero'],
        '/dashboard/customers': [
          'admin', 
          'tesorero', 
          'usuario',
          ...areaRoles
        ],
      };

      // Verifica si la ruta coincide y si el rol tiene acceso
      for (const [route, roles] of Object.entries(roleBasedRoutes)) {
        if (pathname.startsWith(route)) {
          const hasAccess = roles.includes(userRole);
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
