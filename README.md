<p align="left">
  <img src="img/liquibase.png" alt="Liquibase Logo" title="Liquibase Logo" width="324" height="72">
</p>

This repository contains a Liquibase and MongoDB demo. It is based off our standard demo, minus pre-validate & drift detection. Liquibase licenses MongoDB by database.

The demo uses Docker and organizational runner resources.

# Pre-Demo Steps
1. Pull the repo to ensure you have all available updated files<br>
     ```
     git pull
     ```
2. Ensure your Atlas or local MongoDB docker based container is running

# Required GitHub Variables
After forking this repository, set the following GitHub Actions secrets.
|Variable |Description|
|----------|------------|
| LIQUIBASE_DEV_URL | The JDBC URL of the 
| LIQUIBASE_DEV_USER | The database user (e.g., liquibasesas) from Bitwarden
| LIQUIBASE_DEV_PASSWORD | The database password from Bitwarder
| LIQUIBASE_LICENSE | A valid Liquibase license key.
| LIQUIBASE_GITHUB_TOKEN | A GitHub token used to access the respository.

# Demo Steps
1. **Policy Checks**
    1. Changeset 7 in the [changelog file](Changesets/changelog.ddl.xml) contains a DELETE without a WHERE clause.
    1. Running "Liquibase Workflow" executes the flow. Be sure "Policy Checks" is set to "T" in the dropdown.
    1. Once the job fails, remove changeset 7 from the changelog and check it back into GitHub (CLI or Editor).<br>
    ```
       git pull
       git commit -am "Remove DELETE"
       git push
    ```
1. **Flows**
    1. Run "Liquibase Workflow". 8 changes should be applied.
    1. The [flow file](liquibase.flowfile.yaml) works similar to the demo environment (i.e., Validate, Checks Show, Checks Run, etc.).
    1. Update and Drift reports are enabled by default.
    1. To show the reports, pull the repo.

1. **Targeted Rollback**
    1. Run "Liquibase Targeted Rollback".
    1. The default values will rollback changeset 6.
    1. The history command is run once before the rollback and once after.

# Reset
Execute the following steps to ready the environment for the next demo.
1. Run Liquibase Reset
1. Pull the repo
```
git pull
```
3. Add changeset 7 back to [changelog file](Changesets/changelog.ddl.xml) and update the repository
```
<changeSet id="7" author="jlewis" labels="release-1.2.0">
    <sql>DELETE FROM ORGANIZATIONS</sql>
</changeSet>
```

```
git commit -am "Reset files"
git push
```
4. Pause the Redshift cluster.

## Contact Liquibase
* Liquibase sales: https://www.liquibase.com/contact
* Liquibase support: https://support.liquibase.com
