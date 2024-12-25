#!/bin/bash
echo "updating packages"
sudo apt update
echo "installing required package"
echo -e "apt-transport-https ca-certificates curl gnupg"
sudo apt install -y apt-transport-https ca-certificates curl gnupg
echo -e "finished installing required packages"
echo -e "Adding Docker’s Official GPG Key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg
echo -e "finished adding Docker's Offical GPG Key"
echo -e "Adding Docker Repo to Linux Mint"
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu jammy stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo -e "Finished Adding the Docker Repository"
echo -e "Updating to successfully add the recently added Docker Repo to Linux Mint"
sudo apt update
echo -e "installing Required Docker Packages"
echo e "docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin"
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
echo -e "finished"  
done


