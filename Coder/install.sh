#!/bin/bash

# Check if the /etc/os-release file exists
if [ -f "/etc/os-release" ]; then
    # Read the ID field from the file
    os_id=$(grep -i '^ID=' /etc/os-release | cut -d '=' -f 2 | tr -d '"')

    # Check if the OS is Kali Linux
    if [ "$os_id" = "kali" ]; then
        echo "You are using Kali Linux."
    else
        echo "You are not using Kali Linux."
    f

