#! /bin/bash

DEST=/mnt/f/fresh_linux_install

mkdir -p $DEST/.local/share/gnome-shell/

dpkg --get-selections > $DEST/popos_packages.txt
ls $HOME/.local/share/gnome-shell/extensions > $DEST/.local/share/gnome-shell/extensions.list
rsync -a --info=progress2 -h /etc/apt/sources.list  $DEST/etc/sources.list
rsync -a --info=progress2 -h /etc/apt/sources.list.d $DEST/etc/sources.list.d
rsync -a --info=progress2 -h /etc/fstab $DEST/etc/fstab
rsync -a --info=progress2 -h $HOME/.zshrc $HOME/.themes $HOME/.icons $HOME/.fonts $HOME/.bashrc $HOME/.vimrc $HOME/.vimrc_back $HOME/.SpaceVim.d $HOME/.vim_back $HOME/.gitconfig $DEST/home-folder
rsync -a --info=progress2 -h $HOME/.config/i3 $HOME/.config/autostart $DEST/.config



