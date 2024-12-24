#!/bin/bash
echo "grabbing the kasmvnc jammy debian file"
wget -O kasmvnc.deb https://github.com/kasmtech/KasmVNC/releases/download/v1.3.3/kasmvncserver_jammy_1.3.3_amd64.deb 
echo "Installing the newly added debian file"
sudo apt install -y ./kasmvnc.deb
