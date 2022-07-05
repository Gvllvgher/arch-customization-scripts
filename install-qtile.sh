#!/usr/bin/env bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}";     )" &> /dev/null && pwd 2> /dev/null;     )";

# Install Dependencies
pacman -S xorg-server xorg-xinit xterm xfce4-terminal lightdm-gtk-greeter xfce4-power-manager picom

# Install Qtile and lightdm
pacman -S qtile lightdm

# Enable the lightdm service for autostart
sudo systemctl enable lightdm

# Copy default configuration
mkdir -p ~/.config/qtile
cp /usr/share/doc/qtile/default_config.py ~/.config/qtile/config.py
