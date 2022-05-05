# Maintainer instructions

## Bumping dependency versions

To update the tested version of dbt-materialize, bump the version specification
in the `pip install` invocation in [.github/workflows/main.yml].

To update the tested version of `materialized`, bump the version specification
in the `services` specification in [.github/workflows/main.yml]. We explicitly
avoid depending on `latest` so that CI is deterministic.

To update the embedded dbt-utils:

```shell
cd dbt-utils
git checkout vVERSION
git pull
cd ..
# Update dbt-utils version in README.md
# Update compatibility matrix for new macros/schema-tests in README.md.
git commit -am 'Update dbt-utils'
```

## Cutting a new release

1. Check out the latest `main` branch locally.

2. Bump the version number in [dbt_project.yml].

3. Bump the version number in [README.md].

4. Add an entry for the new version to [CHANGELOG.md].

5. Make a PR with the above changes.

6. Merge the PR to `main`.

7. Pull the new commit locally:

   ```
   git checkout main
   git pull
   ```

8. Verify that you're on the version bump commit:

   ```
   git log
   # Make sure most recent commit is your version bump.
   ```

9. Create an annotated tag for the new version:

   ```
   git tag -a vX.Y.Z -m vX.Y.Z
   ```

10. Push that tag to GitHub:

   ```
   git push origin vX.Y.Z
   ```

11. Verify that CI passes on the tag and publishes a GitHub release.

## Testing

To run the suite of integration tests:

1. Add the following profile to your list of dbt profiles (run `dbt debug` to locate
   your local profiles):

   ```yaml
   integration_tests:
        outputs:
          materialize:
            type: materialize
            threads: 1
            host: localhost
            port: 6875
            user: materialize
            password: password
            dbname: materialize
            schema: public
        target: materialize
   ```

1. Clone this repository and navigate to the `integration_tests` subdirectory:

   ```nofmt
   git clone https://github.com/MaterializeInc/materialize-dbt-utils.git

   cd integration_tests
   ```

1. To run the tests for `dbt-utils`:

    ```nofmt
   cd dbt_utils

   make test-materialize
   ```

1. To run the tests for `dbt-audit-helper`:

   ```noftm
   cd dbt_audit_helper

   make test-materialize
   ```

[.github/workflows/main.yml]: .github/workflows/main.yml
[dbt_project.yml]: dbt_project.yml
[CHANGELOG.md]: CHANGELOG.md
