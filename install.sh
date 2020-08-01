#!/bin/bash

#install stuff
what=typedate
extension=
#peut être extension vide

echo "Rendre exécutable..."
chmod +x $what
echo "lien symbolique vers usr bin"
sudo ln -s "$PWD/$what$extension" /usr/bin/$what
