{% macro conversion_montant(amount, rate) %}
    ({{ amount }} * {{ rate }})
{%endmacro%}