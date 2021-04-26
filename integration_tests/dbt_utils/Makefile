target = materialize

test-materialize:
	dbt deps
	dbt seed --target $(target)
	dbt run --target $(target)
	dbt test --target $(target)
