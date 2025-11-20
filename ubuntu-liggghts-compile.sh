#! /bin/bash
# v1.0.1
# author: Markus J. Schmidt
# changes: by H. Otto
# license: GNU GPLv3
# Tested on: Ubuntu 20.04.6
# Installation script for a self-compiled version of LIGGGHTS in the home folder, extended from engineerdo PDF manual

sudo apt update
sudo apt upgrade -y
sudo apt --install-recommends install -y openmpi-bin
sudo apt install -y git g++
sudo apt install -y cmake libavcodec-dev libavformat-dev libavutil-dev libboost-dev libdouble-conversion-dev libeigen3-dev libexpat1-dev libfontconfig-dev libfreetype6-dev libgdal-dev libglew-dev libhdf5-dev libjpeg-dev libjsoncpp-dev liblz4-dev liblzma-dev libnetcdf-dev libnetcdf-cxx-legacy-dev libogg-dev libpng-dev libpython3-dev libqt5opengl5-dev libqt5x11extras5-dev libsqlite3-dev libswscale-dev libtheora-dev libtiff-dev libxml2-dev libxt-dev qtbase5-dev qttools5-dev zlib1g-dev
cd ~
git clone https://github.com/hendrikOtto/LIGGGHTS-PUBLIC.git
cd ~/LIGGGHTS-PUBLIC/src
cp MAKE/Makefile.user_default MAKE/Makefile.user
sed -i 's/#AUTOINSTALL_VTK = "OFF"/AUTOINSTALL_VTK = "ON"/' MAKE/Makefile.user
make auto
cd ~
sudo ln -s ~/LIGGGHTS-PUBLIC/src/lmp_auto /bin/lmp380
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/LIGGGHTS-PUBLIC/lib/vtk/install/lib/" >> ~/.bashrc
source ~/.bashrc
echo "LIGGGHTS has been Installed. Instance eill reboot and SSH disconnected."
sudo reboot now -h
