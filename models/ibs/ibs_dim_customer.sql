
select
    c_custkey, 
    c_name, 
    c_address, 
    c_nationkey, 
    c_phone, 
    c_acctbal, 
    c_mktsegment, 
    c_comment
from 
    snowflake_sample_data.tpch_sf1.customer
where 
    c_custkey <= 5
order by 
    c_custkey