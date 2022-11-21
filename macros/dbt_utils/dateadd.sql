{% macro materialize__dateadd(datepart, interval, from_date_or_timestamp) %}
    {{ exceptions.warn(
        """
        The dateadd macro has been moved to dbt Core; use the macro directly.
        dbt_utils.dateadd is deprecated and will be removed in a future release
        of materialize-dbt-utils.
        """
    )}}

    {{ return(adapter.dispatch('dateadd','dbt')(datepart, interval, from_date_or_timestamp)) }}
{% endmacro %}