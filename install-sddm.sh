#! /bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}";   )" &> /dev/null && pwd 2> /dev/null;   )";

pacman -Sy sddm qt5-quickcontrols2 qt5-graphicaleffects --noconfirm > /dev/null

mkdir /etc/sddm.conf.d

cp $SCRIPT_DIR/sddm/theme.conf /etc/sddm.conf.d/
cp $SCRIPT_DIR/sddm/default.conf /usr/lib/sddm/sddm.conf.d/
cp -r $SCRIPT_DIR/sddm/archcraft /usr/share/sddm/themes/

systemctl enable sddm.service
