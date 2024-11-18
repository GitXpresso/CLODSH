#!/bin/bash

#  
cd workspaces/CLODSH/Shell

echo "this will automatically install docker compose and docker if you dont have it already installed."

chmod u+x composekali.sh

./composekali.sh

chmod u+x dockerkali.sh

./dockerkali.sh

cd workspaces/CLODSH/LinuxServer/Chromium

docker compose up -d
