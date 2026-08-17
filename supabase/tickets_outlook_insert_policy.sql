-- Einmalig im Supabase SQL-Editor ausführen (Projekt kuzvtbikcmjncymambmf),
-- damit Power Automate (Outlook) neue Tickets per REST-API anlegen kann.
--
-- Erlaubt zusätzlich zu den bestehenden Policies (siehe tickets.sql) das
-- anonyme Einreichen neuer Tickets, genau wie schon bei umfrage_antworten.
-- Lesen/Ändern/Löschen bleibt weiterhin nur angemeldeten Portal-Nutzern
-- vorbehalten.

create policy "Oeffentliches Einreichen erlaubt (z.B. Outlook-Automatisierung)"
on public.tickets
for insert
to anon
with check (true);
