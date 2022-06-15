#! /bin/bash

git clone https://aur.archlinux.org/yay-git.git /opt > /dev/null
chown -R ${USER}:${USER} /opt/yay-git > /dev/null
cd /opt/yay-git
makepkg -si > /dev/null
yay -Syu > /dev/null
echo "installed and updated yay"