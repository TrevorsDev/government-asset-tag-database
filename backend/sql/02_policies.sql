-- Make sure we’re in the public schema
set search_path to public;

-- Drop old policies first (avoid "already exists" errors when re-running)
drop policy if exists "Allow logged-in users to read assets" on assets;
drop policy if exists "Allow logged-in users to insert assets" on assets;
drop policy if exists "Allow logged-in users to update assets" on assets;
drop policy if exists "Allow logged-in users to delete assets" on assets;
drop policy if exists "Allow logged-in users to read import logs" on import_logs;
drop policy if exists "Allow logged-in users to insert import logs" on import_logs;

-- Policies: for now, let authenticated users do everything
create policy "Allow logged-in users to read assets"
  on assets for select
  using (auth.role() = 'authenticated');

create policy "Allow logged-in users to insert assets"
  on assets for insert
  with check (auth.role() = 'authenticated');

create policy "Allow logged-in users to update assets"
  on assets for update
  using (auth.role() = 'authenticated');

create policy "Allow logged-in users to delete assets"
  on assets for delete
  using (auth.role() = 'authenticated');

create policy "Allow logged-in users to read import logs"
  on import_logs for select
  using (auth.role() = 'authenticated');

create policy "Allow logged-in users to insert import logs"
  on import_logs for insert
  with check (auth.role() = 'authenticated');
