#!/bin/bash 

echo yes y | sudo apt update
if ! which docker > /dev/null; then
   echo -e "Command not found! Install? (y/n) \c"

