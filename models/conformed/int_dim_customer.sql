
with 

    acbs_dim_customer as (select * 
                          from {{ source('boc_raw', 'ibs_dim_customer') }}),

    ibs_dim_customer as (select * 
                         from {{ source('boc_raw', 'acbs_dim_customer') }}),
    final as 
            (select 
                c_custkey, 
                c_name, 
                c_address, 
                c_nationkey, 
                c_phone, 
                c_acctbal, 
                c_mktsegment, 
                c_comment
            from 
                acbs_dim_customer

            union all

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
                ibs_dim_customer
            )

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
    final
