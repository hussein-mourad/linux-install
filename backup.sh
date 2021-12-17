#! /bin/bash

DEST=/mnt/f/fresh_linux_install

rm -rf $DEST/sources.list.d/
rm -rf $DEST/config_files

mkdir $DEST/sources.list.d/
mkdir $DEST/config_files/

dpkg --get-selections > $DEST/popos_packages.txt
# cp -r $HOME/.local/share/gnome-shell/extensions/ $DEST/
ls $HOME/.local/share/gnome-shell/extensions > extensions
cp -r /etc/apt/sources.list.d/ $DEST/etc/
cp /etc/apt/sources.list  $DEST/etc/sources.list
cp /etc/fstab $DEST/etc/fstab
cp -r $HOME/.zshrc $HOME/.themes/ $HOME/.icons/ $HOME/.fonts/ $HOME/.bashrc $DEST/config_files/
# cp -r $HOME/.vim/ $HOME/.vimrc $DEST/config_files/
cp -r $HOME/.SpaceVim.d/ $DEST/config_files
cp -r $HOME/.config/i3 $DEST/.config/
cp -r $HOME/.config/autostart $DEST/.config/


