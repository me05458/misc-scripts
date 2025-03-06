# misc-scripts
Random scripts and small projects I use in my terminal
To install:
```git clone https://github.com/me05458/misc-scripts&&cd misc-scripts```
# WOTD
Game for learning words and vocabulary.\
To configure:\
`cd WOTD`\
The words and answers go in two separate files, separated by new lines.\
Config file format:
```
<number of words>
<answer file>
<word file>
<mode>
```
Modes:
- 0 - displays a definition and you have to write a word.
- 1 - displays a word and you have to write a definition.
- 2 - displays a word and several possible definitions (multiple choice). This only works for more than four possible words.

Usage:
- Just `./WOTD.sh` will have you play the game. `quit` or `q` will quit.
- `./WOTD.sh -a <word> <definition>` will add a word with a definition.
- `./WOTD.sh -s w <file>` and `./WOTD.sh -s a <file>` will set filepath for words and defintions respectively.
- `./WOTD.sh -s m <mode>` will set a mode.
- `./WOTD.sh -h`, `./WOTD.sh -help`, or `./WOTD.sh --help` will provide a basic list of possible commands.

Note:\
Mode 2 has some ugly code to prevent as many duplicate answer opetions. Duplicates are still, however, possible. Also I'm not sure the random generator is random.
# dates
So far only isLeapYear and getDaysShort work.\
isLeapYear - takes an integer for year and reports 1 if it's a leap year and 0 otherwise.\
getDaysShort - takes a day, month, and year integer (in that order) and returns a number of days (since 1900 because dates before that do not exist)
# tracker
install:
```
cd tracker
make
```
Basic days-since tracker. It will write to and read from the file called `data `. If this is unsatisfactory, change all of the occurences in code yourself.\
It tracks occurences as single letters and can track multiple occurences at once (it doesn't care if there are multiple occurences per day). You can use pretty much all letters and numbers

Usage:\
Note that you can use either `./tracker -<command>` or `./tracker <command>` in all cases except for help, which is special.
- `./tracker -a <letter>` will add letter to the current day's date.
- `./tracker -o` will report the contents of the data file in a readable way.
- `./tracker -r` will clear the file.
- `./tracker -f <letter>` will report days since letter.
- `./tracker <letter>` will report days since letter (unless letter is one of the above commands, in which case you should use -f).
- `./tracker --help` (and not `-help` or `-h`) will provide a list of available actions.
