#!/bin/bash
# console colors 2021-10-03 11:04:37
GREEN='\033[0;32m'   #printf "${LRED}File not found :'${1}'${NC}\n"
LGREEN='\033[1;32m'  #printf " Set executable rights for : ${YELL}\"$realpath\" ${NC}\n"
WHITE='\033[1;37m'
YELL='\033[1;33m'
RED='\033[0;31m'
LRED='\033[1;31m'
MAG='\033[0;35m'
LMAG='\033[1;35m'
CYAN='\033[0;36m'
LCYAN='\033[1;36m'
NC='\033[0m' # No Color



#install stuff
what=typedate
extension=.sh
#peut être extension vide


echo "Setting executable rights"
chmod +x $what

#echo "lien symbolique vers usr bin"
#sudo ln -s "$PWD/$what$extension" /usr/bin/$what
echo "Directly copied to /usr/bin for maximum execution speed"
sudo cp "$PWD/$what$extension" /usr/bin/$what


printf "${YELL}Installing ydotool (supports both Wayland and X11)...?${NC}\n"
sudo pacman -S ydotool


printf "${YELL}Installing ydotool-rebind for AZERTY layout...${NC}\n"

git clone https://github.com/david-vct/ydotool-rebind.git 
cd ydotool-rebind
sudo ./install.sh

echo "OK finished !"