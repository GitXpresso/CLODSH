#!/bin/bash
# this script checks to see if you have ubuntu 
if [  -n "$(uname -a | grep Ubuntu)" ]; then
sudo apt update && sudo apt upgrade
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
fi 
# this script checks to see if you have Debian
if [  -n "$(uname -a | grep Debian)" ]; then
apt update && apt upgrade

# this command checks if you have docker installed
docker compose up -d
echo -e if a workspace dosent successfully install go here: https://coder.com/docs/install/