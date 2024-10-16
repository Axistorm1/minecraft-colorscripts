#!/usr/bin/env sh

SCRIPT_DIR=$( dirname -- "$( readlink -f -- "$0"; )"; )
BLOCKS_DIR="$SCRIPT_DIR/colorscripts/"
SELECTED_PACK="default-1.8.9"

_help() {
    echo "Print the unicode version of minecraft blocks in your shell"
    echo ""
    echo "Usage: minecraft-colorscripts [OPTION] [BLOCK NAME]"
    echo " -h \t Print this help menu."
    echo " -r \t Print a random block."
    echo " -l \t Print a list of all blocks."
    echo " -n NAME Print a block by name. Generally spelled like in the game."
    echo " -w \t Print a random wool block."
    echo " -t \t Print a random block and its name."
    echo " -p \t Print a list of all texture packs."
}

_show_block_by_name() {
    block_name=$1
    cat "$BLOCKS_DIR/$SELECTED_PACK/$block_name.txt" 2>/dev/null || echo "Invalid block"
}

_show_random_block() {
    cat $(shuf -n1 -e $BLOCKS_DIR/$SELECTED_PACK/*)
}

_show_random_block_n_title() {
    block_file=$(shuf -n1 -e $BLOCKS_DIR/$SELECTED_PACK/*)
    block_name=$(basename $block_file .txt)
    _show_block_by_name $block_name
    echo $block_name
}

_list_block_names() {
    ls -1 $BLOCKS_DIR/$SELECTED_PACK/ | sed -e 's/\.txt$//'
}

_show_random_wool_block() {
    cat $(shuf -n1 -e $BLOCKS_DIR/$SELECTED_PACK/wool_colored*)
}

_list_texture_packs() {
    ls -1 $BLOCKS_DIR/
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
            -w)
                _show_random_wool_block
                ;;
            -t)
                _show_random_block_n_title
                ;;
            -p)
                _list_texture_packs
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
