#!/bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}";    )" &> /dev/null && pwd 2> /dev/null;    )";


# Pacman
pacman -Sy firefox nm-connection-editor htop alacritty --noconfirm > /dev/null

# yay
su justin<<EOF
set -e
cd ~
yay -Sy networkmanager-dmenu-git vmware-workstation --noconfirm > /dev/null
exit
EOF

cp -rf $SCRIPT_DIR/networkmanager-dmenu /home/justin/.config/
cp -rf $SCRIPT_DIR/htop /home/justin/.config/
cp -rf $SCRIPT_DIR/alacritty /home/justin/.config/
chown -R justin:justin /home/justin/.config/networkmanager-dmenu
chown -R justin:justin /home/justin/.config/alacritty
chown -R justin:justin /home/justin/.config/htop
