#!/bin/bash

sudo adduser --disabled-login --gecos 'Gogs' git
# Clone the repository to the "gogs" subdirectory
git clone --depth 1 https://github.com/gogs/gogs.git gogs
# Change working directory
cd gogs
# Compile the main program, dependencies will be downloaded at this step
go build -o gogs