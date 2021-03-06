#!/bin/bash
read -p "Start installation? (Y/N)? " -n 1 -r
echo
case "$REPLY" in 
  y|Y )
    tput setaf 4 ; tput bold ;echo "Starting..."; tput sgr0;
    tput setaf 4 ; tput bold ;echo "Deleting Previous Files"; tput sgr0;
    rm -r /home/xtreamcodes/iptv_xtream_codes/admin/* 2> /dev/null
    tput setaf 4 ; tput bold ;echo "Downloading Update"; tput sgr0;
    apt-get install unzip -y
    wget https://github.com/Nilbertocs/XtreamUI/archive/master.zip -O /tmp/update.zip -o /dev/null
    tput setaf 4 ; tput bold ;echo "Installing Update"; tput sgr0;
    unzip -qq /tmp/update.zip -d /tmp/update/
    mv /tmp/update/XtreamUI-master/* /home/xtreamcodes/iptv_xtream_codes/admin/
    tput setaf 4 ; tput bold ;echo "Deleting Temporary Files"; tput sgr0;
    rm /tmp/update.zip
    rm -r /tmp/update
    chmod -R 0777 /home/xtreamcodes/iptv_xtream_codes/admin
    chown -R xtreamcodes:xtreamcodes /home/xtreamcodes/iptv_xtream_codes/admin
    rm /home/xtreamcodes/iptv_xtream_codes/admin/README.md
    tput setaf 2 ; tput bold ;echo "Update Completed"; tput sgr0;;
n|N ) tput setaf 1 ; tput bold ;echo  "Stop Installation ..."; tput sgr0; ;;
* ) tput setaf 1 ; tput bold ; echo "Type only Y or N";tput sgr0; ;;
esac
rm update.sh
exit 0