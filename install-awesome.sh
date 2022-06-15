#! /bin/bash

pacman -Sy xorg-server xorg-xinit xterm awesome firefox xfce4-taskmanager xfce4-power-manager xfce4-settings scrot pcmanfm kitty nitrogen picom file-roller dmenu --noconfirm > /dev/null
echo “exec awesome” > ~/.xinitrc

mkdir /home/justin/.config  > /dev/null
mkdir /home/justin/.config/awesome  > /dev/null
git -C /temp clone --recurse-submodules --remote-submodules --depth 1 -j 2 https://github.com/lcpz/awesome-copycats.git
mv -bv /temp/awesome-copycats/{*,.[^.]*} /home/justin/.config/awesome; rm -rf /temp/awesome-copycats
cp /home/justin/.config/awesome/rc.lua.template /home/justin/.config/awesome/rc.lua

yay -Sy lain-git