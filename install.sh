#!/bin/bash

#install stuff
what=typedate
what2=xdoTypedate
extension=
extension2=.sh
#peut être extension vide

echo "Rendre exécutable..."
chmod +x $what

#echo "lien symbolique vers usr bin"
#sudo ln -s "$PWD/$what$extension" /usr/bin/$what
echo "Directly copied to /usr/bin for maximum execution speed"
sudo cp "$PWD/$what$extension" /usr/bin/$what
sudo ln "$PWD/$what2$extension2" /usr/bin/$what2
