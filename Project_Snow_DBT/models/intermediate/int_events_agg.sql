with events as (
    select * from {{ref("stg_events")}}
)

select 
    user_id,
    count(*) as nb_events,
    count(distinct event_type) as nb_event_types,
from events
group by user_id
order by nb_events desc