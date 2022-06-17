#! /bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}";   )" &> /dev/null && pwd 2> /dev/null;   )";

pacman -Sy dash imlib2 xorg-xsetroot hsetroot doas libx11 libxft libxinerama feh rofi thunar xfce4-power-manager xorg-server xorg-xinit freetype2 fontconfig pacman-contrib xterm --noconfirm > /dev/null

echo "permit :wheel" > doas.conf

su justin<<'EOF'
set -e
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/Templarian/MaterialDesign-Font/raw/master/MaterialDesignIconsDesktop.ttf
fc-cache -f -v
mkdir -p ~/Pictures/wall
cd ~/Pictures/wall
wget https://github.com/siduck/chadwm/raw/screenshots/screenshots/chad.png
yay -Sy nerd-fonts-jetbrains-mono ttf-jetbrains-mono picom-ibhagwan-git --noconfirm > /dev/null
git clone https://github.com/Gvllvgher/chadwm --depth 1  ~/.config/chadwm
mv ~/.config/chadwm/eww ~/.config/
cd ~/.config/chadwm/chadwm
sudo make install
exit
EOF

echo "installed chadwm"

mkdir -p /usr/share/xsessions
cp $SCRIPT_DIR/chadwm/chadwm.desktop /usr/share/xsessions/
