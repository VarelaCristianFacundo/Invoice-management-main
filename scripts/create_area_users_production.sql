-- Script para crear usuarios según las áreas existentes en PRODUCCIÓN
-- Ejecutar DESPUÉS de production_setup.sql

-- ========================================
-- PASO 1: Ver áreas disponibles
-- ========================================
SELECT '========================================' as separador;
SELECT 'ÁREAS EXISTENTES EN PRODUCCIÓN:' as info;
SELECT '========================================' as separador;
SELECT id, name FROM areas ORDER BY name;

-- ========================================
-- PASO 2: Crear usuarios para cada área
-- ========================================
DO $$
DECLARE
  area_record RECORD;
  usuario_email TEXT;
  usuario_name TEXT;
  usuario_role TEXT;
BEGIN
  -- Recorrer todas las áreas y crear un usuario para cada una
  FOR area_record IN SELECT id, name FROM areas ORDER BY name
  LOOP
    -- Generar email basado en el nombre del área
    -- Convertir a minúsculas, quitar acentos, reemplazar espacios
    usuario_email := 'usuario-' || 
                     LOWER(
                       REPLACE(
                         REPLACE(
                           REPLACE(
                             REPLACE(
                               REPLACE(area_record.name, ' ', '-'),
                               'á', 'a'),
                             'é', 'e'),
                           'í', 'i'),
                         'ó', 'o')
                     ) || '@camarco.org.ar';
    
    -- Generar nombre de usuario
    usuario_name := 'Usuario ' || area_record.name;
    
    -- Generar rol basado en el nombre del área
    usuario_role := 'usuario_' || 
                    LOWER(
                      REPLACE(
                        REPLACE(
                          REPLACE(
                            REPLACE(
                              REPLACE(area_record.name, ' ', '_'),
                              'á', 'a'),
                            'é', 'e'),
                          'í', 'i'),
                        'ó', 'o')
                    );
    
    -- Insertar o actualizar el usuario
    INSERT INTO users (name, email, password, role, area_id)
    VALUES (
      usuario_name,
      usuario_email,
      -- Usar la misma contraseña que ya funciona (la de admin@camarco.local)
      (SELECT password FROM users WHERE email = 'admin@camarco.local' LIMIT 1),
      usuario_role,
      area_record.id
    )
    ON CONFLICT (email) 
    DO UPDATE 
    SET name = EXCLUDED.name,
        password = EXCLUDED.password,
        role = EXCLUDED.role,
        area_id = EXCLUDED.area_id;
    
    RAISE NOTICE 'Creado/Actualizado: % (%) - Rol: %', usuario_name, usuario_email, usuario_role;
  END LOOP;
END $$;

-- ========================================
-- PASO 3: Verificar usuarios creados
-- ========================================
SELECT '========================================' as separador;
SELECT 'USUARIOS CREADOS POR ÁREA:' as info;
SELECT '========================================' as separador;
SELECT 
  u.name,
  u.email,
  u.role,
  a.name as area_name,
  CASE 
    WHEN u.role = 'admin' THEN '✓ Director Ejecutivo - Acceso total'
    WHEN u.role = 'usuario' THEN '✓ Superuser - Todas las áreas'
    WHEN u.role LIKE 'usuario_%' THEN '✓ Usuario de área'
    ELSE '? Rol desconocido'
  END as tipo_acceso
FROM users u
LEFT JOIN areas a ON u.area_id = a.id
ORDER BY 
  CASE 
    WHEN u.role = 'admin' THEN 1
    WHEN u.role = 'usuario' THEN 2
    ELSE 3
  END,
  a.name;

-- ========================================
-- PASO 4: Resumen de credenciales
-- ========================================
SELECT '========================================' as separador;
SELECT 'CREDENCIALES PARA INICIAR SESIÓN:' as info;
SELECT '========================================' as separador;
SELECT 
  email,
  'Contraseña: 123456' as password,
  role as rol
FROM users
WHERE email LIKE '%camarco.%'
ORDER BY 
  CASE 
    WHEN role = 'admin' THEN 1
    WHEN role = 'usuario' THEN 2
    ELSE 3
  END,
  email;
