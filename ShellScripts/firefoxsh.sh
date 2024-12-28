#!/bin/bash
# SH means self hosted
#!/bin/bash

BWhite='\033[1;37m'  
BPurple='\033[1;35m' 
bold=$(tput bold)
Black='\033[0;30m'
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'  
Color_Off='\033[0m'  
Purple='\033[0;35m' 
echo -e "${bold}are you currently using vscode?"
echo -e "${bold} type y if you are currently using vscode and type n if you are not currently using vscode desktop for vscode web"
echo -e "${bold} Installing Mostly All of the PYPI Packages"
read -p "Do you want to proceed? (y/n) " yn

case $yn in 
	y ) echo install requirements;;
	n ) echo successfully stopped the Installation;
		exit;;
	* ) echo invalid response;
		exit 1;;
esac


BWhite='\033[1;37m'  
BPurple='\033[1;35m' 
bold=$(tput bold)
Black='\033[0;30m'
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'  
Color_Off='\033[0m'  
Purple='\033[0;35m' 
echo -e "${bold}are you currently using vscode?"
echo -e "${bold} type y if you are currently using vscode and type n if you are not currently using vscode desktop for vscode web"
echo -e "${bold} Installing Mostly All of the PYPI Packages"
read -p "Do you want to proceed? (y/n) " yn

case $yn in 
	y ) echo install requirements;;
	n ) echo successfully stopped the Installation;
		exit;;
	* ) echo invalid response;
		exit 1;;
esac

