#!/bin/bash
if [  -n "$(uname -a | grep Ubuntu)" ]; then
sudo apt update && sudo apt upgrade
apt update && apt upgrade
# this command checks if you have docker installed
docker compose up -d
echo -e if a workspace dosent successfully install go here: https://coder.com/docs/install/