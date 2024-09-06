#!/bin/bash

LOG_FILE=/home/kiran/devops-ninja/logfile.log
CONFIG_FILE=/home/kiran/.ssh/config

error_logging() {
    echo "Usage: otssh.sh -a -n <name> -h <host> -u <username> -p <port> -i <pemfile>"
    echo "Options:"
    echo "  -a        Add SSH connection"
    echo "  -n        Name for the connection"
    echo "  -h        Hostname or IP address"
    echo "  -u        Username"
    echo "  -p        Port (optional, default is 22)"
    echo "  -i        Specify pemfile path"
    echo "  -h        Display this help message"
    echo "Error: $1" >> "$LOG_FILE"
    exit 1
}

# Redirect all subsequent commands' stderr to the log file
exec 2>> "$LOG_FILE"

add_ssh_connection() {
    local name host username port pemfile action

    while getopts ":a:n:h:u:p:" opt; do
        case $opt in
            a)
                action="add"
                ;;
            n)
                name=$OPTARG
                ;;
            h)
                host=$OPTARG
                ;;
            u)
                username=$OPTARG
                ;;
            p)
                port=$OPTARG
                ;;
            i)  
                pemfile=$OPTARG
                ;;
            \?)
                error_logging "Invalid option: -$OPTARG"
                ;;
            :)
                error_logging "Option -$OPTARG requires an argument."
                ;;
        esac
    done

    if [ -z "$name" ] || [ -z "$host" ] || [ -z "$username" ]; then
        error_logging "Missing required parameters."
    fi

    # If port is not provided, use the default (22)
    if [ -z "$port" ]; then
        port=22
    fi

    # Add connection to the text file
    echo "Host $name" >> "$CONFIG_FILE"
    echo "  HostName $host" >> "$CONFIG_FILE"
    echo "  User $username" >> "$CONFIG_FILE"
    echo "  Port $port" >> "$CONFIG_FILE"

    echo "SSH connection '$name' added successfully."
}

# Parse command-line arguments
if [ "$1" == "-a" ]; then
    shift
    add_ssh_connection "$@"
elif [ "$1" == "-h" ]; then
    error_logging "Displaying help message."
else
    error_logging "Invalid option. Use -h for help."
fi
