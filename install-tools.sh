#!/bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}";    )" &> /dev/null && pwd 2> /dev/null;    )";

# Pacman
pacman -Sy firefox --noconfirm > /dev/null

# yay
su justin<<EOF
set -e
cd ~
yay -Sy networkmanager-dmenu-git --noconfirm > /dev/null
exit
EOF

cp -rf $SCRIPT_DIR/networkmanager-dmenu /home/justin/.config/
chown -R justin:justin /home/justin/.config/networkmanager-dmenu
