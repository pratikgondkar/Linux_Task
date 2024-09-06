#! /bin/bash
#set -x

function killLeastPriorityProcess(){
                nice=`ps -elf --sort=-nice | awk 'BEGIN { ORS=" " };{{print $8}}'`
                read -ra x <<< $nice
                read y <<< ${x[1]} 

                echo "$y is your nice value "
                PID=`ps -elf | awk '{ if($8=='$y') print $5}'`

                echo "your number is $PID"
                pkill -f $PID
                echo "We just killed your process $PID "
}

function topProcess(){
                n=$1
                sum=$(expr $n + 1)
                action=$2
                if 
                    [ "${action}" = "memory" ]
                then
                    ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -${sum}
                elif
                    [ "${action}" = "cpu" ]
                then
                    ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -${sum}
                fi 
}


function RunningDurationProcess(){
                pid_or_processname=$1
                re='^[0-9]+$'
                if [[ "$pid_or_processname" =~ $re ]]
                    then 
                        ps -p $pid_or_processname -o etimes
                    else
                        ps -eo cmd,etime | grep -i $pid_or_processname
                fi
}

function listOrphanProcess(){
                ps -elf | head -1; ps -elf | awk '{if ($5 == 1) {print $0}}'
}

function listZoombieProcess(){
                ps -elf | awk '{ if( $2 == "Z" ) {print $0}}'
}

function killProcess(){
                  pid_or_processname=$1
                 re='^[0-9]+$'
                if [[ "$pid_or_processname" =~ $re ]]
                    then 
                        kill -9 $pid_or_processname
                        echo "Process terminated successfully"
                    else
                        pkill -f $pid_or_processname
                        echo "Process terminated successfully"
                fi
}

function ListWaitingProcess(){
                ps -elf | awk '{ if( $2 == "S" ) {print $0}}'
} 

ACTION=$1
            
case $ACTION in
    topProcess)
                topProcess $2 $3
                ;;
    killLeastPriorityProcess)
                killLeastPriorityProcess
                ;;
    RunningDurationProcess)
                RunningDurationProcess $2
                 ;;
    listOrphanProcess)
                listOrphanProcess
                ;;
    listZoombieProcess)
                listZoombieProcess
                ;;
    killProcess)
                killProcess $2
                ;;
    ListWaitingProcess)
                ListWaitingProcess
                ;;
esac