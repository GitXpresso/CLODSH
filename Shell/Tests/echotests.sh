#!/bin/bash

      sudo apt update && sudo apt -y full-upgrade
      sudo apt install curl gnupg2 apt-transport-https software-properties-common ca-certificates
      echo "this will check if you need a reboot after the upgrade"
      [ -f /var/run/reboot-required ] && sudo reboot -f
      curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg
      echo "deb [arch=amd64] https://download.docker.com/linux/debian bullseye stable" | sudo tee  /etc/apt/sources.list.d/docker.list
      sudo apt update
      sudo apt install docker-ce docker-ce-cli containerd.io
      sudo usermod -aG docker $USER
      newgrp docker
      echo "this will check if docker is installed using the command dcker version"
      docker version   
      fi
fi