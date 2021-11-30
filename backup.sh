#! /bin/bash

DEST=$HOME/Documents/fresh_linux_install/

# check that the folders exists
[ ! -d "$DEST/extensions/" ] && mkdir $DEST/extensions/
[ ! -d "$DEST/sources.list.d/" ] && mkdir $DEST/sources.list.d/

dpkg --get-selections > $DEST/popos_packages.txt
cp -r $HOME/.local/share/gnome-shell/extensions/ $DEST/
cp -r /etc/apt/sources.list.d/ $DEST/
cp /etc/apt/sources.list  $DEST/sources.list
cp /etc/fstab $DEST/fstab

