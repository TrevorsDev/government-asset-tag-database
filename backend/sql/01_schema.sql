-- Assets table
create table if not exists assets (
  id bigserial primary key,
  asset_tag text unique not null,
  pr text,
  status text check (status in ('active', 'inactive', 'retired')),
  po text,
  sn text,
  model text,
  dept text,
  notes text,
  created_at timestamp default now()
);

-- Import logs (for tracking CSV uploads)
create table if not exists import_logs (
  id bigserial primary key,
  filename text not null,
  imported_at timestamp default now(),
  row_count int
);

-- Row-level security (required by Supabase)
alter table assets enable row level security;
alter table import_logs enable row level security;

