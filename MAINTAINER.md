# Maintainer instructions

## Cutting a new release

1. Check out the latest `main` branch locally.

2. Create an annotated tag for the new version:

   ```
   git tag -a vX.Y.Z -m vX.Y.Z
   ```

3. Push that tag to GitHub:

   ```
   git push vX.Y.Z
   ```

4. Verify that CI passes on the tag and publishes a GitHub release.

