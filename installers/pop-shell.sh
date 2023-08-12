#!/bin/bash

sudo apt -y install git node-typescript make;
git clone https://github.com/pop-os/shell.git
mv shell popos-shell
cd popos-shell
make local-install
