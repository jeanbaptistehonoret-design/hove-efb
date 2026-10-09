-- Tables EFB (à exécuter dans Supabase > SQL Editor)
create table if not exists efb_frat(
  id uuid primary key default gen_random_uuid(), pilot_id uuid, flight_id uuid,
  score int, level text, answers jsonb, created_at timestamptz default now());
create table if not exists efb_squawks(
  id uuid primary key default gen_random_uuid(), aircraft_id uuid, pilot_id uuid, flight_id uuid,
  category text, description text, status text default 'OPEN', created_at timestamptz default now());
create table if not exists efb_flight_logs(
  id uuid primary key default gen_random_uuid(), flight_id uuid, pilot_id uuid,
  block_off text, block_on text, flight_time numeric, fuel_remaining numeric, cycles int, notes text,
  created_at timestamptz default now());
alter table efb_frat enable row level security;
alter table efb_squawks enable row level security;
alter table efb_flight_logs enable row level security;
-- Même modèle d'accès que HOVE OPS (clé anon). À durcir avec Supabase Auth avant usage réel.
create policy anon_all on efb_frat for all using (true) with check (true);
create policy anon_all on efb_squawks for all using (true) with check (true);
create policy anon_all on efb_flight_logs for all using (true) with check (true);
