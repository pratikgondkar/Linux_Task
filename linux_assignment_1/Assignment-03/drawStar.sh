#!/bin/bash
#set -x
size=$1
type=$2
case $type in
    t1)
        for ((i = 1 ; i <=size ; i++)); do  # This loop controls the number of rows in the pattern
            for ((j = 1; j <= size - i; j++)); do # This loop is responsible for printing leading spaces before the asterisks on each line
            echo -n " "
            done
            for ((k = 1; k <= i; k++)); do # This loop prints the asterisks on each line
            echo -n "*"
            done
            echo ""
        done
        ;;
    t2)
        for ((i = 1 ; i <=size ; i++)); do  # This loop controls the number of rows in the pattern
            for ((j = 1; j <= i; j++)); do # This loop prints the asterisks on each line
            echo -n "*"
            done
            echo ""
        done
        ;;
    t3)
        for ((i = 0; i < size; i++)); do
            # Print spaces
            for ((s = 0; s < size - i - 1; s++)); do
              echo -n " "
            done        
            # Print stars
            for ((j = 0; j < 2 * i + 1; j++)); do
              echo -n "*"
            done        
            # Move to the next line
            echo ""
        done
        ;;
    t4)
        for ((i = 1 ; i <=size; i++)); do  # This loop controls the number of rows in the pattern
            for ((j = 1; j <= (size+1) -i; j++)); do # This loop prints the asterisks on each line
            echo -n "*"
            done
            echo ""
        done
        ;;
    t5)
        for ((i = 1 ; i <=size ; i++)); do  # This loop controls the number of rows in the pattern
            for ((j = 1; j <= i; j++)); do # This loop is responsible for printing leading spaces before the asterisks on each line
            echo -n " "
            done
            for ((k = 1; k <= (size+1) -i; k++)); do # This loop prints the asterisks on each line
            echo -n "*"
            done
            echo ""
        done
        ;;
    t6)
        for ((i = 0; i < size; i++)); do
            # Print spaces
            for ((s = 0; s < i; s++)); do
              echo -n " "
            done

            # Print stars
            for ((j = 0; j < 2 * (size - i) - 1; j++)); do
              echo -n "*"
            done

            # Move to the next line
            echo ""
        done
        ;;
    t7)
        for ((i=1; i<=size; i++));
        do
            for ((j=size; j>i; j--));
            do
                    echo -n " "
            done
            for ((k=1; k<=(2*i-1); k++));
            do
                    echo -n "*"
            done
            echo ""
        done
        for ((i=size-1; i>=1; i--));
        do
            for ((j=1; j<=size-i; j++));
            do
                    echo -n " "
            done
            for ((k=1; k<=(2*i-1); k++));
            do
                    echo -n "*"
            done
            echo ""
        done
        ;;
esac
