#!/bin/bash

sudo sh -c 'echo "deb [trusted=yes] http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list';
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -;
sudo apt update;
sudo apt install -y ros-noetic-desktop-full;
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
echo "source /opt/ros/noetic/setup.zsh" >> ~/.zshrc;
source ~/.zshrc;
sudo apt -y install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential;
sudo rosdep init;
rosdep update;
mkdir -p ~/catkin_ws/src;
cd ~/catkin_ws/;
catkin_make;
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc;
echo "source ~/catkin_ws/devel/setup.zsh" >> ~/.zshrc;
cd ~/;
echo $ROS_PACKAGE_PATH;
sudo apt -y install ros-noetic-rosserial-arduino ros-noetic-rosserial
