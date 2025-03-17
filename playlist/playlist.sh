#!/bin/bash
datapath="data"
helperpath="helper"
inputer=""
if [ "$1" == "-s" -o "$1" == "-set" ]
then
    if [ "$2" == "" ]
        then
            echo "Please specify subset!"
        else
            cat "$datapath" | grep "$2" > "$helperpath"
            shuf -n 1 "$helperpath"
        fi
elif [ "$1" == "-h" -o "$1" == "-help" -o "$1" == "--help" ]
then
    echo "Arguments:"
    echo "-h, --help, -help - this output"
    echo "-s <ARGUMENT>, -set <ARGUMENT> - shuffles a subset with <ARGUMENT>"
elif [ "$1" == "-a" -o "$1" == "-add" ]
then
    if [ "$2" == "" ]
        then
            echo "Please specify entry to add!"
    else
    thing=$(cat "$datapath" | grep "$2")
        if [ "$thing" != "" ]
        then
            echo "WARNING! Such entry already exists in file! Add anyway? (y/n)"
            read inputer
        else
            inputer="y"
        fi
        if [ "$inputer" == "y" ]
        then
            echo "$2" >> "$datapath"
        else
        fi
    fi
else
    shuf -n 1 "$datapath"
fi
