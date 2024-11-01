#!/bin/zsh

format=$1

if [[ $format = 'JSON' ]]
then
    # add validator to create collection javascript file
    cp scripts/create-collection-students-wv.js Changelogs/create-collection-students.js

    #add rollback to the DML caterpillar changeset in demo directory
    cp scripts/3insert-student-caterpillar-wrb.json Changelogs/demo/3insert-student-caterpillar.json

    #fix naming of index in create-idxname-students.js
    sed -i '' 's/ID-/IDX-/g' create-idxname-students.js
fi

if [[ $format = 'fm' ]]
then
   # add validator to create collection changesset & correct name of index
    cp formatted/changelog-release1-0-fixed.js Changelogs/changelog-release1-0.js

    #add rollback to the DML caterpillar changeset in demo directory
    cp scripts/3insert-student-caterpillar-wrb.js Changelogs/demo/3insert-student-caterpillar.js
fi

   

