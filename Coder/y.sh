#!/bin/bash
read -p "Do you want to proceed? (y/n) " yn

case $yn in 
	y ) echo Apache2 is Installing;;
	n ) Aborting Installation;
		exit;;
	* ) echo invalid response;
		exit 1;;
esac

BWhite='\033[1;37m'       # White
echo -e "${BWhite}Installing Apache2"
sudo apt-get install apache2