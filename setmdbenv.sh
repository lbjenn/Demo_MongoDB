#!/bin/zsh 
dbname=$2
env=$1

if [[ -z $env ]] || [[ -z $dbname ]]
then 
   echo "Missing required run earameters: "
   echo "setmdbenv.sh <atlas | jarvis | uberdemo> <target db name>" 
   exit
fi

## check if db environment for runs is atlas or jarvis-docker based
if [[ $env == 'atlas' ]]
then
  if [[ $dbname == 'devdb' ]] 
  then
    ## setup local run environment for atlas devdb
    ##
    cp atlas/liquibase.mongosh.conf.atlas liquibase.mongosh.conf
    cp atlas/liquibase.properties.atlas.devdb liquibase.properties

    ## clear out mongo logs from prior run
    rm mongologs/*
  
    ## switch to local branch for demo steps run
    git branch local
    git checkout local
  
    liquibase status 

    echo "######################################################"
    echo "ATLAS DEMO connect URL:"
    grep 'url:' liquibase.properties
    echo "######################################################"

  else
    echo 'setting up atlas testdb env'
    ## setup local run environment for atlas devdb
    ##
    sed 's/devdb/testdb/g' atlas/liquibase.properties.atlas.devdb > liquibase.properties
    sed 's/devdb/testdb/g' atlas/liquibase.mongosh.conf.atlas > liquibase.mongosh.conf

    ## add in new script that will fail when GH actions run_mongo_changes is run as it violates the validator on the studenet collection
    cp scripts/4*.js demo
    liquibase status 

    ## push new script to git repo to be available to gh actions workflow
    git add .
    git commit -m "check in Release 1.1 Students collection for AliceBI"
    git push --set-upstream origin local
    git pull

    echo "######################################################"
    echo "ATLAS DEMO connect URL:"
    grep 'url:' liquibase.properties
    echo "######################################################"

  fi
else
  if [[ $env == 'jarvis' ]]
  then
    if [[ $dbname == 'devdb' ]] 
    then
      ## setup local run environment for atlas devdb
      ##
      cp gha-jarvis/liquibase.mongosh.conf.jarvis.devdb liquibase.mongosh.conf
      cp gha-jarvis/liquibase.properties.jarvis.devdb liquibase.properties

      ## clear out mongo logs from prior run
      rm mongologs/*
  
      ## switch to local branch for demo steps run
      git branch local
      git checkout local
  
      liquibase status 

      echo "######################################################"
      echo "DOCKER DEMO connect URL:"
      grep 'url:' liquibase.properties
      echo "######################################################"

    else

      ## setup local run environment for atlas devdb
      ##
      sed 's/devdb/testdb/g' gha-jarvis/liquibase.properties.jarvis.devdb > liquibase.properties
      sed 's/devdb/testdb/g' gha-jarvis/liquibase.mongosh.conf.jarvis.devdb > liquibase.mongosh.conf
      

      ## add in new script that will fail when GH actions run_mongo_changes is run as it violates the validator on the studenet collection
      cp scripts/4*.js demo
      liquibase status 

      echo "######################################################"
      echo "DOCKER DEMO connect URL:"
      grep 'url:' liquibase.properties
      echo "######################################################"


      ## push new script to git repo to be available to gh actions workflow
      git add .
      git commit -m "check in Release 1.1 Students collection for AliceBI"
      git push --set-upstream origin local
      git pull

    fi
  fi  
fi  
