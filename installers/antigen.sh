#!/bin/bash

sudo mkdir -p /usr/share/antigen/;
curl -L git.io/antigen > antigen.zsh;
sudo mv antigen.zsh /usr/share/antigen/;
sudo chmod +x /usr/share/antigen/antigen.zsh;
