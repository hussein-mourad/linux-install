#! /bin/bash
# xmodmap -e "keycode 66 = Escape"; xmodmap -e "keycode 9 = Caps_Lock";
# setxkdmap -option caps:swapescape
sudo apt install -y curl wget;

# git (latest)
sudo add-apt-repository -y ppa:git-core/ppa;
sudo apt update;
sudo apt install -y git;

# gh
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null;
sudo apt update;
sudo apt install -y gh;

#apps
sudo apt -y install build-essential;
sudo apt -y install plank;
sudo apt -y install ranger;
sudo apt -y install vim;
sudo apt -y install nodejs npm;
sudo apt -y install zsh;
sudo apt -y install python-is-python3 python3-pip;
sudo apt -y install openjdk-16-jdk openjdk-16-jre;
sudo apt -y install gnome-tweaks;
sudo apt -y install gparted;
sudo apt -y install peek;
sudo apt -y install simplescreenrecorder;
sudo apt -y install exfat-utils exfat-fuse;
sudo apt -y install texlive-latex-extra
# sudo apt -y install texlive-base;
# sudo apt -y install texlive-latex-recommended;
# sudo apt -y install texlive
# sudo apt -y install texlive-full

sudo npm i -g npm;
sudo npm i -g n;
sudo n stable;
sudo npm i -g npkill typescript prettier 

sudo snap install cmake --classic;

# ros
sudo sh -c 'echo "deb [trusted=yes] http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list';
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -;
sudo apt update;
sudo apt install -y ros-noetic-desktop-full;
# echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
# source ~/.bashrc
echo "source /opt/ros/noetic/setup.zsh" >> ~/.zshrc;
source ~/.zshrc;
sudo apt -y install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential;
sudo rosdep init;
rosdep update;
mkdir -p ~/catkin_ws/src;
cd ~/catkin_ws/;
catkin_make;
# echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc;
echo "source ~/catkin_ws/devel/setup.zsh" >> ~/.zshrc;
cd ~/;
echo $ROS_PACKAGE_PATH;
sudo apt -y install ros-noetic-rosserial-arduino ros-noetic-rosserial

# mongodb
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

# touchegg (download gnome extensions x11 gestures)
sudo add-apt-repository ppa:touchegg/stable -y;
sudo apt update;
sudo apt -y install touchegg;

# fonts
sudo apt -y  install ttf-mscorefonts-installer

#oh-my-zsh (must be at the end as the commands block the terminal)
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions;
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting;
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions;
git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH/custom/plugins/zsh-vi-mode;
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";



