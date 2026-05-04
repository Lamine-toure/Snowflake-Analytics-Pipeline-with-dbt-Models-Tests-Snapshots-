select
    product_id,
    name,
    category,
    --cast(price as number(10,2)) as price,
    --cast(created_at as timestamp) as created_at,
    _ingestion_time
from {{ source('raw', 'products') }}