#!/bin/bash

BWhite='\033[1;37m'  
BPurple='\033[1;35m' 
bold=$(tput bold)
Black='\033[0;30m'
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'  
Color_Off='\033[0m'  
Purple='\033[0;35m' 
echo -e " ${bold} Installing Python Web frameworks Packages"
read -p "Do you want to Proceed (y/n) " yn

case $yn in 
	y ) echo install requirements;;
	n ) echo successfully stopped the Installation;
		exit;;
	* ) echo invalid response;
		exit 1;;
esac

BWhite='\033[1;37m'       # White
echo -e "${BWhite}Updating and Upgrading"
sudo apt update && sudo apt full-upgrade
echo -e "${BWhite}Installing requirements"
echo -e "${BWhite}Python Packages for Web frameworks"
pip install -r requirements.txt
echo -e "${bold}you need 397 storage to fix this error do you want to proceed"
echo -e "${BWhite}did you get this if you did then put y if not put n"
echo -e "${BPurple}note:${Color_Off}${bold}This error originates from a subprocess, and is likely not a problem with pip."
echo -e "${BRed}error: ${Color_Off}${bold}metadata-generation-failed"
read -p "Did you get this error? (y/n) " yn

case $yn in 
	y ) echo install requirements;;
	n ) echo successfully stopped the Installation;
		exit;;
	* ) echo invalid response;
		exit 1;;
esac
echo -e " ${Purple}note:${Color_Off} This error originates from a subprocess, and is likely not a problem with pip."
echo -e "${BRed}error: ${BBlack}metadata-generation-failed"
ll