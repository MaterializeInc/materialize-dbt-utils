{% macro materialize__dateadd(datepart, interval, from_date_or_timestamp) %}
    {{ return(dbt_utils.postgres__dateadd(datepart, interval, from_date_or_timestamp)) }}
{% endmacro %}
