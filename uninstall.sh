#!/bin/bash

#install stuff
what=${PWD##*/}
what2=xdoTypedate
extension=
#peut être extension vide 
 
echo "killing running instances"
killall $what

echo "Removing installed files from usr/bin"
sudo rm -f /usr/bin/$what
sudo rm -f /usr/bin/$what2

printf "${LRED}ydotool will not be removed. Please proceed manually if you will with: ${NC}\n"
echo "sudo pacman -R ydotool"

echo "Done."


