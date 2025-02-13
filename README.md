# misc-scripts
Random scripts and small projects I use in my terminal
# WOTD
Game for learning words and vocabulary.\
To run:
```git clone https://github.com/me05458/misc-scripts&&cd misc-scripts```\
the words and answers need to be in two separate files, separated only by new lines. Add the file paths of the files to the config file, and make sure the first number in the config file is the number of words.\
Modes:
- 0 - displays a definition and you have to write a word.
- 1 - displays a word and you have to write a definition.
Usage:
- Just `./WOTD.sh` will have you play the game. `quit` or `q` instead of a word will quit.
- `./WOTD.sh -a <word> <definition>` will add a word with a definition.
- `./WOTD.sh -s w <file>` and `./WOTD.sh -s a <file>` will set filepath for words and defintions respectively.
- `./WOTD.sh -s m <mode>` will set a mode.
# dates
So far only isLeapYear and getDaysShort work.
