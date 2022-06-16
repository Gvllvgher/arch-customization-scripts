#! /bin/bash

pacman -Sy sddm qt5-quickcontrols2 qt5-graphicaleffects --noconfirm > /dev/null

mkdir /etc/sddm.conf.d

cp /temp/arch-customization-scripts/sddm/theme.conf /etc/sddm.conf.d/
cp /temp/arch-customization-scripts/sddm/default.conf /usr/lib/sddm/sddm.conf.d/
cp -r /temp/arch-customization-scripts/sddm/archcraft /usr/share/sddm/themes/

systemctl enable sddm.service
