-- ===================================================================
-- queries.sql is filled with commands that allow you to regularly to interact with your data.
-- Example: list all active assets, search by asset tag, group by department, etc.
-- Queries = play with my data.
-- ===================================================================


-- 1. Get all assets
select * from assets;

-- 2. Find all active assets
select * from assets
where status = 'active';

-- 3. Find an asset by tag
select * from assets
where asset_tag = 'ASSET-001';

-- 4. Count assets by department
select dept, count(*) as total
from assets
group by dept
order by total desc;

-- 5. Recently added assets (last 7 days)
select *
from assets
where created_at > now() - interval '7 days';

-- 6. Search assets by keyword in notes
select *
from assets
where notes ilike '%broken%';

-- 7. Show distinct models
select distinct model
from assets;
