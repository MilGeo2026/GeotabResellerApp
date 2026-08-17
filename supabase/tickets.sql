-- Einmalig im Supabase SQL-Editor ausführen (Projekt kuzvtbikcmjncymambmf),
-- damit das Ticketsystem im CRM-Portal funktioniert.

create table if not exists public.tickets (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  data jsonb not null
);

alter table public.tickets enable row level security;

-- Tickets sind eine interne Funktion des Portals -> nur angemeldete Nutzer duerfen sie sehen/bearbeiten
create policy "Nur angemeldete Nutzer duerfen lesen"
on public.tickets
for select
to authenticated
using (true);

create policy "Nur angemeldete Nutzer duerfen anlegen"
on public.tickets
for insert
to authenticated
with check (true);

create policy "Nur angemeldete Nutzer duerfen aendern"
on public.tickets
for update
to authenticated
using (true)
with check (true);

create policy "Nur angemeldete Nutzer duerfen loeschen"
on public.tickets
for delete
to authenticated
using (true);
