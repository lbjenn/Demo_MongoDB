#!/bin/zsh
option=$1

if [[ $option == 1 ]]
then
    # initial check in of QC fixed scripts into local branch
    git push --set-upstream origin local
    git add Changelogs/*.js
    git add demo/Changelogs/*
    git commit -m "Check in for devdb run"
    git push 
fi


if [[ $option == 2 ]]
then
    # check in fixed The Queen major to pass validator

    git add demo/Changelogs/4insert-student-theQueen-wrb.js
    git commit -m "Corrected the value of the major for The Queen document"
    git push 
fi

