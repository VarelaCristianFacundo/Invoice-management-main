-- Script para corregir las áreas de los usuarios
-- Primero veamos qué áreas existen

SELECT '=== ÁREAS DISPONIBLES ===' as info;
SELECT id, name FROM areas ORDER BY name;

SELECT '=== USUARIOS SIN ÁREA ASIGNADA ===' as info;
SELECT u.name, u.email, u.role, u.area_id
FROM users u
WHERE u.role LIKE 'usuario_%' 
  AND u.role != 'usuario'
  AND u.role != 'usuario_contable'
  AND u.role != 'usuario_presupuestos'
  AND u.area_id IS NULL;

-- Ahora asignamos las áreas correctamente
-- Nota: Los nombres deben coincidir EXACTAMENTE con lo que hay en la tabla areas

DO $$
DECLARE
  area_secretaria_id UUID;
  area_sistemas_id UUID;
  area_comunicacion_id UUID;
  area_gdi_id UUID;
  area_egc_id UUID;
  area_gt_id UUID;
BEGIN
  -- Obtener IDs de áreas (probando diferentes variantes de nombres)
  SELECT id INTO area_secretaria_id FROM areas WHERE name ILIKE '%secretar%' LIMIT 1;
  SELECT id INTO area_sistemas_id FROM areas WHERE name ILIKE '%sistema%' LIMIT 1;
  SELECT id INTO area_comunicacion_id FROM areas WHERE name ILIKE '%comunicaci%' LIMIT 1;
  SELECT id INTO area_gdi_id FROM areas WHERE name ILIKE '%gdi%' LIMIT 1;
  SELECT id INTO area_egc_id FROM areas WHERE name ILIKE '%egc%' LIMIT 1;
  SELECT id INTO area_gt_id FROM areas WHERE name ILIKE '%gt%' LIMIT 1;

  -- Mostrar lo que encontramos
  RAISE NOTICE 'Secretaría ID: %', area_secretaria_id;
  RAISE NOTICE 'Sistemas ID: %', area_sistemas_id;
  RAISE NOTICE 'Comunicación ID: %', area_comunicacion_id;
  RAISE NOTICE 'GDI ID: %', area_gdi_id;
  RAISE NOTICE 'EGC ID: %', area_egc_id;
  RAISE NOTICE 'GT ID: %', area_gt_id;

  -- Actualizar usuarios
  IF area_secretaria_id IS NOT NULL THEN
    UPDATE users SET area_id = area_secretaria_id 
    WHERE role = 'usuario_secretaria';
  END IF;

  IF area_sistemas_id IS NOT NULL THEN
    UPDATE users SET area_id = area_sistemas_id 
    WHERE role = 'usuario_sistemas';
  END IF;

  IF area_comunicacion_id IS NOT NULL THEN
    UPDATE users SET area_id = area_comunicacion_id 
    WHERE role = 'usuario_comunicacion';
  END IF;

  IF area_gdi_id IS NOT NULL THEN
    UPDATE users SET area_id = area_gdi_id 
    WHERE role = 'usuario_gdi';
  END IF;

  IF area_egc_id IS NOT NULL THEN
    UPDATE users SET area_id = area_egc_id 
    WHERE role = 'usuario_egc';
  END IF;

  IF area_gt_id IS NOT NULL THEN
    UPDATE users SET area_id = area_gt_id 
    WHERE role = 'usuario_gt';
  END IF;

END $$;

-- Verificar resultados
SELECT '=== RESULTADO FINAL ===' as info;
SELECT 
  u.name,
  u.email,
  u.role,
  a.name as area_name,
  CASE 
    WHEN u.area_id IS NULL AND u.role LIKE 'usuario_%' AND u.role NOT IN ('usuario', 'usuario_contable', 'usuario_presupuestos') 
      THEN '⚠️  ERROR: Falta área'
    WHEN u.area_id IS NOT NULL 
      THEN '✓ OK'
    ELSE '✓ OK (no necesita área)'
  END as estado
FROM users u
LEFT JOIN areas a ON u.area_id = a.id
ORDER BY u.role, u.name;
