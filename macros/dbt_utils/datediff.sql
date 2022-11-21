{% macro materialize__datediff(first_date, second_date, datepart) %}

    {{ exceptions.warn(
        """
        The datediff macro has been moved to dbt Core; use the macro directly.
        dbt_utils.datediff is deprecated and will be removed in a future release
        of materialize-dbt-utils.
        """
    )}}

    {{ return(adapter.dispatch('datediff','dbt')(first_date, second_date, datepart)) }}
{% endmacro %}