#! /bin/bash

pacman -S libx11 libxft libxinerama xorg-server xorg-xinit freetype2 fontconfig terminus-font

mkdir -p /usr/share/xsessions

cp /temp/arch-customization-scripts/dwm/dwm.desktop /usr/share/xsessions/

su justin<<EOF
mkdir -p ~/.local/src

git clone git://git.suckless.org/st ~/.local/src/st
git clone git://git.suckless.org/dmenu ~/.local/src/dmenu
git clone git://git.suckless.org/dwm ~/.local/src/dwm

cd ~/.local/src/st
make clean
sudo make install

cd ~/.local/src/dmenu
make clean
sudo make install

cd ~/.local/src/dwm
make clean
sudo make install

echo "exec dwm" >> ~/.xinitrc
EOF
