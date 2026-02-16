#!/bin/bash

#install stuff
what=${PWD##*/}
what2=xdoTypedate
extension=
#peut être extension vide 
 
echo "killing running instances"
killall $what

echo "remove from usr bin"
sudo rm /usr/bin/$what
sudo rm /usr/bin/$what2

echo "done."


