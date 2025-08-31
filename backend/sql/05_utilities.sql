-- ===================================================================
-- utilities.sql is filled with commands that you’d use occasionally to check, verify, or maintain the database itself.
-- Example: check row counts, inspect schema, truncate table, delete all rows, etc.
-- Utilities = “check/fix my database.
-- ===================================================================


-- 1. Verify schema (list columns + types)
select column_name, data_type
from information_schema.columns
where table_name = 'assets';

-- 2. Count rows in assets
select count(*) as total_assets from assets;

-- 3. Count rows in import logs
select count(*) as total_imports from import_logs;

-- 4. Preview first 10 assets
select * from assets limit 10;

-- 5. Delete all rows from assets (keeps schema)
delete from assets;

-- 6. Truncate assets (faster + resets ID counter)
truncate table assets restart identity cascade;

-- 7. Drop the assets table completely (be careful!)
drop table if exists assets cascade;
