--insert into pg_stat_statements_24gb_ram (
--insert into pg_stat_statements_16gb_ram (
insert into pg_stat_statements_8gb_ram (
userid, dbid, queryid, query, calls, total_time, min_time, max_time, mean_time, stddev_time, rows,
shared_blks_hit, shared_blks_read, shared_blks_dirtied, shared_blks_written, local_blks_hit,
local_blks_read, local_blks_dirtied, local_blks_written, temp_blks_read, temp_blks_written,
blk_read_time, blk_write_time)
select * from pg_stat_statements;

select pg_stat_statements_reset();
