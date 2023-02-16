# materialize-dbt-utils Changelog

## Unreleased

* Bump the minimum supported version of Materialize to v0.43.0.

* Support and test the `bool_or` macro.

* Support the `summarize` parameter in the `compare_queries` and
  `compare_relations` macros introduced in `dbt-audit-helper` [v0.6.0](https://github.com/dbt-labs/dbt-audit-helper/releases/tag/0.6.0).

## 0.6.0 - 2022-11-23

* Bump the minimum supported version of `dbt-materialize` to v1.3.0.

* Deprecate the `dateadd`, `datediff`, `last_day` macros. These macros have been
  moved into dbt Core in [dbt-core #5298](https://github.com/dbt-labs/dbt-core/pull/5298),
  and will be removed in a subsequent release.

## 0.5.0 - 2022-06-24

* Bump the minimum supported version of Materialize to v0.26.3.

* Support and test the `sequential_values` and `mutually_exclusive_ranges`
  macros.

## 0.4.0 - 2022-05-05

* Shim `dbt-audit-helper` ([v0.5.0](https://github.com/dbt-labs/dbt-audit-helper/releases/tag/0.5.0)) macros for
  compatibility.

## 0.3.0 - 2022-03-03

* Bump the minimum supported version of dbt-materialize to v1.0.3.

* Bump the minimum supported version of Materialize to v0.22.0+.

* Support and test the `recency` and `current_timestamp` macros.

* Correctly mark the `insert_by_period` macro as unsupported.

## 0.2.0 - 2022-02-14

* Fix the `last_day` macro.

* Update documentation to reflect newly supported macros when using
  dbt-materialize v1.0.0.post2+ and Materialize v0.20.0+.

## 0.1.0 - 2021-01-31

* Initial release.
