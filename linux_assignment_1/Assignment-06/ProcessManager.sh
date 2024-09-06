#!/bin/bash


while getopts ":o:s:a:p:" opt; do
    case $opt in
        o)
            operation=$OPTARG
            ;;
        s)
            servicePath=$OPTARG
            ;;
        a)
            alias=$OPTARG
            ;;
        p)
            priority=$OPTARG
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done



case $operation in
    register)

        ;;
    start)

        ;;
    status)
        ;;
    kill)
        ;;
    priority)
        ;;
    list)
        ;;
    *)
        echo "Invalid operation. Use -o option to specify operation."
        exit 1
        ;;
esac

