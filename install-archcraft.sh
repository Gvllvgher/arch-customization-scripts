#!/bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}";     )" &> /dev/null && pwd 2> /dev/null;     )";

cp -r $SCRIPT_DIR/vim/.vim_runtime /home/justin
cp $SCRIPT_DIR/vim/.vimrc /home/justin/
chown -R justin:justin /home/justin/.vim_runtime
chown justin:justin /home/justin/.vimrc

pacman -Sy dash imlib2 xorg-xsetroot hsetroot libx11 libxft libxinerama feh rofi thunar xfce4-power-manager xorg-server xorg-xinit freetype2 light fontconfig pacman-contrib xterm --noconfirm > /dev/null

su justin<<EOF
set-e
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/Templarian/MaterialDesign-Font/raw/master/MaterialDesignIconsDesktop.ttf
fc-cache -f -v
exit
EOF

mkdir -p /home/justin/.config
cd /home/justin/.config
git clone https://github.com/archcraft-os/archcraft-skeleton
git clone https://github.com/archcraft-os/archcraft-dwm

chown -R justin:justin /home/justin/.config

su justin<<EOF
set -e
~/.config/archcraft-skeleton/build.sh
~/.config/archcraft-dwm/build.sh
exit
EOF
