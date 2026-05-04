select
    event_data:user_id::string as user_id,
    event_data:event_type::string as event_type,
    event_data:timestamp::timestamp as event_timestamp,
    event_data as raw_event,
    _ingestion_time
from {{ source('raw', 'events') }}
