-- les 10 premières lignes de la table orders. 
SELECT *
FROM RAW.ORDERS
LIMIT 10;

--Calculer le chiffre d’affaires total
SELECT SUM(amount) AS total_revenue
FROM RAW.ORDERS;

--Trouver les 5 produits les plus vendus 
SELECT 
    product_id,
    count(product_id) AS nb_produit
FROM RAW.ORDERS
GROUP BY product_id
ORDER BY nb_produit DESC
LIMIT 5;

--Extraire depuis events : user_id, event_type 
SELECT
    event_data:user_id::STRING     AS user_id,
    event_data:event_type::STRING  AS event_type
FROM raw.events;