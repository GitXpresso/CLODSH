#!/bin/bash

# Start the installation by ensuring that all the packages used by docker as dependencies are installed.
sudo apt update && sudo apt -y full-upgrade
sudo apt install curl gnupg2 apt-transport-https software-properties-common ca-certificates

# Check if a reboot is required after the upgrade:

[ -f /var/run/reboot-required ] && sudo reboot -f

# Import Docker GPG key
Import Docker GPG key used for signing Docker packages:

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg


# Add the Docker repository to Kali Linux
## Add Docker repository which contain the latest stable releases of Docker CE.

echo "deb [arch=amd64] https://download.docker.com/linux/debian bullseye stable" | sudo tee  /etc/apt/sources.list.d/docker.list

# This command will add repository URL to /etc/apt/sources.list.d/docker.list.

## Install Docker on Kali Linux by Updating the apt package index.

sudo apt update

# To install Docker CE on Kali Linux, run the command:
 
sudo apt install docker-ce docker-ce-cli containerd.io

# This installation will add docker group to the system without any users. Add your user account to the group to run docker commands as non-privileged user.

sudo usermod -aG docker $USER
newgrp docker

# Check that docker successfully got installed.
docker version
