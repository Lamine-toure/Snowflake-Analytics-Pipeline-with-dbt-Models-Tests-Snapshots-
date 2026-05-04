{% snapshot customers_snapshot %}

{{
    config(
        target_schema = 'STAGING',
        target_database = 'ECOMMERCE_DB',
        unique_key = 'customer_id',

        strategy = 'timestamp',
        updated_at = '_ingestion_time',   
        invalidate_hard_deletes = True
    )
}}

select
    customer_id,
    name,
    country,
    _ingestion_time
from {{ ref('stg_customers') }}

{% endsnapshot %}
