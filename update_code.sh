#!/bin/zsh

if [ -n "$1" ]
then
    echo "switch to branch: $1"
    git fetch
    git switch $1
    if [ $? -eq 0 ]
    then
        echo "switch to branch $1 success"
    else
        echo "switch to branch $1 failed"
        exit 1
    fi
fi

git pull
