#! /bin/bash

pacman -Sy xorg-server xorg-xinit xterm awesome xorg-xclock firefox xfce4-taskmanager xfce4-power-manager xfce4-settings scrot pcmanfm kitty nitrogen picom file-roller volumeicon dmenu numlockx --noconfirm > /dev/null
echo “exec awesome” > /home/justin/.xinitrc
chown justin:justin /home/justin/.xinitrc

mkdir /home/justin/.config  > /dev/null
mkdir /home/justin/.config/awesome  > /dev/null
git -C /temp clone --recurse-submodules --remote-submodules --depth 1 -j 2 https://github.com/lcpz/awesome-copycats.git
mv -bv /temp/awesome-copycats/{*,.[^.]*} /home/justin/.config/awesome; rm -rf /temp/awesome-copycats

cp /temp/arch-customization-scripts/rc.lua /home/justin/.config/awesome/rc.lua

chown -R justin:justin /home/justin/.config/awesome > /dev/null
chown -R justin:justin /home/justin/.config > /dev/null

su justin<<'EOF'
set -e
yay -Sy lain-git ttf-google-fonts-git --noconfirm
exit
EOF

echo "installed awesomewm"