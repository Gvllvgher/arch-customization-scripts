#!/bin/bash

# We need to 'su' the local user, so we ask for that here
while getopts ':u' opt; do
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

# Define apps that need to be installed with pacman
pacmanApps=( \
    "exa
    firefox
    flameshot
    starship
    alacritty
    thefuck
    python-pip
    htop
    nodejs
    thunar" \
)

# Define apps that need to be installed with yay
yayApps=( \
    "betterlockscreen" \
)

# Define any scripts that install custom apps
appScripts=( \
    "$SCRIPT_DIR/apps/install-zsh.sh" \
    "$SCIPT_DIR/apps/install-yay.sh " \
)

# Setting current script directory
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}";     )" &> /dev/null && pwd 2> /dev/null;     )";

# Install pacman apps
pacman -S ${pacmanApps} --noconfirm > /dev/null

# Install yay apps
su $LOCAL_USER << EOF
set -e
yay -S ${yayApps} --noconfirm > /dev/null
exit
EOF

# Excute any custom app scripts
#for script in ${appScripts[@]}; do
#    chmod +x $script
#    $script
#done
