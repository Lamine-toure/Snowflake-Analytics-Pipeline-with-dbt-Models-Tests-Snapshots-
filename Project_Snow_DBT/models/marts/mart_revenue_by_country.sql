with enriched as (
    select * from {{ ref('int_orders_enriched') }}
),

revenue as (
    select
        country,
        sum(amount) as revenue_eur,
        {{ conversion_montant("sum(amount)", 1.1) }} as revenue_us

    from enriched
    group by country
)

select * from revenue
order by revenue_eur desc
