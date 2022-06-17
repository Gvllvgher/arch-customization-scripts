#! /bin/bash
pacman -Sy dash imlib2 xorg-xsetroot hsetroot doas libx11 libxft libxinerama feh rofi thunar xfce4-power-manager xorg-server xorg-xinit freetype2 fontconfig pacman-contrib xterm --noconfirm > /dev/null

echo "permit :wheel" >> doas.conf

su justin<<EOF
set -e
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -O https://github.com/Templarian/MaterialDesign-Font/raw/master/MaterialDesignIconsDesktop.ttf
fc-cache -f -v
yay -Sy nerd-fonts-jetbrains-mono ttf-jetbrains-mono ttf-material-design-icons picom-ibhagwan-git --noconfirm > /dev/null
git clone https://github.com/siduck/chadwm --depth 1  ~/.config/chadwm
mv ~/.config/chadwm/eww ~/.config/
cd ~/.config/chadwm/chadwm
sudo make install
exit
EOF

echo "installed chadwm"

mkdir -p /usr/share/xsessions
cp /temp/arch-customization-scripts/chadwm/chadwm.desktop /usr/share/xsessions/
