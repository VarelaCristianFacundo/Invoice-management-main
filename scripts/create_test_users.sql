-- Script para crear usuarios de prueba con los nuevos roles
-- Ejecutar en la base de datos invoice_management local

-- Primero, asegúrate de que la columna area_id existe
-- Si no la has agregado, ejecuta primero: update_users_add_area.sql

-- Obtener IDs de las áreas para asignarlas a los usuarios
DO $$
DECLARE
  area_administracion_id UUID;
  area_contable_id UUID;
  area_logistica_id UUID;
  area_marketing_id UUID;
  area_produccion_id UUID;
  area_rrhh_id UUID;
  area_sistemas_id UUID;
  area_ventas_id UUID;
BEGIN
  -- Obtener los IDs de cada área
  SELECT id INTO area_administracion_id FROM areas WHERE name ILIKE '%administraci%';
  SELECT id INTO area_contable_id FROM areas WHERE name ILIKE '%contable%';
  SELECT id INTO area_logistica_id FROM areas WHERE name ILIKE '%log%stica%';
  SELECT id INTO area_marketing_id FROM areas WHERE name ILIKE '%marketing%';
  SELECT id INTO area_produccion_id FROM areas WHERE name ILIKE '%producci%n%';
  SELECT id INTO area_rrhh_id FROM areas WHERE name ILIKE '%recursos%humanos%';
  SELECT id INTO area_sistemas_id FROM areas WHERE name ILIKE '%sistemas%';
  SELECT id INTO area_ventas_id FROM areas WHERE name ILIKE '%ventas%';

  -- Insertar usuarios de prueba
  -- Contraseña para todos: "password123" (hasheada con bcrypt, cost 10)
  
  -- Admin (Director Ejecutivo) - acceso total
  INSERT INTO users (id, name, email, password, role, area_id)
  VALUES (
    '410544b2-4001-4271-9855-fec4b6a6442a',
    'Admin CAMARCO',
    'admin@camarco.local',
    '$2b$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36ZK5gP3.gP/7TVbEIb0BhO',
    'admin',
    NULL
  )
  ON CONFLICT (id) DO UPDATE 
  SET role = 'admin', area_id = NULL;

  -- Usuario General (Superuser Común) - puede cargar facturas de cualquier área
  INSERT INTO users (id, name, email, password, role, area_id)
  VALUES (
    '74c57085-5740-44a5-8848-2e50515b5b0c',
    'Usuario General',
    'usuario-general@camarco.local',
    '$2b$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36ZK5gP3.gP/7TVbEIb0BhO',
    'usuario',
    NULL
  )
  ON CONFLICT (id) DO UPDATE 
  SET role = 'usuario', area_id = NULL;

  -- Usuario área Administración
  INSERT INTO users (id, name, email, password, role, area_id)
  VALUES (
    uuid_generate_v4(),
    'Usuario Administración',
    'usuario-administracion@camarco.local',
    '$2b$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36ZK5gP3.gP/7TVbEIb0BhO',
    'usuario_administracion',
    area_administracion_id
  )
  ON CONFLICT (email) DO UPDATE 
  SET role = 'usuario_administracion', area_id = area_administracion_id;

  -- Usuario área Contable
  INSERT INTO users (id, name, email, password, role, area_id)
  VALUES (
    uuid_generate_v4(),
    'Usuario Contable',
    'usuario-contable@camarco.local',
    '$2b$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36ZK5gP3.gP/7TVbEIb0BhO',
    'usuario_contable',
    area_contable_id
  )
  ON CONFLICT (email) DO UPDATE 
  SET role = 'usuario_contable', area_id = area_contable_id;

  -- Usuario área Logística
  INSERT INTO users (id, name, email, password, role, area_id)
  VALUES (
    uuid_generate_v4(),
    'Usuario Logística',
    'usuario-logistica@camarco.local',
    '$2b$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36ZK5gP3.gP/7TVbEIb0BhO',
    'usuario_logistica',
    area_logistica_id
  )
  ON CONFLICT (email) DO UPDATE 
  SET role = 'usuario_logistica', area_id = area_logistica_id;

  -- Usuario área Marketing
  INSERT INTO users (id, name, email, password, role, area_id)
  VALUES (
    uuid_generate_v4(),
    'Usuario Marketing',
    'usuario-marketing@camarco.local',
    '$2b$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36ZK5gP3.gP/7TVbEIb0BhO',
    'usuario_marketing',
    area_marketing_id
  )
  ON CONFLICT (email) DO UPDATE 
  SET role = 'usuario_marketing', area_id = area_marketing_id;

  -- Usuario área Producción
  INSERT INTO users (id, name, email, password, role, area_id)
  VALUES (
    uuid_generate_v4(),
    'Usuario Producción',
    'usuario-produccion@camarco.local',
    '$2b$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36ZK5gP3.gP/7TVbEIb0BhO',
    'usuario_produccion',
    area_produccion_id
  )
  ON CONFLICT (email) DO UPDATE 
  SET role = 'usuario_produccion', area_id = area_produccion_id;

  -- Usuario área Recursos Humanos
  INSERT INTO users (id, name, email, password, role, area_id)
  VALUES (
    uuid_generate_v4(),
    'Usuario RRHH',
    'usuario-rrhh@camarco.local',
    '$2b$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36ZK5gP3.gP/7TVbEIb0BhO',
    'usuario_rrhh',
    area_rrhh_id
  )
  ON CONFLICT (email) DO UPDATE 
  SET role = 'usuario_rrhh', area_id = area_rrhh_id;

  -- Usuario área Sistemas
  INSERT INTO users (id, name, email, password, role, area_id)
  VALUES (
    uuid_generate_v4(),
    'Usuario Sistemas',
    'usuario-sistemas@camarco.local',
    '$2b$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36ZK5gP3.gP/7TVbEIb0BhO',
    'usuario_sistemas',
    area_sistemas_id
  )
  ON CONFLICT (email) DO UPDATE 
  SET role = 'usuario_sistemas', area_id = area_sistemas_id;

  -- Usuario área Ventas
  INSERT INTO users (id, name, email, password, role, area_id)
  VALUES (
    uuid_generate_v4(),
    'Usuario Ventas',
    'usuario-ventas@camarco.local',
    '$2b$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36ZK5gP3.gP/7TVbEIb0BhO',
    'usuario_ventas',
    area_ventas_id
  )
  ON CONFLICT (email) DO UPDATE 
  SET role = 'usuario_ventas', area_id = area_ventas_id;

END $$;

-- Verificar los usuarios creados
SELECT 
  u.name,
  u.email,
  u.role,
  a.name as area_name
FROM users u
LEFT JOIN areas a ON u.area_id = a.id
ORDER BY u.role, u.name;
