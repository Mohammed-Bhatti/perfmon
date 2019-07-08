-- Use thse queries to gather the required statistics during the relevant intervals

-- FOR 8GB RAM
with foo as (
select date_trunc('minute', dttm), query
from pg_stat_statements_8gb_ram
where 1=1
and dttm between '2019-06-26 13:00:00' and '2019-06-26 17:00:00'
)
select a.query, sum(total_time) as total_time, sum(calls) as calls, sum(rows) as rows, min(min_time) as min_time, max(max_time) as max_time, 
avg(mean_time) as mean_time, sqrt(avg(power(stddev_time,2))) as avg_stddev_time, sum(blk_read_time) as blk_read_time, sum(blk_write_time) as blk_write_time
from pg_stat_statements_8gb_ram a, foo
where a.query = foo.query
and a.query ilike '%dbup_adj_work_srcid_metric%'
or a.query ilike '%dbup_del_work_srcid_metric%'
or a.query ilike '%del_trk_attr_store_exp%'
or a.query ilike '%del_trk_attr_store_no_attr%'
or a.query ilike '%exp_work_track_needed%'
or a.query ilike '%fill_work_track_needed%'
or a.query ilike '%get_int_state_variable%'
or a.query ilike '%mark_no_change_attr%'
or a.query ilike '%mrg_work_track_needed%'
or a.query ilike '%new_work_track_needed%'
or a.query ilike '%set_dttm_state_variable%'
or a.query ilike '%set_int_state_variable%'
or a.query ilike '%track_create%'
or a.query ilike '%track_expire%'
or a.query ilike '%track_reactivate%'
or a.query ilike '%update_srcid_metrics%'
or a.query ilike '%update_track_active_attr%'
or a.query ilike '%update_track_attr_store%'
or a.query ilike '%update_trk_metrics%'
group by a.query
order by a.query;

-- FOR 16GB RAM
with foo as (
select date_trunc('minute', dttm), query
--, total_time, calls, rows, min_time, max_time, mean_time, stddev_time, blk_read_time, blk_write_time
from pg_stat_statements_16gb_ram
where 1=1
and dttm between '2019-07-02 13:00:00' and '2019-07-02 17:00:00'
)
select a.query, sum(total_time) as total_time, sum(calls) as calls, sum(rows) as rows, min(min_time) as min_time, max(max_time) as max_time, 
avg(mean_time) as mean_time, sqrt(avg(power(stddev_time,2))) as avg_stddev_time, sum(blk_read_time) as blk_read_time, sum(blk_write_time) as blk_write_time
from pg_stat_statements_8gb_ram a, foo
where a.query = foo.query
and a.query ilike '%dbup_adj_work_srcid_metric%'
or a.query ilike '%dbup_del_work_srcid_metric%'
or a.query ilike '%del_trk_attr_store_exp%'
or a.query ilike '%del_trk_attr_store_no_attr%'
or a.query ilike '%exp_work_track_needed%'
or a.query ilike '%fill_work_track_needed%'
or a.query ilike '%get_int_state_variable%'
or a.query ilike '%mark_no_change_attr%'
or a.query ilike '%mrg_work_track_needed%'
or a.query ilike '%new_work_track_needed%'
or a.query ilike '%set_dttm_state_variable%'
or a.query ilike '%set_int_state_variable%'
or a.query ilike '%track_create%'
or a.query ilike '%track_expire%'
or a.query ilike '%track_reactivate%'
or a.query ilike '%update_srcid_metrics%'
or a.query ilike '%update_track_active_attr%'
or a.query ilike '%update_track_attr_store%'
or a.query ilike '%update_trk_metrics%'
group by a.query
order by a.query;

-- FOR 24GB RAM
with foo as (
select date_trunc('minute', dttm), query
from pg_stat_statements_24gb_ram
where 1=1
and dttm between '2019-07-03 13:00:00' and '2019-07-03 17:00:00'
)
select a.query, sum(total_time) as total_time, sum(calls) as calls, sum(rows) as rows, min(min_time) as min_time, max(max_time) as max_time, 
avg(mean_time) as mean_time, sqrt(avg(power(stddev_time,2))) as avg_stddev_time, sum(blk_read_time) as blk_read_time, sum(blk_write_time) as blk_write_time
from pg_stat_statements_8gb_ram a, foo
where a.query = foo.query
and a.query ilike '%dbup_adj_work_srcid_metric%'
or a.query ilike '%dbup_del_work_srcid_metric%'
or a.query ilike '%del_trk_attr_store_exp%'
or a.query ilike '%del_trk_attr_store_no_attr%'
or a.query ilike '%exp_work_track_needed%'
or a.query ilike '%fill_work_track_needed%'
or a.query ilike '%get_int_state_variable%'
or a.query ilike '%mark_no_change_attr%'
or a.query ilike '%mrg_work_track_needed%'
or a.query ilike '%new_work_track_needed%'
or a.query ilike '%set_dttm_state_variable%'
or a.query ilike '%set_int_state_variable%'
or a.query ilike '%track_create%'
or a.query ilike '%track_expire%'
or a.query ilike '%track_reactivate%'
or a.query ilike '%update_srcid_metrics%'
or a.query ilike '%update_track_active_attr%'
or a.query ilike '%update_track_attr_store%'
or a.query ilike '%update_trk_metrics%'
group by a.query
order by a.query;

-- List data by RAM size
with foo as (
select 8 as "RAM", dttm, query, total_time, calls, rows, min_time, max_time, 
mean_time, stddev_time, blk_read_time, blk_write_time
from pg_stat_statements_8gb_ram
where 1=1
and dttm between '2019-06-26 13:00:00' and '2019-06-26 17:00:00'
UNION
select 16 as "RAM", dttm, query, total_time, calls, rows, min_time, max_time, 
mean_time, stddev_time, blk_read_time, blk_write_time
from pg_stat_statements_16gb_ram
where 1=1
and dttm between '2019-07-02 13:00:00' and '2019-07-02 17:00:00'
UNION
select 24 as "RAM", dttm, query, total_time, calls, rows, min_time, max_time, 
mean_time, stddev_time, blk_read_time, blk_write_time
from pg_stat_statements_24gb_ram
where 1=1
and dttm between '2019-07-03 13:00:00' and '2019-07-03 17:00:00'
order by query, "RAM")
select "RAM", query, sum(total_time) as total_time, sum(calls) as calls, sum(rows) as rows, min(min_time) as min_time, max(max_time) as max_time, 
avg(mean_time) as mean_time, sqrt(avg(power(stddev_time,2))) as avg_stddev_time, sum(blk_read_time) as blk_read_time, sum(blk_write_time) as blk_write_time 
from foo
where 1=1
and query ilike '%dbup_adj_work_srcid_metric%'
or query ilike '%dbup_del_work_srcid_metric%'
or query ilike '%del_trk_attr_store_exp%'
or query ilike '%del_trk_attr_store_no_attr%'
or query ilike '%exp_work_track_needed%'
or query ilike '%fill_work_track_needed%'
or query ilike '%get_int_state_variable%'
or query ilike '%mark_no_change_attr%'
or query ilike '%mrg_work_track_needed%'
or query ilike '%new_work_track_needed%'
or query ilike '%set_dttm_state_variable%'
or query ilike '%set_int_state_variable%'
or query ilike '%track_create%'
or query ilike '%track_expire%'
or query ilike '%track_reactivate%'
or query ilike '%update_srcid_metrics%'
or query ilike '%update_track_active_attr%'
or query ilike '%update_track_attr_store%'
or query ilike '%update_trk_metrics%'
group by query, "RAM"
order by query, "RAM";
