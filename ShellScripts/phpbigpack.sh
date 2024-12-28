#!/bin/bash
sudo apt update && sudo apt full-upgrade
bold=$(tput bold)

echo -e " ${bold} 1. Installing All available Python Packages"
read -p "Do you want to Proceed (y/n) " yn

case $yn in 
	y ) echo install requirements;;
	n ) Aborting Installation;
		exit;;
	* ) echo invalid response;
		exit 1;;
esac

BWhite='\033[1;37m'       # White
echo -e "${BWhite}Installing requirements"
pip install -r requirements.txt