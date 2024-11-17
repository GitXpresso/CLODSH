#!/bash/bin

# This script automatically installs github cli
wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) 
sudo mkdir -p -m 755 /etc/apt/keyrings 
wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null 
sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg 
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null 
sudo apt update 
sudo apt install gh -y
# this will verify that you have github cli is installed 
gh --version
# This will show you a list of commands of what to use "gh" 
gh -h

echo "To know more about github cli and how to use go this repository: https://github.com/cli/cli/"