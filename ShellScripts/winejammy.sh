sudo apt install wget -y
echo -e "enabling 32bit support for ubuntu"
sudo dpkg --add-architecture i386 
echo "Adding the Wine Repo Keys"
echo "creating keyring file"
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
sudo apt update && sudo apt install --install-recommends winehq-stable -y
echo "configuring wine"
sudo winecfg
