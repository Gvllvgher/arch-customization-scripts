#! /bin/bash
pacman -Sy dash imlib2 xorg-xsetroot hsetroot > /dev/null

su justin<<EOF
yay -Sy nerd-fonts-jetbrains-mono ttf-jetbrains-mono ttf-material-design-icons > /dev/null
git clone https://github.com/siduck/chadwm --depth 1  ~/.config
cd ~/.config/chadwm/chadwm
mv eww ~/.config
sudo make install
exit
EOF

mkdir -p /usr/share/xsessions
cp /temp/arch-customization-scripts/chadwm/chadwm.desktop /usr/share/xsessions/
