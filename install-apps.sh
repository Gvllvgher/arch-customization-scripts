#!/bin/bash

pacmanApps=( \
    "exa
    firefox
    flameshot
    starship
    alacritty
    thefuck" \
)

yayApps=( \
    "betterlockscreen" \
)

appScripts=( \
    "$SCRIPT_DIR/apps/install-zsh.sh" \
    "$SCIPT_DIR/apps/install-yay.sh " \
)

pacman -S ${pacmanApps} --noconfirm > /dev/null

su $LOCAL_USER << EOF
set -e
yay -S ${yayApps} --noconfirm > /dev/null
exit
EOF

for script in ${appScripts[@]}; do
    chmod +x $script
    $script
done
