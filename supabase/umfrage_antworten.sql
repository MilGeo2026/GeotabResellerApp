-- Einmalig im Supabase SQL-Editor ausführen (Projekt kuzvtbikcmjncymambmf),
-- damit Kundenumfrage-Antworten direkt im CRM-Portal ankommen statt per E-Mail.

create table if not exists public.umfrage_antworten (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  data jsonb not null
);

alter table public.umfrage_antworten enable row level security;

-- Kunden füllen die Umfrage ohne Login aus -> anonymes Einreichen erlauben
create policy "Oeffentliches Einreichen erlaubt"
on public.umfrage_antworten
for insert
to anon
with check (true);

-- Antworten sollen nur im (angemeldeten) Reseller-Portal einsehbar sein
create policy "Nur angemeldete Nutzer duerfen lesen"
on public.umfrage_antworten
for select
to authenticated
using (true);
