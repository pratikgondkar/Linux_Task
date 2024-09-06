#!/bin/bash

set -x

action=$1
args1=$2
args2=$3
args3=$4
case $action in
    addLineTop)
        echo "$args2" | cat - "$args1" >temp && mv temp "$args1"
        echo "Line added at top successfully."
        ;;
    addLineBottom)
        echo "$args2" >> $args1
        echo "Line added to the bottom successfully."
        ;;
    addLineAt)
        sed -i "${args2}i\\$args3" "$args1"
        echo "$args3 added at line $args2."
        ;;
    updateFirstWord)
        sed -i "0,/\<$args2\>/{s/\<$args2\>/$args3/}" $args1
        echo "Replace $args2 with $args3 successfully."
        ;;
    updateAllWords)
        sed -i 's/'$args2'/'$args3'/g' $args1
        echo "Replace all $args2 words with $args3 successfully."
        ;;
    deleteFirstWord)
        sed -i "0,/$args2/s/$args2//" "$args1"
        echo "Deleted first occurance of $args2 word."
        ;;
    deleteAllWords)
        sed -i "s/$args2//g" "$args1"
        echo "Deleted all occurance of $args2 word."
        ;;
    insertWord)
        sed -i "s/$args2/$args2 $args3/" "$args1"
        echo "Word $args3 inserted beside $args2 successfully."
        ;;  
    deleteLine)
        if [ -z "$args3" ]; then
        sed -i "$args2 d" "$args1"
        echo "Line $args2 deleted successfully."
        else
        sed -i "$args2 {/\<$args3\>/d}" "$args1"
        echo "Word "$args3 conatining line $args2 deleted successfully.""
        fi
        ;;
    *)
        echo "Invalid input"
        exit 1
        ;;
esac
