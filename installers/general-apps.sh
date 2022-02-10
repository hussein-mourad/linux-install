#! /bin/bash
# xmodmap -e "keycode 66 = Escape"; xmodmap -e "keycode 9 = Caps_Lock";
# setxkbmap -option caps:swapescape

#apps
sudo apt -y install build-essential;
sudo apt -y install plank;
sudo apt -y install ranger;
sudo apt -y install vim;
sudo apt -y install nodejs npm;
sudo apt -y install zsh;
sudo apt -y install figlet; # fun 
sudo apt -y install python-is-python3 python3-pip;
sudo apt -y install openjdk-16-jdk openjdk-16-jre;
sudo apt -y install gnome-tweaks;
sudo apt -y install gparted;
sudo apt -y install peek;
sudo apt -y install simplescreenrecorder; 
sudo apt -y install exfat-utils exfat-fuse; # fat32 support
sudo apt -y install texlive-latex-extra;
sudo apt -y install texlive-extra-utils;
# sudo apt -y install texlive-base;
# sudo apt -y install texlive-latex-recommended;
# sudo apt -y install texlive
# sudo apt -y install texlive-full
sudo apt -y install google-chrome-stable; # need to add repo to apt 
sudo apt -y install microsoft-edge-stable; # need to add repo to apt
sudo apt -y install teams;
sudo apt -y install discord;
sudo apt -y install touche touchegg; # gestures support
sudo apt -y install atom;
sudo apt -y install firefox;
sudo apt -y install vnstat vnstati; # network tools
# vnstati -vs -i wlp02s20fs -o ~/summary.png
sudo apt -y install gitg; # git viewer
sudo apt -y install gnome-usage;
sudo apt -y install gnome-logs;
sudo apt -y install wmctrl;
sudo apt -y install retext; # markdown editor
sudo apt -y install gnome-sushi; # quick look alternative in linux
sudo apt -y install lollypop; # music player
sudo apt -y install mp3rename;
sudo apt -y install rename; # rename multiple files
sudo apt -y install httpie;
sudo apt -y install fd-find; # alternative to find
sudo apt -y install tldr; # man alternative
sudo apt -y install mdless glow;

sudo npm i -g npm;
sudo npm i -g n;
sudo n stable;
sudo npm i -g npkill typescript prettier 

# sudo snap install cmake --classic;

# touchegg (download gnome extensions x11 gestures)
sudo add-apt-repository ppa:touchegg/stable -y;
sudo apt update;
sudo apt -y install touchegg;

# regolith Desktop environment
# sudo add-apt-repository ppa:regolith-linux/release -y
# sudo apt -y install regolith-desktop-standard

# i3 Desktop environment
# sudo apt -y install i3 lxappearance nitrogen rofi compton


curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh > ohmyzsh-install.sh;

# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";

# SpaceVim
curl -sLf https://spacevim.org/install.sh | bash

