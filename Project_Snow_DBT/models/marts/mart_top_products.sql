with enriched as (
    select * from {{ ref('int_orders_enriched') }}
),

agg as (
    select
        product_id,
        product_name,
        category,
        count(*) as nb_orders,
        sum(amount) as total_revenue_eur,
        count(distinct customer_id) as nb_unique_customers,
    from enriched
    group by product_id, product_name, category
)

select *
from agg
order by total_revenue_eur desc
