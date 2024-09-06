#!/bin/bash

# set -x
action=$1
args1=$2
args2=$3
case $action in
    addDir)
        mkdir $args1/$args2
        echo "Directory $args2 has been created."
        ;;
    listFiles)
        ls -l $args1/ | grep ^-
        ;;
    listDirs)
        ls -l $args1/ | grep ^d
        ;;
    listAll)
        ls -l $args1
        ;;
    deleteDir)
        rm -rf $args1/$args2
        echo "Directory $args2 has been removed."
        ;;
    *)
        echo "Invalid Input"
        ;;
esac