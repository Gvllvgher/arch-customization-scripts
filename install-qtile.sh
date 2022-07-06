#! /bin/bash

# Parameters
while getopts ':u:' opt; do
    case $opt in
        u)
            LOCAL_USER=${OPTARG}
            echo "install-qtile.sh: LOCAL_USER set to: ${OPTARG}"
            ;;
        \?)
            echo "Invalid option: -$OPTARG"
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument."
            exit 1
            ;;
    esac
done

if [[ -z "$LOCAL_USER" ]]; then
    echo "install-qtile.sh: Use paramter -u to specify a username."
    exit 1
fi

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}";     )" &> /dev/null && pwd 2> /dev/null;     )";

# Install Dependencies
pacman -S xorg-server xorg-xinit xterm xfce4-terminal lightdm-gtk-greeter xfce4-power-manager xorg-mkfontscale picom nodejs feh papirus-icon-theme arc-gtk-theme --noconfirm > /dev/null

# Install Fonts
pacman -S ttf-dejavu ttf-liberation ttf-bitstream-vera cantarell-fonts noto-fonts opendesktop-fonts ttf-opensans ttf-croscore ttf-carlito ttf-caladea ttf-jetbrains-mono --noconfirm > /dev/null

# Install Qtile and lightdm
pacman -S qtile lightdm --noconfirm > /dev/null

# Enable the lightdm service for autostart
systemctl enable lightdm > /dev/null

su $LOCAL_USER<<'EOF'
set -e
yay -S nerd-fonts-jetbrains-mono --noconfir > /dev/null
exit
EOF

# Copy default configuration
mkdir -p /home/$LOCAL_USER/.config/qtile
cp /usr/share/doc/qtile/default_config.py /home/$LOCAL_USER/.config/qtile/config.py
chown -R $LOCAL_USER:$LOCAL_USER /home/$LOCAL_USER/.config
