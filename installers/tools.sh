#! /bin/bash
# xmodmap -e "keycode 66 = Escape"; xmodmap -e "keycode 9 = Caps_Lock";
# setxkbmap -option caps:swapescape

sudo apt -y install build-essential;
sudo apt -y install plank;
sudo apt -y install ranger;
sudo apt -y install gparted;
sudo apt -y install peek;
sudo apt -y install simplescreenrecorder; 
sudo apt -y install exfat-utils exfat-fuse; # fat32 support
sudo apt -y install texlive-latex-recommended;
sudo apt -y install texlive-latex-extra;
sudo apt -y install texlive-extra-utils;
# sudo apt -y install texlive-base;
# sudo apt -y install texlive
# sudo apt -y install texlive-full

sudo apt -y install vnstat vnstati; # network tools
# vnstati -vs -i wlp02s20fs -o ~/summary.png
sudo apt -y install wmctrl;
sudo apt -y install retext; # markdown editor
sudo apt -y install lollypop; # music player
sudo apt -y install mp3rename;
sudo apt -y install rename; # rename multiple files
sudo apt -y install httpie;
sudo apt -y install fd-find; # alternative to find
sudo apt -y install tldr; # man alternative
sudo apt -y install mdless glow;
sudo apt -y install pdftk;
sudo apt -y install blender audacity;
sudo apt -y install grub-customizer;
sudo apt -y install gimp;
sudo apt -y install mpv;

# sudo snap install cmake --classic;

# regolith Desktop environment
# sudo add-apt-repository ppa:regolith-linux/release -y
# sudo apt -y install regolith-desktop-standard

# i3 Desktop environment
# sudo apt -y install i3 lxappearance nitrogen rofi compton
