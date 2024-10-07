# minecraft-colorscripts
Some scripts to print out images of minecraft to the terminal. Heavily inspired by [Pokemon-colorscripts](https://github.com/nuke-dash/pokemon-colorscripts-mac/)

Work in progress. Please report any bug you find.

# Installation
Download the code from this repository or git clone

```
git clone https://github.com/Axistorm1/minecraft-colorscripts.git
```
`cd` into the directory and run the install script (using sudo if necessary)

```
cd minecraft-colorscripts
sudo ./install.sh
```
It should be installed, if not, run the commands in the install.sh manually. You can check by running

```
minecraft-colorscripts
```
Which should print the help page for the program

# Usage
You can run the program from the command line to either display a minecraft block of your choice by specifying the block name or make it display a random block.
```
Usage: minecraft-colorscripts [OPTION] [BLOCK NAME]
    -h      Print this help menu.
    -r      Print a random block.
    -l      Print a list of all blocks.
    -n NAME Print a block by name. Generally spelled like in the game.
    -w      Print a random wool block.
```

# Known bugs
Not all blocks are available due to transparency errors. Will be fixed in the near future (or not).

# Tested on
Ubuntu with alacritty and zsh

# Author
Axistorm
