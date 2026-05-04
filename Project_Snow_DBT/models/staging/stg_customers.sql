select
    customer_id,
    name,
    --email,
    country,
    --cast(created_at as timestamp) as created_at,
    _ingestion_time
from {{ source('raw', 'customers') }}