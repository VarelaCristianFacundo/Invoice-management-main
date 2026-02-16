-- Script para agregar Usuario Contable en PRODUCCIÓN
-- El Usuario Contable tiene permisos especiales (por definir con el cliente)

-- ========================================
-- Crear Usuario Contable
-- ========================================
INSERT INTO users (name, email, password, role, area_id)
VALUES (
  'Usuario Contable',
  'usuario-contable@camarco.org.ar',
  -- Usar la misma contraseña que admin (123456)
  (SELECT password FROM users WHERE email = 'admin@camarco.local' LIMIT 1),
  'usuario_contable',
  NULL  -- No está limitado a un área específica
)
ON CONFLICT (email) 
DO UPDATE 
SET name = EXCLUDED.name,
    password = EXCLUDED.password,
    role = EXCLUDED.role,
    area_id = EXCLUDED.area_id;

-- ========================================
-- Verificar todos los usuarios
-- ========================================
SELECT '========================================' as separador;
SELECT 'USUARIOS CONFIGURADOS:' as info;
SELECT '========================================' as separador;

SELECT 
  u.name,
  u.email,
  u.role,
  a.name as area_asignada,
  CASE 
    WHEN u.role = 'admin' THEN '✓ Director Ejecutivo - Acceso total'
    WHEN u.role = 'usuario' THEN '✓ Superuser Común - Todas las áreas'
    WHEN u.role = 'usuario_contable' THEN '✓ Usuario Contable - Permisos especiales'
    WHEN u.role LIKE 'usuario_%' THEN '✓ Usuario Común - Solo su área'
    ELSE '? ' || u.role
  END as descripcion
FROM users u
LEFT JOIN areas a ON u.area_id = a.id
WHERE u.email LIKE '%camarco.%'
ORDER BY 
  CASE 
    WHEN u.role = 'admin' THEN 1
    WHEN u.role = 'usuario' THEN 2
    WHEN u.role = 'usuario_contable' THEN 3
    ELSE 4
  END,
  a.name;

-- ========================================
-- Resumen de Credenciales
-- ========================================
SELECT '========================================' as separador;
SELECT 'CREDENCIALES DE ACCESO:' as info;
SELECT '========================================' as separador;

SELECT 
  CASE 
    WHEN role = 'admin' THEN '1. Director Ejecutivo'
    WHEN role = 'usuario' THEN '2. Superuser Común'
    WHEN role = 'usuario_contable' THEN '3. Usuario Contable'
    WHEN role LIKE 'usuario_%' THEN '4. Usuario Común (Área: ' || COALESCE((SELECT name FROM areas WHERE id = area_id), 'N/A') || ')'
    ELSE '? ' || role
  END as tipo_usuario,
  email,
  '123456' as password
FROM users
WHERE email LIKE '%camarco.%'
ORDER BY 
  CASE 
    WHEN role = 'admin' THEN 1
    WHEN role = 'usuario' THEN 2
    WHEN role = 'usuario_contable' THEN 3
    ELSE 4
  END;
