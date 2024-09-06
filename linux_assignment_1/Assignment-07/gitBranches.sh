#!/bin/bash

#set -x

function listBranches {
    git branch
}

function createBranch {
    branchName=$1
    git branch "$branchName"
    echo "Branch created: $branchName"
}

function deleteBranch {
    branchName=$1
    git branch -d "$branchName"
    echo "Branch deleted: $branchName"
}

function mergeBranches {
    branchName1=$1
    branchName2=$2
    git checkout "$branchName2"
    git merge "$branchName1"
    echo "Merged $branchName1 into $branchName2"
}

function rebaseBranches {
    branchName1=$1
    branchName2=$2
    git checkout "$branchName1"
    git rebase "$branchName2"
    echo "Rebased $branchName1 onto $branchName2"
}

# Main script

while getopts ":lb:d:m:r:1:2:" opt; do
    case $opt in
        l)
            listBranches
            ;;
        b)
            createBranch "$OPTARG"
            ;;
        d)
            deleteBranch "$OPTARG"
            ;;
        m)
            mergeBranches "$OPTARG" "$OPTARG"
            ;;
        r)
            rebaseBranches "$OPTARG" "$OPTARG"
            ;;
        1)
            branchName1=$OPTARG
            ;;
        2)
            branchName2=$OPTARG
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

if [ -n "$branchName1" ] && [ -n "$branchName2" ]; then
    mergeBranches "$branchName1" "$branchName2"
fi
