#!/bin/bash
cmd=(dialog --separate-output --checklist "Select options:" 22 76 16)
options=(1 "LinuxServer" off    # any option can be set to default to "on"
         2 "Jlesage" off
         3 "Other" off
         4 "Exit" off)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
for choice in $choices
do
    case $choice in
        1)
            echo "You've selected Jlesage"
            bash 
        2)
            echo "You've selected LinuxServer"
            cd /workspaces/ubuntu-vnc-xfce/clodsh/LinuxServer
            ;;
        3)
            echo "Youve Pick other options"
            ;;
        4)
            echo "Exiting"
            exit :1
            ;;
    esac
done