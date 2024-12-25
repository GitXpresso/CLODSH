#!/bin/bash

BBlack='\033[1;30m'       # Black
BYellow='\033[1;33m'      # Yellow

cd ~/
echo -e "${BBlack}git cloning jlesage/docker-avidemux"
git clone https://github.com/jlesage/docker-avidemux.git
cd docker-avidemux 
echo -e "${BBLACK}moving all contents of Avidemux to clodsh/Jlesage/Avidemux"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Avidemux
echo -e "${BBLACK}removing the empty directory "docker-avidemux""
sudo rm -rf ~/docker-avidemux
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-czkawka"
git clone https://github.com/jlesage/docker-czkawka.git
cd docker-czkawka
echo -e "${BBLACK}moving all contents of Czkawka to clodsh/Jlesage/Czkawka"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Czkawka
echo -e "${BBLACK}removing the empty directory "docker-czkawka""
sudo rm -rf ~/docker-czkawka
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-filebot"
git clone https://github.com/jlesage/docker-filebot.git
cd docker-filebot
echo -e "${BBLACK}moving all contents of Filebot to clodsh/Jlesage/Filebot"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Filebot
echo -e "${BBLACK}removing the empty directory "docker-filebot""
sudo rm -rf ~/docker-filebot
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-handbrake"
git clone https://github.com/jlesage/docker-handbrake.git
cd docker-handbrake
echo -e "${BBLACK}moving all contents of Handbrake to clodsh/Jlesage/Handbrake"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Handbrake
echo -e "${BBLACK}removing the empty directory "docker-handbrake""
sudo rm -rf ~/docker-handbrake
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-jdownloader-2"
git clone https://github.com/jlesage/docker-jdownloader-2.git
cd docker-jdownloader-2
echo -e "${BBLACK}moving all contents of Jdownloader-2 to clodsh/Jlesage/Jdownloader-2"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Jdownloader-2
echo -e "${BBLACK}removing the empty directory "docker-jdownloader-2""
sudo rm -rf ~/docker-jdownloader-2
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-mediainfo"
git clone https://github.com/jlesage/docker-mediainfo.git
echo -e "${BBLACK}creating a new directory called "Mediainfo" in clodsh/Jlesage"
mkdir /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Mediainfo
cd docker-mediainfo
echo -e "${BBLACK}moving all contents of Mediainfo to clodsh/Jlesage/Mediainfo"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Mediainfo
echo -e "${BBLACK}removing the empty directory "docker-mediainfo""
sudo rm -rf ~/docker-mediainfo
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-mkvtoolnix"
git clone https://github.com/jlesage/docker-mkvtoolnix.git
cd docker-mkvtoolnix
echo -e "${BBLACK}creating a new directory called "Mkvtoolnix" in clodsh/Jlesage/Mkvtoolnix"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Mkvtoolnix
echo -e "${BBLACK}removing the empty directory "docker-mkvtoolnix""
sudo rm -rf ~/docker-mkvtoolnix
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-mkvpropedit"
git clone https://github.com/jlesage/docker-cloudberry-backup.git
echo -e "${BBLACK}creating a new directory called "Cloudberry-backup" in clodsh/Jlesage"
mkdir /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Cloudberry-backup
cd docker-cloudberry-backup
echo -e "${BBLACK}moving the contents of the "docker-cloudberry-backup" directory in clodsh/Jlesage/Cloudberry-backup"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Cloudberry-backup
echo -e "${BBLACK}removing the empty directory "docker-cloudberry-backup""
sudo rm -rf ~/docker-cloudberry-backup
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-mkvcleaver"
git clone https://github.com/jlesage/docker-mkvcleaver.git
echo -e "${BBLACK}creating a new directory called "Mkvcleaver" in clodsh/Jlesage"
mkdir /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Mkvcleaver
cd docker-mkvcleaver
echo -e "${BBLACK}moving the contents of the "docker-mkvcleaver" directory in clodsh/Jlesage/Mkvcleaver"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Mkvcleaver
echo -e "${BBLACK}removing the empty directory "docker-mkvcleaver""
sudo rm -rf ~/docker-mkvcleaver
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-nginx-proxy-manager"
git clone https://github.com/jlesage/docker-nginx-proxy-manager.git
echo -e "${BBLACK}creating a new directory called "Nginx-proxy-manager" in clodsh/Jlesage"
mkdir /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Nginx-proxy-manager
cd docker-nginx-proxy-manager
echo -e "${BBLACK}moving the contents of the "docker-nginx-proxy-manager" directory in clodsh/Jlesage/Nginx-proxy-manager"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Nginx-proxy-manager
echo -e "${BBLACK}removing the empty directory "docker-nginx-proxy-manager""
sudo rm -rf ~/docker-nginx-proxy-manager
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-dupeguru"
git clone https://github.com/jlesage/docker-dupeguru.git
echo -e "${BBLACK}creating a new directory called "Dupeguru" in clodsh/Jlesage"
mkdir /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Dupeguru
cd docker-dupeguru
echo -e "${BBLACK}moving the contents of the "docker-dupeguru" directory in clodsh/Jlesage/Dupeguru"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Dupeguru
echo -e "removing the empty directory "docker-dupeguru""
sudo rm -rf ~/docker-dupeguru
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-crashplan-pro"
git clone https://github.com/jlesage/docker-crashplan-pro.git
echo -e "${BBLACK}creating a new directory called "Crashplan-pro" in clodsh/Jlesage"
mkdir /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Crashplan-pro
cd docker-crashplan-pro
echo -e "${BBLACK}moving the contents of the "docker-crashplan-pro" directory in clodsh/Jlesage/Crashplan-pro"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Crashplan-pro
echo -e "${BBLACK}removing the empty directory "docker-crashplan-pro""
sudo rm -rf ~/docker-crashplan-pro
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-crashplan-enterprise"
git clone https://github.com/jlesage/docker-crashplan-enterprise.git
echo -e "${BBLACK}creating a new directory called "Crashplan-enterprise" in clodsh/Jlesage"
mkdir /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Crashplan-enterprise
cd docker-crashplan-enterprise
echo -e "${BBLACK}moving the contents of the "docker-crashplan-enterprise" directory in clodsh/Jlesage/Crashplan-enterprise"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Crashplan-enterprise
echo -e "${BBLACK}removing the empty directory "docker-crashplan-enterprise""
sudo rm -rf ~/docker-crashplan-enterprise
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-thunderbird"
git clone https://github.com/jlesage/docker-thunderbird.git
cd docker-thunderbird
echo -e "${BBLACK}moving the contents of the "docker-thunderbird" directory in clodsh/Jlesage/Thunderbird"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Thunderbird
echo -e "${BBLACK}removing the empty directory "docker-thunderbird""
sudo rm -rf ~/docker-thunderbird
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-filezilla"
git clone https://github.com/jlesage/docker-filezilla.git
cd docker-filezilla
echo -e "${BBLACK}moving the contents of the "docker-filezilla" directory in clodsh/Jlesage/Filezilla"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Filezilla
echo -e "${BBLACK}removing the empty directory "docker-filezilla""
sudo rm -rf ~/docker-filezilla
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-putty"
git clone https://github.com/jlesage/docker-putty.git
cd docker-putty
echo -e "${BBLACK}moving the contents of the "docker-putty" directory in clodsh/Jlesage/Putty"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Putty
echo -e "${BBLACK}removing the empty directory "docker-putty""
sudo rm -f ~/docker-putty
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-tsmuxer"
git clone https://github.com/jlesage/docker-tsmuxer.git
cd docker-tsmuxer
echo -e "${BBLACK}moving the contents of the "docker-tsmuxer" directory in clodsh/Jlesage/Tsmuxer"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Tsmuxer
echo -e "removing the empty directory "docker-tsmuxer""
sudo rm -rf ~/docker-tsmuxer
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-firefox-esr"
git clone https://github.com/jlesage/docker-firefox-esr.git
cd docker-firefox-esr
echo -e "${BBLACK}moving the contents of the "docker-firefox-esr" directory in clodsh/Jlesage/Firefox"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Firefox-ESR
echo -e "${BBLACK}removing the empty directory "docker-firefox-esr""
sudo rm -rf ~/docker-firefox-esr
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-freefilesync"
git clone https://github.com/jlesage/docker-freefilesync.git
cd docker-freefilesync
echo -e "${BBLACK}moving the contents of the "docker-freefilesync" directory in clodsh/Jlesage/Freefilesync"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/FreeFileSync
echo -e "${BBLACK}removing the empty directory "docker-freefilesync""
sudo rm -rf ~/docker-freefilesync
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-qdirstat"
git clone https://github.com/jlesage/docker-qdirstat.git
cd docker-qdirstat
echo -e "${BBLACK}moving the contents of the "docker-qdirstat" directory in clodsh/Jlesage/Qdirstat"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Qdirstat
echo -e "${BBLACK}removing the empty directory "docker-qdirstat""
sudo rm -rf ~/docker-qdirstat
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-sharry"
git clone https://github.com/jlesage/docker-sharry.git
cd docker-sharry
echo -e "${BBLACK}moving the contents of the "docker-sharry" directory in clodsh/Jlesage/Sharry"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Sharry
echo -e "${BBLACK}removing the empty directory "docker-sharry""
sudo rm -rf ~/docker-sharry
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-tixati"
git clone https://github.com/jlesage/docker-tixati.git
cd docker-tixati
echo -e "${BBLACK}moving the contents of the "docker-tixati" directory in clodsh/Jlesage/Tixati"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Tixati
echo -e "${BBLACK}removing the empty directory "docker-tixati""
sudo rm -rf ~/docker-tixati
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-video-duplicate-finder"
git clone https://github.com/jlesage/docker-video-duplicate-finder.git
cd docker-video-duplicate-finder
echo -e "${BBLACK}moving the contents of the "docker-video-duplicate-finder" directory in clodsh/Jlesage/Video-duplicate-finder"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Video-duplicate-finder
echo -e "${BBLACK}removing the empty directory "docker-video-duplicate-finder""
sudo rm -rf ~/docker-video-duplicate-finder
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-xfburn"
git clone https://github.com/jlesage/docker-xfburn.git
cd docker-xfburn
echo -e "${BBLACK}moving the contents of the "docker-xfburn" directory in clodsh/Jlesage/Xfburn"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Xfburn
echo -e "${BBLACK}removing the empty directory "docker-xfburn""
sudo rm -rf ~/docker-xfburn
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-jmkvpropedit"
git clone https://github.com/jlesage/docker-jmkvpropedit.git
cd docker-jmkvpropedit
echo -e "${BBLACK}moving the contents of the "docker-jmkvpropedit" directory in clodsh/Jlesage/Jmkvpropedit"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Jmkvpropedit
echo -e "${BBLACK}removing the empty directory "docker-jmkvpropedit""
sudo rm -rf ~/docker-jmkvpropedit
cd ~/
echo -e "${BBLACK}git cloning jlesage/firefox"
git clone https://github.com/jlesage/firefox.git
cd firefox
echo -e "${BBLACK}moving the contents of the "firefox" directory in clodsh/Jlesage/Firefox"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Firefox
echo -e "${BBLACK}removing the empty directory "firefox""
sudo rm -rf ~/firefox
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-makemkv"
git clone https://github.com/jlesage/docker-makemkv.git
cd docker-makemkv
echo -e "${BBLACK}moving contents of docker-makemkv to /workspaces/ubuntu-vnc-xfce/clodsh/jlesage/Makemkv"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Makemkv
sudo rm -rf ~/docker-makemkv
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-mkv-muxing-batch-gui"
git clone https://github.com/jlesage/docker-mkv-muxing-batch-gui.git
cd docker-mkv-muxing-batch-gui
echo -e "${BBLACK}moving the contents of the "docker-mkv-muxing-batch-gui" directory in clodsh/Jlesage/Mkv-Muxing-Batch-Gui"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Mkv-Muxing-Batch-Gui
echo -e "${BBLACK}removing the empty directory "docker-mkv-muxing-batch-gui""
sudo rm -rf ~/docker-mkv-muxing-batch-gui
cd ~/
echo -e "${BBLACK}git cloning jlesage/docker-mkvcleaver"
git clone https://github.com/jlesage/docker-mkvcleaver.git
cd docker-mkvcleaver
echo -e "${BBLACK}moving the contents of the "docker-mkvcleaver" directory in clodsh/Jlesage/Docker-mkvcleaver"
sudo mv -f * /workspaces/ubuntu-vnc-xfce/clodsh/Jlesage/Docker-mkvcleaver
echo -e "${BBLACK}removing the empty directory "docker-mkvcleaver""
sudo rm -rf ~/docker-mkvcleaver
cd ~/
echo "${BYELLOW}finished"
