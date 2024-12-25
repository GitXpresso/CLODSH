#!/bin/bash
cmd=(dialog --separate-output --checklist "Select options:" 22 76 16)
options=(1 "Install Docker" off    # any option can be set to default to "on"
         2 "Avidemux" off
         3 "Czkawka" off
         4 "Dupeguru" off
         5 "Filebot" off
         6 "Filezilla" off
         7 "Firefox" off
         8 "Firefox-esr" off
         9 "FreeFilesSync" off
         10 "Jmkvpropedit" off
         11 "Makemkv" off
         12 "Mkv Muxing Batch Gui" off
         13 "Mkvtoolnix" off
         14 "Putty" off
         15 "Qdirstat" off
         16 "Sharry" off
         17 "Tixati" off
         18 "Tsmuxer"
         19 "Video-Duplicate-Finder" off
         20 "Xfburn" off
         21 "Thunderbird" off
         22 "Go back" off
         4 "Exit" off)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
for choice in $choices
do
    case $choice in
        1)
            
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