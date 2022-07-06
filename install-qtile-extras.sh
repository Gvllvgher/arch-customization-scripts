#!/bin/bash

pacman -S papirus-icon-theme arc-gtk-theme --noconfirm > /dev/null

xfconf-query -c xsettings -p /Net/IconThemeName -s 'Papirus-Dark'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'

xfconf-query -c xsettings -p /Net/ThemeName -s 'Arc-Dark'

