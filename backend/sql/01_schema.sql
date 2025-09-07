-- Assets table
CREATE TABLE if NOT EXISTS assets (
  id BIGSERIAL PRIMARY KEY,
  asset_tag TEXT UNIQUE NOT NULL,
  pr TEXT,
  status TEXT CHECK (status IN ('active', 'inactive', 'retired')),
  po TEXT,
  sn TEXT,
  model TEXT,
  manufacturer,
  dept TEXT,
  date_created TIMESTAMP DEFAULT NOW()
  notes TEXT,
);

-- Import logs (for tracking CSV uploads)
CREATE TABLE if NOT EXISTS import_logs (
  id BIGSERIAL PRIMARY KEY,
  FILENAME TEXT NOT NULL,
  imported_at TIMESTAMP NOT NULL(),
  row_count INT
);

-- Row-level security (required by Supabase)
alter table assets enable row level security;
alter table import_logs enable row level security;

