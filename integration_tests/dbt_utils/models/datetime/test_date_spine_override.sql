-- The upstream test_date_spine has PostgreSQL-specific logic that doesn't
-- get picked up because it conditions on `target == "postgres"`. So we just
-- hardcode that PostgreSQL-specific logic here.

with date_spine as (

    {{ dbt_utils.date_spine("day", "'2018-01-01'::date", "'2018-01-10'::date") }}

)

select date_day::date
from date_spine
