#!/bin/bash

# Start the installation by ensuring that all the packages used by docker as dependencies are installed.
sudo apt update && sudo apt -y full-upgrade
sudo apt install curl gnupg2 apt-transport-https software-properties-common ca-certificates

# Check if a reboot is required after the upgrade:

[ -f /var/run/reboot-required ] && sudo reboot -f

# Import Docker GPG key
# Import Docker GPG key used for signing Docker packages:dad


