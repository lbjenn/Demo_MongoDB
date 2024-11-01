#!/bin/zsh
option=$1

if [[ $option == 1 ]]
then
    # initial check in of QC fixed scripts into local branch
    git push --set-upstream origin local
    git add *.js
    git add demo/*
    git commit -m "Check in for devdb run"
    git push 
fi


if [[ $option == 2 ]]
then
    # check in fixed The Queen major to pass validator

    git add demo/4insert-student-theQueen-wrb.js
    git commit -m "Corrected the value of the major for The Queen document"
    git push 
fi

