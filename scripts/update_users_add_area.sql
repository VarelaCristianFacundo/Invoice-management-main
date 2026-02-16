-- Script para agregar column area_id a la tabla users
-- Ejecutar en la base de datos de Invoice Management

-- 1. Agregar columna area_id a la tabla users
ALTER TABLE users 
ADD COLUMN IF NOT EXISTS area_id UUID REFERENCES areas(id);

-- 2. Agregar índice para mejor rendimiento
CREATE INDEX IF NOT EXISTS idx_users_area_id ON users(area_id);

-- 3. Comentario para documentar la columna
COMMENT ON COLUMN users.area_id IS 'ID del área asignada al usuario. NULL para admin y usuarios con acceso a todas las áreas';

-- Verificar la estructura actualizada
SELECT column_name, data_type, is_nullable 
FROM information_schema.columns 
WHERE table_name = 'users' 
ORDER BY ordinal_position;
