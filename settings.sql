-- Show all settings
select
    *
from
    system.settings
order by name;

-- Show changed and important settings
select
    *
from
    system.settings
where
    changed = 1
    or name in ('max_memory_usage', 'max_memory_usage_for_user', 'max_partitions_per_insert_block')
order by
    name;

-- Show version, uptime, timezone, current time
select
    version()
    , uptime()
    , timezone()
    , now();
