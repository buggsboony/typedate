#!/bin/bash
# console colors 2021-10-03 11:04:37

# New Console Colors
BYELL='\033[1;33m'
RED='\033[38;5;1m'
BLUE='\033[38;5;4m'
GRAY='\033[38;5;8m'

BRED='\033[1;31m'
MAG='\033[0;35m'
BMAG='\033[1;35m'
VIOLET='\033[38;5;5m'
TURQUOISE='\033[38;5;37m'
VFLUO='\033[38;5;40m'
GOLD='\033[38;5;100m'
LGREEN='\033[38;5;6m'
GREEN='\033[0;32m'
BGREEN='\033[1;32m'

ORAN='\033[0;33m'
NC='\033[0m'


#install stuff
what=typedate
extension=.sh
service_basename=ydotool
#peut être extension vide


echo "Setting executable rights"
chmod +x $what

#echo "lien symbolique vers usr bin"
#sudo ln -s "$PWD/$what$extension" /usr/bin/$what
echo "Directly copied to /usr/bin for maximum execution speed"
sudo cp "$PWD/$what$extension" /usr/bin/$what


echo -e "${ORAN}Installing ydotool (supports both Wayland and X11)...?${NC}\n"
sudo pacman -S ydotool


echo -e "${ORAN}Deploy $service_basename.service...?${NC}\n"
sudo cp "$service_basename.service" "/etc/systemd/system/$service_basename.service"


echo -e "${BLUE}Enable and start ydotool socket service.."
sudo systemctl daemon-reload
sudo systemctl enable ydotool.service
sudo systemctl start ydotool.service

#Export Socket path :
#Configurez l'environnement pour que ydotool utilise le bon socket : 
#Ajoutez cette ligne dans ~/.profile ou ~/.bashrc :
#export YDOTOOL_SOCKET=/tmp/.ydotool_socket

echo -e  "${ORAN}Installing ydotool-rebind for AZERTY layout...${NC}\n"

git clone https://github.com/david-vct/ydotool-rebind.git 
cd ydotool-rebind
sudo ./install.sh

echo "Done."