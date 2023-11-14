# materialize-dbt-utils

This [dbt](https://github.com/dtb-labs/dbt) package provides shims for using the
following packages with [Materialize]:

- [dbt-utils](https://github.com/dbt-labs/dbt-utils)
- [dbt-audit-helper](https://github.com/dbt-labs/dbt-audit-helper)

## Getting started with dbt + Materialize

- [What is dbt?](https://docs.getdbt.com/docs/introduction)
- [Installation](https://github.com/MaterializeInc/dbt-materialize)
- Join [dbt's Slack](http://slack.getdbt.com/)
- Join [Materialize's Slack](https://materialize.com/)

## Installation

Requirements:
- [dbt-materialize](https://pypi.org/project/dbt-materialize/) v1.3.0+
- [Materialize](https://materialize.com/docs/install/) v0.43.0+

Install this package by adding the following to the `packages.yml` file in your
root dbt project:

```
packages:
  - package: dbt-labs/dbt_utils
    version: 0.9.5
  - package: MaterializeInc/materialize_dbt_utils
    version: 0.7.0
```

Then set a `dispatch` config in your `dbt_project.yml`:

```yml
dispatch:
  - macro_namespace: dbt_utils
    search_order: [materialize_dbt_utils, dbt_utils]
  - macro_namespace: audit_helper
    search_order: [materialize_dbt_utils, audit_helper]
```

With this project setting, dbt will first search for macro implementations in
the `materialize_dbt_utils` packages when resolving macros from the `dbt_utils`
namespace:

[Read the docs](https://docs.getdbt.com/docs/package-management)
for more information on installing packages.

## Compatibility

The following sections document the support for each shimmed package.

### [`dbt-utils` schema tests]

Name                               | Supported?         | Notes
-----------------------------------|--------------------|----------------------------------------------------------------------------
[`equal_rowcount`]                 | :white_check_mark: |
[`fewer_rows_than`]                | :white_check_mark: |
[`equality`]                       | :white_check_mark: |
[`expression_is_true`]             | :white_check_mark: |
[`recency`]                        | :white_check_mark: |
[`at_least_one`]                   | :white_check_mark: |
[`not_constant`]                   | :white_check_mark: |
[`cardinality_equality`]           | :white_check_mark: |
[`unique_where`]                   | :white_check_mark: |
[`not_null_where`]                 | :white_check_mark: |
[`not_null_proportion`]            | :white_check_mark: |
[`not_accepted_values`]            | :white_check_mark: |
[`relationships_where`]            | :white_check_mark: |
[`sequential_values`]              | :white_check_mark: |
[`mutually_exclusive_ranges`]      | :white_check_mark: |
[`unique_combination_of_columns`]  | :white_check_mark: |
[`accepted_range`]                 | :white_check_mark: |

### [`dbt-utils` macros]

#### [Introspective macros]

Name                          | Supported?         | Notes
------------------------------|--------------------|------
[`get_column_values`]         | :white_check_mark: |
[`get_relations_by_pattern`]  | :white_check_mark: |
[`get_relations_by_prefix`]   | :white_check_mark: |
[`get_query_results_as_dict`] | :white_check_mark: |

#### [SQL generators]

Name                   | Supported?         | Notes
-----------------------|--------------------|-------
[`date_spine`]         | :white_check_mark: | Migrated to dbt Core
[`haversine_distance`] | :white_check_mark: |
[`group_by`]           | :white_check_mark: |
[`star`]               | :white_check_mark: |
[`union_relations`]    | :white_check_mark: |
[`generate_series`]    | :white_check_mark: |
[`surrogate_key`]      | :white_check_mark: |
[`safe_add`]           | :white_check_mark: |
[`pivot`]              | :white_check_mark: |
[`unpivot`]            | :white_check_mark: |

#### [Web macros]

Name                  | Supported?         | Notes
----------------------|--------------------|------
[`get_url_parameter`] | :white_check_mark: |
[`get_url_host`]      | :white_check_mark: |
[`get_url_path`]      | :white_check_mark: |

#### [Cross-database macros]

Name                  | Supported?         | Notes
----------------------|--------------------|------
[`bool_or`]           | :white_check_mark: | Migrated to dbt Core
[`current_timestamp`] | :white_check_mark: | Migrated to dbt Core
[`dateadd`]           | :white_check_mark: | Migrated to dbt Core
[`datediff`]          | :white_check_mark: | Migrated to dbt Core
[`split_part`]        | :white_check_mark: | Migrated to dbt Core
[`date_trunc`]        | :white_check_mark: | Migrated to dbt Core
[`last_day`]          | :white_check_mark: | Migrated to dbt Core
[`width_bucket`]      | :white_check_mark: |

#### [Jinja helpers]

Name                  | Supported?         | Notes
----------------------|--------------------|------
[`pretty_time`]       | :white_check_mark: |
[`pretty_log_format`] | :white_check_mark: |
[`log_info`]          | :white_check_mark: |
[`slugify`]           | :white_check_mark: |

### [`dbt-utils` materializations]

Name                 | Supported?         | Notes
---------------------|--------------------|------
[`insert_by_period`] | :x:                | Materialize natively provides incremental view maintenance.

### [`dbt-audit-helper` macros]

Name                          | Supported?         | Notes
------------------------------|--------------------|------
[`compare_relations`]         | :white_check_mark: |
[`compare_queries`]           | :white_check_mark: |
[`compare_column_values`]     | :white_check_mark: |
[`compare_relation_columns`]  | :white_check_mark: |

[`accepted_range`]: https://github.com/dbt-labs/dbt-utils#accepted_range-source
[`at_least_one`]: https://github.com/dbt-labs/dbt-utils#at_least_one-source
[`bool_or`]: https://docs.getdbt.com/reference/dbt-jinja-functions/cross-database-macros#bool_or
[`cardinality_equality`]: https://github.com/dbt-labs/dbt-utils#cardinality_equality-source
[`compare_column_values`]: https://github.com/dbt-labs/dbt-audit-helper#compare_column_values-source
[`compare_queries`]: https://github.com/dbt-labs/dbt-audit-helper#compare_queries-source
[`compare_relation_columns`]: https://github.com/dbt-labs/dbt-audit-helper#compare_relation_columns-source
[`compare_relations`]: https://github.com/dbt-labs/dbt-audit-helper#compare_relations-source
[`current_timestamp`]: https://github.com/dbt-labs/dbt-utils#current_timestamp-source
[`date_spine`]: https://github.com/dbt-labs/dbt-utils#date_spine-source
[`date_trunc`]: https://docs.getdbt.com/reference/dbt-jinja-functions/cross-database-macros#date_trunc
[`dateadd`]: https://docs.getdbt.com/reference/dbt-jinja-functions/cross-database-macros#dateadd
[`datediff`]: https://docs.getdbt.com/reference/dbt-jinja-functions/cross-database-macros#datediff
[`dbt-audit-helper` macros]: https://github.com/dbt-labs/dbt-audit-helper#macros
[`dbt-utils` macros]: https://github.com/dbt-labs/dbt-utils#macros
[`dbt-utils` materializations]: https://github.com/dbt-labs/dbt-utils#materializations
[`dbt-utils` schema tests]: https://github.com/dbt-labs/dbt-utils#schema-tests
[`equal_rowcount`]: https://github.com/dbt-labs/dbt-utils#equal_rowcount-source
[`equality`]: https://github.com/dbt-labs/dbt-utils#equality-source
[`expression_is_true`]: https://github.com/dbt-labs/dbt-utils#expression_is_true-source
[`fewer_rows_than`]: https://github.com/dbt-labs/dbt-utils#fewer_rows_than-source
[`generate_series`]: https://github.com/dbt-labs/dbt-utils#generate_series-source
[`get_column_values`]: https://github.com/dbt-labs/dbt-utils#get_column_values-source
[`get_query_results_as_dict`]: https://github.com/dbt-labs/dbt-utils#get_query_results_as_dict-source
[`get_relations_by_pattern`]: https://github.com/dbt-labs/dbt-utils#get_relations_by_pattern-source
[`get_relations_by_prefix`]: https://github.com/dbt-labs/dbt-utils#get_relations_by_prefix-source
[`get_url_host`]: https://github.com/dbt-labs/dbt-utils#get_url_host-source
[`get_url_parameter`]: https://github.com/dbt-labs/dbt-utils#get_url_parameter-source
[`get_url_path`]: https://github.com/dbt-labs/dbt-utils#get_url_path-source
[`group_by`]: https://github.com/dbt-labs/dbt-utils#group_by-source
[`haversine_distance`]: https://github.com/dbt-labs/dbt-utils#haversine_distance-source
[`insert_by_period`]: https://github.com/dbt-labs/dbt-utils#insert_by_period-source
[`last_day`]: https://docs.getdbt.com/reference/dbt-jinja-functions/cross-database-macros#last_day
[`log_info`]: https://github.com/dbt-labs/dbt-utils#log_info-source
[`mutually_exclusive_ranges`]: https://github.com/dbt-labs/dbt-utils#mutually_exclusive_ranges-source
[`not_accepted_values`]: https://github.com/dbt-labs/dbt-utils#not_accepted_values-source
[`not_constant`]: https://github.com/dbt-labs/dbt-utils#not_constant-source
[`not_null_proportion`]: https://github.com/dbt-labs/dbt-utils#not_null_proportion-source
[`not_null_where`]: https://github.com/dbt-labs/dbt-utils#not_null_where-source
[`pivot`]: https://github.com/dbt-labs/dbt-utils#pivot-source
[`pretty_log_format`]: https://github.com/dbt-labs/dbt-utils#pretty_log_format-source
[`pretty_time`]: https://github.com/dbt-labs/dbt-utils#pretty_time-source
[`recency`]: https://github.com/dbt-labs/dbt-utils#recency-source
[`relationships_where`]: https://github.com/dbt-labs/dbt-utils#relationships_where-source
[`safe_add`]: https://github.com/dbt-labs/dbt-utils#safe_add-source
[`sequential_values`]: https://github.com/dbt-labs/dbt-utils#sequential_values-source
[`slugify`]: https://github.com/dbt-labs/dbt-utils#slugify-source
[`split_part`]: https://docs.getdbt.com/reference/dbt-jinja-functions/cross-database-macros#split_part
[`star`]: https://github.com/dbt-labs/dbt-utils#star-source
[`surrogate_key`]: https://github.com/dbt-labs/dbt-utils#surrogate_key-source
[`union_relations`]: https://github.com/dbt-labs/dbt-utils#union_relations-source
[`unique_where`]: https://github.com/dbt-labs/dbt-utils#unique_where-source
[`unique_combination_of_columns`]: https://github.com/dbt-labs/dbt-utils#unique_combination_of_columns-source
[`unpivot`]: https://github.com/dbt-labs/dbt-utils#unpivot-source
[`width_bucket`]: https://github.com/dbt-labs/dbt-utils#width_bucket-source
[Cross-database macros]: https://docs.getdbt.com/reference/dbt-jinja-functions/cross-database-macros
[Introspective macros]: https://github.com/dbt-labs/dbt-utils#introspective-macros
[Jinja helpers]: https://github.com/dbt-labs/dbt-utils#jinja-helpers
[Materialize]: https://github.com/MaterializeInc/materialize
[SQL generators]: https://github.com/dbt-labs/dbt-utils#sql-generators
[Web macros]: https://github.com/dbt-labs/dbt-utils#web-macros
