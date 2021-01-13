# materialize-dbt-utils

This [dbt](https://github.com/fishtown-analytics/dbt) package contains macros
that:
- can be (re)used across dbt projects running on Materialize
- define Materialize-specific implementations of [dispatched macros](https://docs.getdbt.com/reference/dbt-jinja-functions/adapter/#dispatch) from other packages

## Installation Instructions

Check [dbt Hub](https://hub.getdbt.com) for the latest installation
instructions, or [read the docs](https://docs.getdbt.com/docs/package-management)
for more information on installing packages.

----

## Compatibility

This package will provide shims for various [`dbt_utils`](https://github.com/fishtown-analytics/dbt-utils)
functions.

----

### Testing

To run the integration tests, do the following:
1. Git clone this repository
1. Add the following profile to your list of dbt profiles (run `dbt debug` to locate
   your local profiles):
   ```nofmt
   integration_tests:
     outputs:
       dev:
         type: materialize
         threads: 1
         host: localhost
         port: 6875
         user: user
         password: password
         dbname: materialize
         schema: public
     target: dev
   ```
1. In your terminal, navigate to the `integration_tests/dbt_utils` subdirectory:
    ```nofmt
   cd integration_tests/dbt_utils
   ```
1. Run the tests:
    ```nofmt
   make test-materialize
   ```

----

### Contributing

We welcome contributions to this repo! To contribute a new feature or a fix,
please open a Pull Request with 1) your changes and 2) updated documentation for
the `README.md` file.

----

### Getting started with dbt + Materialize

- [What is dbt](https://docs.getdbt.com/docs/introduction)?
- [Installation](https://github.com/MaterializeInc/dbt-materialize)
- Join [dbt's Slack](http://slack.getdbt.com/)
- Join [Materialize's Slack](https://materialize.com/)
