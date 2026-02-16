-- Script para asignar áreas a usuarios existentes en PRODUCCIÓN
-- Ejecutar este script DESPUÉS de update_users_add_area.sql
-- IMPORTANTE: Revisar y ajustar según los usuarios reales de tu organización

-- Ver usuarios actuales y sus roles
SELECT id, name, email, role, area_id 
FROM users 
ORDER BY role, name;

-- ====================================================================================
-- PLANTILLA: Asignar área a un usuario específico
-- ====================================================================================
-- Descomenta y modifica según necesites:

/*
-- Ejemplo 1: Asignar usuario al área Sistemas
UPDATE users 
SET 
  role = 'usuario_sistemas',
  area_id = (SELECT id FROM areas WHERE name = 'Sistemas')
WHERE email = 'usuario@ejemplo.com';

-- Ejemplo 2: Convertir usuario común en superuser (acceso a todas las áreas)
UPDATE users 
SET 
  role = 'usuario',
  area_id = NULL
WHERE email = 'superuser@ejemplo.com';

-- Ejemplo 3: Convertir usuario en admin
UPDATE users 
SET 
  role = 'admin',
  area_id = NULL
WHERE email = 'admin@ejemplo.com';
*/

-- ====================================================================================
-- Asignaciones según la información proporcionada
-- ====================================================================================

-- Actualizar el Admin CAMARCO (ya existente en producción)
UPDATE users 
SET 
  role = 'admin',
  area_id = NULL
WHERE email = 'admin@camarco.local';

-- Actualizar el Usuario General Prod (ya existente en producción)
UPDATE users 
SET 
  role = 'usuario',
  area_id = NULL
WHERE email = 'usuario-general@camarco.org.ar';

-- ====================================================================================
-- USUARIOS A CONFIGURAR MANUALMENTE
-- ====================================================================================
-- Los siguientes usuarios necesitan ser asignados manualmente.
-- Descomenta y completa según corresponda:

/*
-- Usuario del área Secretaría
UPDATE users 
SET 
  role = 'usuario_secretaria',
  area_id = (SELECT id FROM areas WHERE name = 'Secretaría')
WHERE email = 'COMPLETAR@camarco.org.ar';

-- Usuario del área Sistemas
UPDATE users 
SET 
  role = 'usuario_sistemas',
  area_id = (SELECT id FROM areas WHERE name = 'Sistemas')
WHERE email = 'COMPLETAR@camarco.org.ar';

-- Usuario del área Comunicación
UPDATE users 
SET 
  role = 'usuario_comunicacion',
  area_id = (SELECT id FROM areas WHERE name = 'Comunicación')
WHERE email = 'COMPLETAR@camarco.org.ar';

-- Usuario del área GDI
UPDATE users 
SET 
  role = 'usuario_gdi',
  area_id = (SELECT id FROM areas WHERE name = 'GDI')
WHERE email = 'COMPLETAR@camarco.org.ar';

-- Usuario del área EGC
UPDATE users 
SET 
  role = 'usuario_egc',
  area_id = (SELECT id FROM areas WHERE name = 'EGC')
WHERE email = 'COMPLETAR@camarco.org.ar';

-- Usuario del área GT
UPDATE users 
SET 
  role = 'usuario_gt',
  area_id = (SELECT id FROM areas WHERE name = 'GT')
WHERE email = 'COMPLETAR@camarco.org.ar';

-- Usuario Contable
UPDATE users 
SET 
  role = 'usuario_contable',
  area_id = NULL
WHERE email = 'COMPLETAR@camarco.org.ar';
*/

-- ====================================================================================
-- Verificar las actualizaciones
-- ====================================================================================
SELECT 
  u.name,
  u.email,
  u.role,
  a.name as area_name,
  CASE 
    WHEN u.role = 'admin' THEN 'Acceso total'
    WHEN u.role = 'usuario' THEN 'Todas las áreas'
    WHEN u.role LIKE 'usuario_%' AND u.role != 'usuario' THEN 'Solo su área'
    ELSE 'Verificar configuración'
  END as tipo_acceso
FROM users u
LEFT JOIN areas a ON u.area_id = a.id
ORDER BY u.role, u.name;

-- ====================================================================================
-- ROLLBACK (por si algo sale mal)
-- ====================================================================================
-- Si necesitas deshacer los cambios:
/*
BEGIN;
-- Hacer los cambios aquí
-- Si algo sale mal: ROLLBACK;
-- Si todo está bien: COMMIT;
COMMIT;
*/
