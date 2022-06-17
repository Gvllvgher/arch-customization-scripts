#!/bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}";     )" &> /dev/null && pwd 2> /dev/null;     )";

cp -r $SCRIPT_DIR/vim/.vim_runtime /home/justin
cp $SCRIPT_DIR/vim/.vimrc /home/justin/
chown -R justin:justin /home/justin/.vim_runtime
chown justin:justin /home/justin/.vimrc

pacman -Sy dash imlib2 xorg-xsetroot hsetroot libx11 libxft libxinerama feh rofi thunar xfce4-power-manager xorg-server xorg-xinit freetype2 light fontconfig pacman-contrib xterm alacritty geany dunst polybar mpd mpc maim xclip viewnior --noconfirm > /dev/null

su justin<<EOF
set -e
cd ~
yay -Sy ksuperkey betterlockscreen picom-ibhagwan-git xfce-polkit nerd-fonts-jetbrains-mono ttf-jetbrains-mono --noconfirm > /dev/null
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
cd ~/.config/archcraft-skeleton
./build.sh
cd ~/.config/archcraft-skeleton/archcraft-skeleton
makepkg -si --noconfirm > /dev/null
cd ~/.config/archcraft-dwm/archcraft-st
makepkg -si --noconfirm > /dev/null
cd ~/.config/archcraft-dwm/archcraft-dwm
makepkg -si --noconfirm > /dev/null
exit
EOF
