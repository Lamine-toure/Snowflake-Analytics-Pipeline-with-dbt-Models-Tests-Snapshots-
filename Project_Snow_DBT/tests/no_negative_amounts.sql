select *
from {{ ref('int_orders_enriched') }}
where amount < 0
