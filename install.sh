#!/usr/bin/env sh

INSTALL_DIR='usr/local/opt'
BIN_DIR='usr/local/bin'

rm -rf $INSTALL_DIR/minecraft-colorscripts || return 1

mkdir -p $INSTALL_DIR/minecraft-colorscripts || return 1

cp -rf colorscripts $INSTALL_DIR/minecraft-colorscripts
cp minecraft-colorscripts.sh $INSTALL_DIR/minecraft-colorscripts

rm -rf $BIN_DIR/minecraft-colorscripts || return 1
ln -s $INSTALL_DIR/minecraft-colorscripts/minecraft-colorscripts.sh $BIN_DIR/minecraft-colorscripts
