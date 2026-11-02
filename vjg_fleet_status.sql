-- Columna para mostrar estado deslizable en flota (público)
ALTER TABLE public.fleet
  ADD COLUMN IF NOT EXISTS status_display text;
COMMENT ON COLUMN public.fleet.status_display IS 'Texto de estado para ticker (EN VUELO / Completado · Xh)';
