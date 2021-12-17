#!/bin/bash

sudo apt -y install gnupg;
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -;
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list;
sudo apt update;
sudo apt -y install mongodb-org;
## prevents unintended upgrades
echo "mongodb-org hold" | sudo dpkg --set-selections;
echo "mongodb-org-database hold" | sudo dpkg --set-selections;
echo "mongodb-org-server hold" | sudo dpkg --set-selections;
echo "mongodb-org-shell hold" | sudo dpkg --set-selections;
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections;
echo "mongodb-org-tools hold" | sudo dpkg --set-selections;
## ps --no-headers -o comm 1;
sudo systemctl start mongod;
sudo systemctl daemon-reload;
sudo systemctl status mongod;
sudo systemctl enable mongod;
## sudo systemctl stop mongod;
## sudo systemctl restart mongod;
## sudo service mongod stop;