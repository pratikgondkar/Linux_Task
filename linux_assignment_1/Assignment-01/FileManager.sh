#!/bin/bash

#set -x
action=$1
args1=$2
args2=$3
args3=$4
args4=$5
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
    addFile)
        touch $args1/$args2 && echo $args3 > $args1/$args2
        echo "File $args2 has been created."
        ;;
    addContentToFile)
        echo $args3 >> $args1/$args2
        echo "$args3 has been added to file $args2"
        ;;
    addContentToFileBegining)
        echo $args3 | cat - $args1/$args2 > temp && mv temp $args1/$args2
        echo "$args3 has been added to file $args2"
        ;;
    showFileBeginingContent)
        head -$args3 $args1/$args2
        ;;
    showFileEndContent)
        tail -$args3 $args1/$args2
        ;;
    showFileContentAtLine)
        cat -n $args1/$args2 | grep 10
        ;;
    showFileContentForLineRange)
        head -n $args4 $args1/$args2 | tail -n +$args3
        ;;
    moveFile)
        mv $args1 $args2
        echo "File moved from $args1 to $args2 successfully."
        ;;
    copyFile)
        cp $args1 $args2
        echo "File copied from $args1 to $args2 successfully."
        ;;
    clearFileContent)
        echo -n > $args1/$args2
        echo "File content cleared successfully."
        ;;
    deleteFile)
        rm -rf $args1/$args2
        echo "File deleted successfully."
        ;;
    *)
    echo "Invalid Input"
        ;;
esac