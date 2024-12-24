#!/bin/bash
echo "grabbing the kasmvnc jammy debian file"
wget -O kasmvnc.deb https://github.com/kasmtech/KasmVNC/releases/download/v1.3.3/kasmvncserver_jammy_1.3.3_amd64.deb
echo "Updating Packages in order to successfully install kasmvnc"
sudo apt update
echo "Installing the newly added debian file"
sudo apt install -y ./kasmvnc.deb
sudo adduser $USER ssl-cert
echo "Kasmvnc successfully installed"
echo "put this "kasmvncserver" in your terminal to setup kasmvnc"
echo "here is a link to help you with packsges that came with kasmvnc debian file, https://www.kasmweb.com/kasmvnc/docs/latest/serverside.html"
