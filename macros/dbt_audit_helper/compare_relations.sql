{% macro materialize__compare_relations(a_relation, b_relation, exclude_columns=[], primary_key=None) %}

{%- set a_columns = adapter.get_columns_in_relation(a_relation) -%}

{% set check_columns=audit_helper.pop_columns(a_columns, exclude_columns) %}

{% set check_cols_csv = check_columns | map(attribute='quoted') | join(', ') %}

{% set a_query %}
select
    {{ check_cols_csv }}

from {{ a_relation }}
{% endset %}

{% set b_query %}
select
    {{ check_cols_csv }}

from {{ b_relation }}
{% endset %}

{{ dbt_materialize_utils.materialize__compare_queries(a_query, b_query, primary_key) }}

{% endmacro %}
