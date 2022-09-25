#!/bin/bash


#Prep
sudo apt -y install wget curl;

# zsh
sudo apt -y install zsh;

# Oh my zsh
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh > ohmyzsh-install.sh;

# Antigen
sudo apt install zsh-antigen;
#sudo mkdir -p /usr/share/antigen/;
#curl -L git.io/antigen > antigen.zsh;
#sudo mv antigen.zsh /usr/share/antigen/;
#sudo chmod +x /usr/share/antigen/antigen.zsh;

