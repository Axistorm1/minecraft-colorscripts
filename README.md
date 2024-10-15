# minecraft-colorscripts
Some scripts to print out images of minecraft to the terminal. Heavily inspired by [Pokemon-colorscripts](https://github.com/nuke-dash/pokemon-colorscripts-mac/)

![Exemple of random block](https://imgur.com/g6n1hbb.png)

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
    -t      Print a random block and its name.
    -p      Print a list of all texture packs.
```

# Add custom textures
To add your own files or texture packs:
```
    -> Create a new folder in textures/ with your textures 
    -> Execute png_reader.py [texture_pack] found in generator_scripts/ 
    -> Wait for the colorscripts to be created 
    -> Go to minecraft-colorscripts.sh and modify the SELECTED_PACK variable to the texture pack you want (default texture pack is default) 
    -> Enjoy!!
```
# Known bugs
None. Please report any unexpected behaviour.

# Tested on
```
Ubuntu:  
    -> alacritty  
        -> zsh  
        -> bash  
```

# Disclaimers
Default files are Mojang's property.

Author is not liable for any error/issue caused by this program.

# Author
Axistorm
