# mongodemo

This repo contains assets to support running Liquibase Pro with a jarvis created docker instance of mongodb or using a shared MongoDB atlas free tier cluster. To use the Atlas cluster for the DB targets please contact the Sales Solution Architecture team to gain access to the necessary credentials.
The demo app itself is an Alice in Wonderland themed story. It assumes the demo workflow to be executing locally on command line to a 'devdb' on your MOngoDB cluster before then using the GH Actions workflows to work with a 'testdb' database on the same cluster after checking in some changelogs/changesets that have been applied to the devdb database.

The liquibase.checks-settings.conf file includes 3 regex based custom LB quality checks - mongoCrCollectionValidatorChk, mongoCrIndexNameStdChk, mongoCreateIdxWarning. All 3 of these and RollbackRequired are utilized as part of the demo script.

Pre-requisites:
1. MongoDB target cluster up and running
2. Access to Mongo DB Compass utility app
3. Connectivity from Compass to MongoDB cluster

