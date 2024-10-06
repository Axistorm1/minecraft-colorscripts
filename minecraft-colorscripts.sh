#!/usr/bin/env sh

SCRIPT_DIR=$( dirname -- "$( readlink -f -- "$0"; )"; )
BLOCKS_DIR="$SCRIPT_DIR/colorscripts"

_help() {
    echo "Print the unicode version of minecraft blocks in your shell"
    echo ""
    echo "Usage: minecraft-colorscripts [OPTION] [BLOCK NAME]"
    echo " -h \t Print this help menu."
    echo " -r \t Print a random block."
    echo " -l \t Print a list of all blocks."
    echo " -n NAME Print a block by name. Generally spelled like in the game."
}

_show_block_by_name() {
    block_name=$1
    cat "$BLOCKS_DIR/$block_name.txt" 2>/dev/null || echo "Invalid block"
}

_show_random_block() {
    cat $(shuf -n1 -e $BLOCKS_DIR/*)
}

_list_block_names() {
    ls -1 $BLOCKS_DIR | sed -e 's/\.txt$//'
}

case "$#" in
    0)
        _help
        ;;
    1)
        case $1 in
            -h)
                _help
                ;;
            -r)
                _show_random_block
                ;;
            -l)
                _list_block_names
                ;;
            *)
                echo "Input error."
                exit 1
                ;;
        esac
        ;;
    2)
        if [ "$1" = '-n' ]; then
            _show_block_by_name "$2"
        else
            echo "Input error."
            exit 1
        fi
        ;;
    *)
        echo "Input error, too many arguments."
        exit 1
        ;;
esac
