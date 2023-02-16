-- The upstream test_recency has PostgreSQL-specific logic that doesn't
-- get picked up because it conditions on `target == "postgres"`. So we just
-- hardcode that PostgreSQL-specific logic here.

select
    {{ dbt.date_trunc('day', dbt.current_timestamp()) }} as today
