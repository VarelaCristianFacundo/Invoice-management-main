# Implementación del Sistema de Roles Multi-Área

## Resumen de Cambios

Se implementó un sistema de roles granular que permite:

1. **Admin/Director Ejecutivo** (`admin`) - Acceso total a todas las áreas
2. **Superuser Común** (`usuario`) - Puede cargar facturas de diferentes áreas
3. **Usuarios por Área** - Solo pueden ver y crear facturas de su propia área:
   - `usuario_secretaria`
   - `usuario_sistemas`
   - `usuario_comunicacion`
   - `usuario_gdi`
   - `usuario_egc`
   - `usuario_gt`
4. **Usuario Contable** (`usuario_contable`) - Por definir funcionalidad específica

## Archivos Modificados

### Backend y Base de Datos
- `scripts/update_users_add_area.sql` - Agrega columna `area_id` a tabla users
- `scripts/create_test_users.sql` - Crea usuarios de prueba con diferentes roles
- `app/lib/definitions.ts` - Tipos actualizados con UserRole y area_id
- `app/lib/user.ts` - Query actualizado para incluir area_id
- `app/lib/data.ts` - Funciones de fetch con filtro por área

### Autenticación
- `authOptions.ts` - Incluye area_id en sesión
- `app/next-auth.d.ts` - Tipos de sesión con area_id
- `middleware.ts` - Permisos actualizados para nuevos roles

### Frontend
- `app/dashboard/invoices/create/page.tsx` - Pasa rol y área al form
- `app/ui/invoices/create-form.tsx` - Filtra allocations por área
- `app/dashboard/invoices/page.tsx` - Filtra facturas por área
- `app/ui/invoices/table.tsx` - Recibe área para filtrado

### API
- `app/api/invoices/route.ts` - GET acepta parámetro areaId

## Instrucciones de Implementación

### 1. Base de Datos Local (Prueba)

```bash
# Conectarse a la base de datos local
psql -U postgres -d invoice_management

# Ejecutar los scripts en orden:
\i scripts/update_users_add_area.sql
\i scripts/create_test_users.sql
```

### 2. Verificar Usuarios Creados

```sql
SELECT 
  u.name,
  u.email,
  u.role,
  a.name as area_name
FROM users u
LEFT JOIN areas a ON u.area_id = a.id
ORDER BY u.role, u.name;
```

### 3. Usuarios de Prueba

Todos los usuarios tienen la contraseña: `password123`

| Email | Rol | Área | Permisos |
|-------|-----|------|----------|
| admin@camarco.local | admin | - | Todas las áreas |
| usuario-general@camarco.local | usuario | - | Todas las áreas |
| usuario-secretaria@camarco.local | usuario_secretaria | Secretaría | Solo su área |
| usuario-sistemas@camarco.local | usuario_sistemas | Sistemas | Solo su área |
| usuario-comunicacion@camarco.local | usuario_comunicacion | Comunicación | Solo su área |
| usuario-gdi@camarco.local | usuario_gdi | GDI | Solo su área |
| usuario-egc@camarco.local | usuario_egc | EGC | Solo su área |
| usuario-gt@camarco.local | usuario_gt | GT | Solo su área |
| usuario-contable@camarco.local | usuario_contable | - | Por definir |

### 4. Probar Funcionalidad

1. **Iniciar el servidor de desarrollo:**
   ```bash
   npm run dev
   ```

2. **Probar como usuario de área:**
   - Login con `usuario-sistemas@camarco.local` / `password123`
   - Ir a Crear Factura
   - Verificar que solo aparecen proyectos del área Sistemas
   - Ir a Ver Facturas
   - Verificar que solo aparecen facturas del área Sistemas

3. **Probar como superuser:**
   - Login con `usuario-general@camarco.local` / `password123`
   - Ir a Crear Factura
   - Verificar que aparecen proyectos de todas las áreas
   - Ir a Ver Facturas
   - Verificar que aparecen facturas de todas las áreas

4. **Probar como admin:**
   - Login con `admin@camarco.local` / `password123`
   - Verificar acceso total

### 5. Implementación en Producción

Una vez probado en local, conectarse al servidor de producción:

```bash
# Conectarse al servidor
ssh tu-usuario@192.168.50.163

# Conectarse a la base de datos
psql -U camarco_root -h 192.168.50.163

# Ejecutar los scripts
\i /ruta/a/scripts/update_users_add_area.sql
```

**IMPORTANTE**: Antes de ejecutar `create_test_users.sql` en producción:
1. Revisar los emails de los usuarios existentes
2. Modificar el script para actualizar usuarios reales
3. Asignar áreas correctas a cada usuario según su función

### 6. Asignar Áreas a Usuarios Existentes

```sql
-- Ejemplo: Asignar área a un usuario existente
UPDATE users 
SET 
  role = 'usuario_sistemas',
  area_id = (SELECT id FROM areas WHERE name = 'Sistemas')
WHERE email = 'email-del-usuario@camarco.org.ar';
```

## Comportamiento del Sistema

### Usuarios de Área (usuario_*)
- **Crear Facturas**: Solo ven proyectos/allocations de su área
- **Ver Facturas**: Solo ven facturas de su área
- **Crear Proveedores**: Pueden crear, pero solo asignan a su área
- **Dashboard**: Solo estadísticas de su área (a implementar)

### Superuser (usuario) y Admin
- **Crear Facturas**: Ven todos los proyectos/allocations
- **Ver Facturas**: Ven todas las facturas
- **Crear Proveedores**: Pueden crear para cualquier área
- **Dashboard**: Estadísticas de todas las áreas

### Usuario Contable
- Por definir funcionalidad específica
- Actualmente tiene acceso similar a usuarios de área

## Próximos Pasos (Opcional)

1. **Dashboard filtrado por área**: Actualizar cards y estadísticas
2. **Proveedores por área**: Filtrar proveedores según área del usuario
3. **Reportes por área**: Implementar exportación filtrada
4. **Usuario Contable**: Definir permisos específicos (solo lectura, aprobación, etc.)
5. **Auditoría**: Agregar logs de quién crea/modifica facturas

## Contacto

Si hay problemas o dudas sobre la implementación, revisar:
- Logs de la consola del navegador
- Logs del servidor Next.js
- Conexión a la base de datos

## Notas Técnicas

### Lógica de Filtrado
```typescript
// Se considera "usuario de área" si:
const isAreaUser = userRole?.startsWith('usuario_') && 
                    userRole !== 'usuario' && 
                    userRole !== 'usuario_contable' && 
                    userRole !== 'usuario_presupuestos';
```

### SQL de Filtrado
```sql
-- Las queries incluyen un filtro condicional:
WHERE ... ${areaId ? 'AND ba.area_id = $X' : ''}
```

Esto permite que el mismo código funcione para usuarios con y sin restricción de área.
