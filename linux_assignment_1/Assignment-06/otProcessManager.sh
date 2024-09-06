#!/bin/bash
#set -x

action=$1
value1=$2
value2=$3

case $action in
    topProcess)
        case $value2 in
            memory)
                ps aux --sort=-%mem | cut -c1-100 | head -n "$value1" 
                ;;
            cpu)
                ps aux --sort=-%cpu | cut -c1-100 | head -n "$value1" 
                ;;
            *)
                echo "Invalid Input"
        esac
        ;;
    killLeastPriorityProcess)
        LeastPriorityProcess=$(ps -eo pid --sort=-priority | tail -1)
        kill $(LeastPriorityProcess)   
        ;;
    RunningDurationProcess)
        ps -p $value1 -o etime
        ;;

    listOrphanProcess)
        ps -eo ppid,pid,cmd | awk '$1 == 1 {print $0}'
        ;;
    listZoombieProcess)
        ps aux | awk '$8=="Z" {print $0}'
        ;;
    killProcess)
        kill $value1
        echo "Process $value1 is killed."
        ;;
    ListWaitingProcess)
        ps aux | awk '$8=="D" {print $0}'
        ;;
    *)
        echo "Invalid Input"
esac


