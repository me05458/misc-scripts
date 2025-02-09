#!/bin/bash
configpath="config"
wordnum=$(sed -n '1p' "$configpath")
answerpath=$(sed -n '2p' "$configpath")
wordpath=$(sed -n '3p' "$configpath")
RANDOM=$$
wordnum=$(sed -n '1p' "$configpath")

i=2

while [ "$i" != 0 ]
do

	num=$(shuf --random-source='/dev/urandom' -n 1 -i 1-3)
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
