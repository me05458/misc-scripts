#!/bin/bash
configpath="config"
wordnum=$(sed -n '1p' "$configpath")
answerpath=$(sed -n '2p' "$configpath")
wordpath=$(sed -n '3p' "$configpath")
RANDOM=$$
wordnum=$(sed -n '1p' "$configpath")

i=2
if [ "$1" == "-a" ]
    then
        echo "$2" >> "$wordpath"
        echo "$3" >> "$answerpath"
        wordnum=$(("$wordnum" +1))
        echo "$wordnum" > "$configpath"
        echo "$answerpath" >> "$configpath"
        echo "$wordpath" >> "$configpath"
        echo "Done!"
elif [ "$1" == "-s" ]
    then
        if [ "$3" == "" ]
        then
            echo "Please set a file name!"
        else
            if [ "$2" == "a" ]
            then
                echo "$wordnum" > "$configpath"
                echo "$3" >> "$configpath"
                echo "$wordpath" >> "$configpath"
            elif [ "$2" == "w" ]
            then
                echo "$wordnum" > "$configpath"
                echo "$answerpath" >> "$configpath"
            echo "$3" >> "$configpath"
            else
                echo "Please either set a (answer) or w (word)!"
            fi
        fi

else
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
fi
