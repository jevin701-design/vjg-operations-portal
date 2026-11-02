-- Actualización 001: columnas de peso en flota
-- Ejecutar en Supabase SQL Editor

ALTER TABLE public.fleet
  ADD COLUMN IF NOT EXISTS mtow_kg integer,
  ADD COLUMN IF NOT EXISTS mlw_kg integer,
  ADD COLUMN IF NOT EXISTS oew_kg integer;

-- Comentarios
COMMENT ON COLUMN public.fleet.mtow_kg IS 'Maximum Takeoff Weight (kg)';
COMMENT ON COLUMN public.fleet.mlw_kg IS 'Maximum Landing Weight (kg)';
COMMENT ON COLUMN public.fleet.oew_kg IS 'Operating Empty Weight (kg)';
