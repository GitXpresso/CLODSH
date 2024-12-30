#!/bin/bash

dpkg -s $1 &> /dev/null

if [ $? -eq 0 ]; then
    echo "Package $1 is installed!"
    echo "installing package"
    apt install $1
else
    echo "Package $1 is NOT installed!"
fi