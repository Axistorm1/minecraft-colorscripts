#!/usr/bin/env sh

INSTALL_DIR='/opt'
BIN_DIR='/bin'

sudo rm -rf $INSTALL_DIR/minecraft-colorscripts || return 1

sudo mkdir -p $INSTALL_DIR/minecraft-colorscripts || return 1

sudo cp -rf colorscripts $INSTALL_DIR/minecraft-colorscripts
sudo cp minecraft-colorscripts.sh $INSTALL_DIR/minecraft-colorscripts

sudo rm -rf $BIN_DIR/minecraft-colorscripts || return 1
sudo ln -s $INSTALL_DIR/minecraft-colorscripts/minecraft-colorscripts.sh $BIN_DIR/minecraft-colorscripts
echo "Installed successfully!"
