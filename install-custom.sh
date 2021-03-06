#!/bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}";  )" &> /dev/null && pwd 2> /dev/null;  )";

echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Set permissions
chmod +x $SCRIPT_DIR/*.sh > /dev/null
chmod +777 $SCRIPT_DIR/*.sh > /dev/null

# Execute install-sddm.sh
$SCRIPT_DIR/install-sddm.sh
$SCRIPT_DIR/install-archcraft.sh
$SCRIPT_DIR/install-powerlevel10k.sh
$SCRIPT_DIR/install-backgrounds.sh
$SCRIPT_DIR/install-tools.sh
$SCRIPT_DIR/configure-git.sh
#$SCRIPT_DIR/install-st.sh
#$SCRIPT_DIR/configure-vim.sh

head -n -1 /etc/sudoers > /etc/sudoers.bak
mv /etc/sudoers.bak /etc/sudoers
