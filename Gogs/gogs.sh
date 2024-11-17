#!/bin/bash

# This command Clones the repository for you
git clone --depth 1 https://github.com/gogs/gogs.git gogs
# This command automatically changes the current directory your in, in your terminal 
cd gogs
# This build the project using go
go build -o gogs
# This command starts the self hosted server
./gogs web 
# Do /.gogs -h to see more commands