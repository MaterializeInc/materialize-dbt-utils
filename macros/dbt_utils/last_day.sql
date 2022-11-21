{% macro materialize__last_day(date, date_part) %}

    {{ exceptions.warn(
        """
        The last_day macro has been moved to dbt Core; use the macro directly.
        dbt_utils.last_day is deprecated and will be removed in a future release
        of materialize-dbt-utils.
        """
    )}}

    {{ return(adapter.dispatch('last_day','dbt')(date, date_part)) }}
{% endmacro %}