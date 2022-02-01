{% macro materialize__last_day(date, date_part) %}
    {{ return(dbt_utils.postgres__last_day(date, date_part)) }}
{% endmacro %}
