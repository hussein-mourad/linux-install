#! /bin/bash

DEST=/mnt/f/fresh_linux_install

rm -rf $DEST/extensions
rm -rf $DEST/sources.list.d/
rm -rf $DEST/config_files

mkdir $DEST/extensions/
mkdir $DEST/sources.list.d/
mkdir $DEST/config_files/

dpkg --get-selections > $DEST/popos_packages.txt
cp -r $HOME/.local/share/gnome-shell/extensions/ $DEST/
cp -r /etc/apt/sources.list.d/ $DEST/
cp /etc/apt/sources.list  $DEST/sources.list
cp /etc/fstab $DEST/fstab
cp -r $HOME/.zshrc $HOME/.vimrc $HOME/.vim/ $HOME/.themes/ $HOME/.icons/ $HOME/.fonts/ $HOME/.bashrc $DEST/config_files/
cp -r $HOME/.config/i3/ $DEST/config_files


