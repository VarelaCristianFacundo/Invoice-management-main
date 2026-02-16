-- Script para PRODUCCIÓN - Agregar columna area_id y configurar usuarios
-- Servidor: 192.168.50.163
-- Base de datos: invoice_management (o la que corresponda)

-- ========================================
-- PASO 1: Agregar columna area_id
-- ========================================
ALTER TABLE users 
ADD COLUMN IF NOT EXISTS area_id UUID REFERENCES areas(id);

CREATE INDEX IF NOT EXISTS idx_users_area_id ON users(area_id);

COMMENT ON COLUMN users.area_id IS 'ID del área asignada al usuario. NULL para admin y usuarios con acceso a todas las áreas';

-- ========================================
-- PASO 2: Ver usuarios actuales
-- ========================================
SELECT 'USUARIOS ACTUALES:' as info;
SELECT id, name, email, role, area_id 
FROM users 
ORDER BY role, name;

-- ========================================
-- PASO 3: Ver áreas disponibles
-- ========================================
SELECT 'AREAS DISPONIBLES:' as info;
SELECT id, name FROM areas ORDER BY name;

-- ========================================
-- PASO 4: Actualizar usuarios existentes
-- ========================================

-- Admin CAMARCO - Acceso total (sin área específica)
UPDATE users 
SET 
  role = 'admin',
  area_id = NULL
WHERE email = 'admin@camarco.local';

-- Usuario General Prod - Superuser (todas las áreas)
UPDATE users 
SET 
  role = 'usuario',
  area_id = NULL
WHERE email = 'usuario-general@camarco.org.ar';

-- ========================================
-- PASO 5: Verificar resultado
-- ========================================
SELECT 'RESULTADO FINAL:' as info;
SELECT 
  u.name,
  u.email,
  u.role,
  a.name as area_name,
  CASE 
    WHEN u.role = 'admin' THEN 'Director Ejecutivo - Acceso total'
    WHEN u.role = 'usuario' THEN 'Superuser - Todas las áreas'
    WHEN u.role LIKE 'usuario_%' AND u.role NOT IN ('usuario', 'usuario_presupuestos') THEN 'Usuario de área - Solo su área'
    ELSE 'Rol: ' || u.role
  END as descripcion
FROM users u
LEFT JOIN areas a ON u.area_id = a.id
ORDER BY u.role, u.name;

-- ========================================
-- NOTAS IMPORTANTES:
-- ========================================
-- 1. Este script actualiza la estructura y los usuarios básicos
-- 2. Para asignar usuarios a áreas específicas, usa estos comandos:
--
-- EJEMPLO para crear un usuario de área:
-- UPDATE users 
-- SET 
--   role = 'usuario_sistemas',
--   area_id = (SELECT id FROM areas WHERE name LIKE '%istemas%')
-- WHERE email = 'usuario@ejemplo.com';
--
-- 3. Roles de área disponibles:
--    - usuario_administracion
--    - usuario_contable
--    - usuario_logistica
--    - usuario_marketing
--    - usuario_produccion
--    - usuario_rrhh
--    - usuario_sistemas
--    - usuario_ventas
-- ========================================
