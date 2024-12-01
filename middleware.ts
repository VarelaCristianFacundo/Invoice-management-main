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
  
      // Define las rutas protegidas y los roles permitidos
      const roleBasedRoutes: { [key: string]: string[] } = {
        '/dashboard/budgets': ['admin', 'usuario_presupuestos'],
        '/dashboard/invoices': ['admin', 'usuario', 'tesorero'],
        '/dashboard/allocations': ['admin', 'tesorero'],
        '/dashboard/customers': ['admin', 'tesorero'],
        '/dashboard/budgets/rejected': ['admin', 'usuario_presupuestos'],
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
