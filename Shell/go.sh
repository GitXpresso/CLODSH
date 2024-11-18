#!/bin/bash

# Downloading Go
wget https://golang.org/dl/go1.22.1.linux-amd64.tar.gz
# Extracting Go
sudo tar -xvzf go1.22.1.linux-amd64.tar.gz -C /opt
# Moving Go to /usr/local
sudo mv /opt/go /usr/local
# Adding Go to PATH
export PATH=$PATH:/usr/local/go/bin
# Checking Go version
go version
# Removing Go download file
rm go1.22.1.linux-amd64.tar.gz
# Adding Go to PATH permantently
echo "export PATH=$PATH/usr/local/go/bin" >> ~\.bashrc
# Reloading bash 
source ~\.bashrc
# Checking Go version
go version
# Checking Go location
which go
# Checking Go environment variables
go env
