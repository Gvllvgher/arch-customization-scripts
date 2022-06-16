#! /bin/bash
pacman -Sy dash imlib2 xorg-xsetroot hsetroot libx11 libxft libxinerama xorg-server xorg-xinit freetype2 fontconfig --noconfirm > /dev/null

su justin<<EOF
yay -Sy nerd-fonts-jetbrains-mono ttf-jetbrains-mono ttf-material-design-icons --noconfirm > /dev/null
git clone https://github.com/siduck/chadwm --depth 1  ~/.config/chadwm
cd ~/.config/chadwm/chadwm
mv ~/.config/chadwm/eww ~/.config/
sudo make install
exit
EOF

echo "installed chadwm"

mkdir -p /usr/share/xsessions
cp /temp/arch-customization-scripts/chadwm/chadwm.desktop /usr/share/xsessions/
