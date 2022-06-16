#! /bin/bash

pacman -Sy hsetroot alacritty thunar geany rofi polybar dunst mpd mpc maim xclip viewnior feh ksuperkey xfce-polkit xfce4-power-manager xorg-xsetroot

su justin<<EOF
yay -Sy picom-ibhagwan-git betterlockscreen
EOF


