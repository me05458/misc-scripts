#!/bin/bash
configpath="config"
wordnum=$(sed -n '1p' "$configpath")
answerpath=$(sed -n '2p' "$configpath")
wordpath=$(sed -n '3p' "$configpath")
RANDOM=$$
wordnum=$(sed -n '1p' "$configpath")
mode=$(sed -n '4p' "$configpath")

i=2
if [ "$1" == "-a" ]
    then
        echo "$2" >> "$wordpath"
        echo "$3" >> "$answerpath"
        wordnum=$(("$wordnum" +1))
        echo "$wordnum" > "$configpath"
        echo "$answerpath" >> "$configpath"
        echo "$wordpath" >> "$configpath"
        echo "$mode" >> "$configpath"
elif [ "$1" == "-s" ]
    then
        if [ "$3" == "" ]
        then
            echo "You have to actually set something!"
        else
            if [ "$2" == "a" ]
            then
                echo "$wordnum" > "$configpath"
                echo "$3" >> "$configpath"
                echo "$wordpath" >> "$configpath"
                echo "$mode" >> "$configpath"

            elif [ "$2" == "w" ]
            then
                echo "$wordnum" > "$configpath"
                echo "$answerpath" >> "$configpath"
                echo "$3" >> "$configpath"
                echo "$mode" >> "$configpath"
            elif [ "$2" == "m" ]
            then
                echo "$wordnum" > "$configpath"
                echo "$answerpath" >> "$configpath"
                echo "$wordpath" >> "$configpath"
                echo "$3" >> "$configpath"
            else
                echo "Please either set a (answer) or w (word) or m (mode)!"
            fi
        fi

else
    if [ "$mode" == 2 ]
    then
    echo "2"
        while [ "$i" != 0 ]
        do
            num=$(shuf --random-source='/dev/urandom' -n 1 -i 1-"$wordnum")
            word=$(head -"$num" "$wordpath" | tail -1)
            answer=$(head -"$num" "$answerpath" | tail -1)
            nnum=$(shuf --random-source='/dev/urandom' -n 1 -i 1-"$wordnum")
            if [ "$nnum" == "$num" ]
            then
                if [ "$nnum"+1 == "$wordnum" ]
                then
                    nnum="0"
                else
                    nnum=$(("$nnum" + 1))
                fi
            fi
            answer2=$(head -"$nnum" "$answerpath" | tail -1)
            mnum=$(shuf --random-source='/dev/urandom' -n 1 -i 1-"$wordnum")
            if [ "$mnum" == "$num" -o "$mnum" == "$nnum" ]
            then
                if [ "$mnum"+1 == "$wordnum" ]
                then
                    mnum="0"
                else
                    mnum=$(("$nnum" + 1))
                fi
            fi
            answer3=$(head -"$mnum" "$answerpath" | tail -1)
            onum=$(shuf --random-source='/dev/urandom' -n 1 -i 1-"$wordnum")
            if [ "$onum" == "$num" -o "$onum" == "$nnum" -o "$onum" == "$mnum" ]
            then
                if [ "$onum"+1 == "$wordnum" ]
                then
                    onum="0"
                else
                    onum=$(("$onum" + 1))
                fi
            fi
            answer4=$(head -"$onum" "$answerpath" | tail -1)
            echo "$word:"
            ansnum=$(shuf --random-source='/dev/urandom' -n 1 -i 1-4)
            #echo "$ansnum"
            if [ "$ansnum" == 1 ]
            then
                echo "1. "$answer""
                echo "2. "$answer2""
                echo "3. "$answer3""
                echo "4. "$answer4""
            elif [ "$ansnum" == 2 ]
            then
                echo "1. "$answer2""
                echo "2. "$answer""
                echo "3. "$answer3""
                echo "4. "$answer4""
            elif [ "$ansnum" == 2 ]
            then
                echo "1. "$answer2""
                echo "2. "$answer3""
                echo "3. "$answer""
                echo "4. "$answer4""
            else
                echo "1. "$answer2""
                echo "2. "$answer3""
                echo "3. "$answer4""
                echo "4. "$answer""
            fi
            read input
            if [ "$input" == "$ansnum" ]
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
                echo "Correct answer is "$ansnum""
                i=1
            fi

        done
    else
    echo "hi"
        while [ "$i" != 0 ]
        do
        num=$(shuf --random-source='/dev/urandom' -n 1 -i 1-"$wordnum")
        word=$(head -"$num" "$wordpath" | tail -1)
        answer=$(head -"$num" "$answerpath" | tail -1)
            if [ "$mode" == 1 ]
            then
                tmp="$word"
                word="$answer"
                answer="$tmp"
            elif [ "$mode" != 0 ]
                then
                echo "Invalid mode detected. Setting to 0 (default)."
            fi


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
fi
