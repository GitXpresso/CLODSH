#!/bash/bin

# since kali linux already have curl installed, that means you dont need to install curl.

curl -s https://api.github.com/repos/docker/compose/releases/latest | grep browser_download_url  | grep docker-compose-linux-x86_64 | cut -d '"' -f 4 | wget -qi -

# Make the binary file executable.

chmod +x docker-compose-linux-x86_64

# Move the file to your PATH.

sudo mv docker-compose-linux-x86_64 /usr/local/bin/docker-compose

# Add user to docker group:

sudo usermod -aG docker $USER
newgrp docker

# To know if you successfully install docker compose you need to confirm the version.

docker-compose version
