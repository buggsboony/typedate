#!/bin/bash
BYELL='\033[1;33m'
RED='\033[38;5;1m'
BLUE='\033[38;5;4m'
GRAY='\033[38;5;8m'

ORAN='\033[0;33m'
NC='\033[0m'

#install stuff
what=${PWD##*/}
what2=xdoTypedate
service_basename=ydotool
extension=
#peut être extension vide 
 
echo "killing running instances"
killall $what

echo "Removing installed files from usr/bin"
sudo rm -f /usr/bin/$what
sudo rm -f /usr/bin/$what2

echo -e "${ORAN}Removing file '$service_basename.service'..."
sudo rm -f "/etc/systemd/system/$service_basename.service"

echo -e "${ORAN}ydotool will not be removed. Please proceed manually if you will with: ${NC}"
echo -e "${BLUE}sudo pacman -R ydotool${NC}\n"


#Clear environement socket var :
#Retirer cette ligne dans ~/.profile ou ~/.bashrc :
#export YDOTOOL_SOCKET=/tmp/.ydotool_socket

echo "Done."


