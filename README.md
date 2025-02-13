# misc-scripts
Random scripts and small projects I use in my terminal
# WOTD
Game for learning words and vocabulary.\
To install:
```git clone https://github.com/me05458/misc-scripts&&cd misc-scripts```\
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
- 2 - displays a word and several possible definitions (multiple choice)
Usage:
- Just `./WOTD.sh` will have you play the game. `quit` or `q` will quit.
- `./WOTD.sh -a <word> <definition>` will add a word with a definition.
- `./WOTD.sh -s w <file>` and `./WOTD.sh -s a <file>` will set filepath for words and defintions respectively.
- `./WOTD.sh -s m <mode>` will set a mode.
Note:\
Mode 2 has some ugly code to prevent as many duplicate answer opetions. Duplicates are still, however, possible.
# dates
So far only isLeapYear and getDaysShort work.
