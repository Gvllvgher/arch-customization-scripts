#! /bin/bash

git clone https://aur.archlinux.org/yay-git.git /opt > /dev/null
chown -R justin:justin /opt/yay-git > /dev/null
cd /opt/yay-git
runuser -l justin 'makepkg -si' > /dev/null
runuser -l justin 'yay -Syu' > /dev/null
echo "installed and updated yay"