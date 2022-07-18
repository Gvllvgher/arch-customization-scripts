#!/bin/bash

# We need to 'su' the local user, so we ask for that here
while getopts ':u:' opt; do
    case $opt in
        u)
            LOCAL_USER=${OPTARG}
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
    echo "Use -u to define a user"
    exit 1
fi

# Define apps that need to be installed with pacman
pacmanApps=( \
    "exa
    firefox
    flameshot
    starship
    alacritty
    thefuck
    python-pip
    python-pillow
    htop
    nodejs
    thunar
    neofetch
    kitty
    bluez
    bluez-utils
    chromium
    vim
    net-tools
    man
    ufw
    neovim
    pulseaudio
    pulseaudio-bluetooth
    pavucontrol
    cups
    cups-pdf
    nss-mdns
    avahi
    ranger" \
)

# Define apps that need to be installed with yay
yayApps=( \
    "betterlockscreen" \
    "vtop" \
    "chromium-extension-ublock-origin" \
    "chromium-extension-dark-reader-git" \
    "chromium-extension-clearurls" \
    "bitwarden-chromium" \
    "firefox-extension-bitwarden" \
    "firefox-clearurls" \
)

# Setting current script directory
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}";     )" &> /dev/null && pwd 2> /dev/null;     )";

# Define any scripts that install custom apps
appScripts=( \
    "$SCRIPT_DIR/apps/install-zsh.sh" \
)

# Install pacman apps
pacman -S ${pacmanApps} --noconfirm &> /dev/null

# Install yay
"$SCRIPT_DIR/apps/install-yay.sh" -u justin

# Install yay apps
su $LOCAL_USER<<EOF
set -e
yay -S ${yayApps} --noconfirm &> /dev/null
yay -S onlyoffice-bin --noconfirm &> /dev/null
exit
EOF

# Excute any custom app scripts
for script in ${appScripts[@]}; do
    chmod +x $script
    $script -u justin
done

##################### App Customizations ########################
# Section should only be used for very minor customizations
# Example: enabling/starting services

# Enable betterlockscreen
systemctl enable betterlockscreen@$LOCAL_USER > /dev/null

# Enable bluetooth and load the btusb module
modprobe btusb &> /dev/null
systemctl enable bluetooth > /dev/null

# UFW enable and enable
systemctl enable ufw &> /dev/null
ufw enable &> /dev/null

# Printing
# Enable CUPS
systemctl enable cups
# Modify /etc/nsswitch.conf to enable hostname resolution
sed -i 's/mymachines resolve/mymachines mdns_minimal [NOTFOUND=return] resolve/g' /etc/nsswitch.conf
# Enable Avahi Daemon
systemctl enable avahi-daemon.service
