-- Show all active processes
select
    query_id
    , `user`
    , client_name
    , current_database
    , toUInt64(elapsed) as elapsed_sec
    , formatReadableSize(memory_usage) as memory_usage
    , query
from
    system.processes
where
    query not like '%system.processes%';

-- Kill query by query_id
kill query where query_id = 'xxx';
