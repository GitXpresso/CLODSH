#!/bin/bash

# this commands install local tunnel using npm
npm install -g localtunnel
# this command checks your local tunnelpassword
curl https://loca.lt/mytunnelpassword
echo "copy and paste the tunnelpassword aka your ip address in the loca.lt url"
# installs and run memos
docker run -d --name memos -p 5230:5230 -v ~/.memos/:/var/opt/memos neosmemo/memos:stable
# this sets a url for the running docker container port

