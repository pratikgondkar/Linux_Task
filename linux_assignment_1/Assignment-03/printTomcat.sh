#!/bin/bash
set -x

num=$1

if [ $((num % 15)) -eq 0 ]; then
    echo "tomcat"
elif [ $((num % 3)) -eq 0 ]; then
    echo "tom"
elif [ $((num % 5)) -eq 0 ]; then
    echo "cat"
else
    echo "$num is not divisible by 3, 5 and 15."
fi