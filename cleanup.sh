#!/bin/zsh

env=$1
if [[ -z $env ]] 
then
   echo "Missing required run parameters of environment to clean up: "
   echo "cleanup.sh <atlas | jarvis> "
   exit
fi

git push origin --delete local
git checkout main
#git branch -D local
rm liquibase.properties
rm liquibase.mongosh.conf
rm *.html
rm mongologs/*

if [[ $env == 'atlas' ]]
then
   echo "Removing contents of devdb and testdb from $env"
   mongosh "mongodb+srv://liquibasesas.lklxih6.mongodb.net/" --apiVersion 1 --username liquibasesas --password logmein < cleanupmdb.js
else
   if [[ $env == 'jarvis' ]]
   then
      echo "Removing contents of devdb and testdb from $env"
#     using jarvis instance credentials below
      mongosh "mongodb://SpiderMan3:Sillys911@localhost:7542/local" --authenticationDatabase admin < cleanupmdb.js
   fi
fi
