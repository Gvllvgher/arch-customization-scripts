#!/usr/bin/env bash

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
pacman -S xorg-server xorg-xinit xterm xfce4-terminal lightdm-gtk-greeter xfce4-power-manager picom

# Install Qtile and lightdm
pacman -S qtile lightdm

# Enable the lightdm service for autostart
systemctl enable lightdm

# Copy default configuration
mkdir -p /home/$LOCAL_USER/.config/qtile
cp /usr/share/doc/qtile/default_config.py /home/$LOCAL_USER/.config/qtile/config.py
chown -R $LOCAL_USER:$LOCAL_USER /home/$LOCAL_USER/.config
