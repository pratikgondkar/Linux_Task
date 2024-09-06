#!/bin/bash

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
}

add_ssh_connection() {
    local name host username port pemfile

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
                echo "Invalid option: -$OPTARG"
                error_logging
                exit 1
                ;;
            :)
                echo "Option -$OPTARG requires an argument."
                error_logging
                exit 1
                ;;
        esac
    done

    if [ -z "$name" ] || [ -z "$host" ] || [ -z "$username" ]; then
        echo "Missing required parameters."
        error_logging
        exit 1
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
    error_logging
else
    echo "Invalid option. Use -h for help."
    exit 1
fi

