-- Cache de vuelos recientes de IF para vista pública
CREATE TABLE IF NOT EXISTS public.bitacora_cache (
  id text PRIMARY KEY,
  registration text,
  avion text,
  origin_icao text,
  destination_icao text,
  usage_type text,
  pilot_name text,
  actual_departure_utc timestamptz,
  actual_arrival_utc timestamptz,
  flight_time_minutes numeric,
  status_display text,
  updated_at timestamptz DEFAULT now()
);

ALTER TABLE public.bitacora_cache ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public read bitacora_cache" ON public.bitacora_cache;
CREATE POLICY "public read bitacora_cache" ON public.bitacora_cache FOR SELECT USING (true);
DROP POLICY IF EXISTS "auth write bitacora_cache" ON public.bitacora_cache;
CREATE POLICY "auth write bitacora_cache" ON public.bitacora_cache FOR ALL USING (true) WITH CHECK (true);
