-- Eliminar usuarios de prueba anteriores
DELETE FROM users WHERE email LIKE '%camarco.local';

-- Recrear usuarios con las áreas correctas
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
  -- Obtener los IDs de cada área (usando LIKE para evitar problemas de encoding)
  SELECT id INTO area_administracion_id FROM areas WHERE name LIKE '%dministraci%';
  SELECT id INTO area_contable_id FROM areas WHERE name = 'Contable';
  SELECT id INTO area_logistica_id FROM areas WHERE name LIKE '%og%stica%';
  SELECT id INTO area_marketing_id FROM areas WHERE name = 'Marketing';
  SELECT id INTO area_produccion_id FROM areas WHERE name LIKE '%roducci%';
  SELECT id INTO area_rrhh_id FROM areas WHERE name LIKE '%ecursos%umanos%';
  SELECT id INTO area_sistemas_id FROM areas WHERE name = 'Sistemas';
  SELECT id INTO area_ventas_id FROM areas WHERE name = 'Ventas';

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
  SET name = EXCLUDED.name, 
      email = EXCLUDED.email, 
      password = EXCLUDED.password, 
      role = EXCLUDED.role, 
      area_id = EXCLUDED.area_id;

  -- Usuario General (Superuser) - todas las áreas
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
  SET name = EXCLUDED.name, 
      email = EXCLUDED.email, 
      password = EXCLUDED.password, 
      role = EXCLUDED.role, 
      area_id = EXCLUDED.area_id;

  -- Usuarios por área
  INSERT INTO users (name, email, password, role, area_id) VALUES
  ('Usuario Administracion', 'usuario-administracion@camarco.local', '$2b$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36ZK5gP3.gP/7TVbEIb0BhO', 'usuario_administracion', area_administracion_id),
  ('Usuario Contable', 'usuario-contable@camarco.local', '$2b$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36ZK5gP3.gP/7TVbEIb0BhO', 'usuario_contable', area_contable_id),
  ('Usuario Logistica', 'usuario-logistica@camarco.local', '$2b$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36ZK5gP3.gP/7TVbEIb0BhO', 'usuario_logistica', area_logistica_id),
  ('Usuario Marketing', 'usuario-marketing@camarco.local', '$2b$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36ZK5gP3.gP/7TVbEIb0BhO', 'usuario_marketing', area_marketing_id),
  ('Usuario Produccion', 'usuario-produccion@camarco.local', '$2b$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36ZK5gP3.gP/7TVbEIb0BhO', 'usuario_produccion', area_produccion_id),
  ('Usuario RRHH', 'usuario-rrhh@camarco.local', '$2b$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36ZK5gP3.gP/7TVbEIb0BhO', 'usuario_rrhh', area_rrhh_id),
  ('Usuario Sistemas', 'usuario-sistemas@camarco.local', '$2b$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36ZK5gP3.gP/7TVbEIb0BhO', 'usuario_sistemas', area_sistemas_id),
  ('Usuario Ventas', 'usuario-ventas@camarco.local', '$2b$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36ZK5gP3.gP/7TVbEIb0BhO', 'usuario_ventas', area_ventas_id)
  ON CONFLICT (email) DO UPDATE 
  SET name = EXCLUDED.name, 
      password = EXCLUDED.password, 
      role = EXCLUDED.role, 
      area_id = EXCLUDED.area_id;

END $$;

-- Verificar
SELECT 
  u.name,
  u.email,
  u.role,
  a.name as area_name
FROM users u
LEFT JOIN areas a ON u.area_id = a.id
WHERE u.email LIKE '%camarco.local'
ORDER BY u.role, u.name;
