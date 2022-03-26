-- Show tables statistic
select
    concat(database, '.', table) as `table`
    , round(sum(bytes) / 1024. / 1024., 2) as size_mb
    , formatReadableSize(sum(bytes)) as `size`
    , sum(rows) as `rows`
    , max(modification_time) as latest_modification
    , any(engine) as engine
    , formatReadableSize(sum(primary_key_bytes_in_memory)) as primary_keys_size
from
    system.parts
where
    active = 1
    and database != 'system'
group by
    database
    , `table`
order by
    size_mb desc;

-- Show tables statistic
select
    concat(
        database, '.', name
    ) as "table"
    , engine
    , storage_policy
    , data_paths
    , formatReadableSize(total_bytes) as table_size
    , total_rows
from
    system.tables
where
    database != 'system'
    and engine like '%MergeTree'
order by total_bytes desc;

-- Show tables statistic by disk_name
select
    database
    , `table`
    , disk_name
    , sum(rows) as `rows`
from
    system.parts
where
    active = 1
    database != 'system'
group by
    database
    , `table`
    , disk_name
order by 1, 2, 3;
