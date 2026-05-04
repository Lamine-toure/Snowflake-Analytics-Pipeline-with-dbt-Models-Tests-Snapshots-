select
    order_id,
    customer_id,
    product_id,
    cast(order_date as timestamp) as order_date,
    --cast(quantity as number) as quantity,
    cast(amount as number(10,2)) as amount,
    _ingestion_time
from {{ source('raw', 'orders') }}
