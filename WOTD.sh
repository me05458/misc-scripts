#!/bin/bash
wordpath="WOTDfile"
answerpath="answers"
configpath="config"
wordnum=$(sed -n '1p' "$configpath")

i=2

while [ "$i" != 0 ]
do

    num=$((1 + $RANDOM % $wordnum))
    word=$(head -"$num" "$wordpath" | tail -1)
    answer=$(head -"$num" "$answerpath" | tail -1)
    echo "$answer"
    read input
    if [ "$input" == "$word" ]
    then
        echo "Correct!"
        i=1
    elif [ "$input" == "quit" ]
    then
        i=0

    elif [ "$input" == "q" ]
    then
        i=0

    else
        echo "Incorrect!"
        echo "Correct answer is "$word""
        i=1
    fi
done
