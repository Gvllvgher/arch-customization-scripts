#! /bin/bash

pacman -Sy sddm --noconfirm

mkdir /etc/sddm.conf.d

cp /temp/arch-customization-scripts/sddm/theme.conf /etc/sddm.conf.d/
cp /temp/arch-customization-scripts/sddm/default.conf /usr/lib/sddm/sddm.conf.f/
cp -r /temp/arch-customization-scripts/sddm/archcraft /usr/share/sddm/themes/

systemctl enable sddm.service
