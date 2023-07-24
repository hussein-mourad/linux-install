#! /bin/bash

DEST=/mnt/d/fresh_linux_install

mkdir -p $DEST/.local/share/gnome-shell/

dpkg --get-selections > $DEST/popos_packages.txt
ls $HOME/.local/share/gnome-shell/extensions > $DEST/.local/share/gnome-shell/extensions.list
rsync -a --info=progress2 -h /etc/apt/sources.list  $DEST/etc/apt/sources.list
rsync -a --info=progress2 -h /etc/apt/sources.list.d $DEST/etc/apt/
rsync -a --info=progress2 -h /etc/fstab $DEST/etc/fstab
rsync -a --info=progress2 -h $HOME/.zshrc $HOME/.bashrc $HOME/.vimrc $HOME/.SpaceVim.d $HOME/.vim_back $HOME/.gitconfig $DEST/home-folder
rsync -a --info=progress2 -h $HOME/.config/i3 $HOME/.config/autostart $DEST/.config
rsync -a --info=progress2 -h $HOME/.local/bin/ $DEST/.local/bin/
rsync -a --info=progress2 -h $HOME/default-ubuntu.sh $DEST/
rsync -a --info=progress2 -h $HOME/my-settings.sh $DEST/
