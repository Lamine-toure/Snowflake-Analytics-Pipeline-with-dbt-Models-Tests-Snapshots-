-- Test custom : vérifier qu'il n'y a aucun montant négatif

select *
from {{ ref('int_orders_enriched') }}
where amount < 0
