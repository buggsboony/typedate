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


echo -e "${RED}Ceci est du texte en rouge${NC}"

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

echo "Done."