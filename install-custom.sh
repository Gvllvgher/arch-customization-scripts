#!/bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}";  )" &> /dev/null && pwd 2> /dev/null;  )";

echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Set permissions
chmod +x $SCRIPT_DIR/*.sh > /dev/null
chmod +777 $SCRIPT_DIR/*.sh > /dev/null

# Execute install-sddm.sh
$SCRIPT_DIR/install-sddm.sh
$SCRIPT_DIR/install-st.sh
$SCRIPT_DIR/install-chadwm.sh

head -n -1 /etc/sudoers > /etc/sudoers.bak
vm /etc/sudoers.bak /etc/sudoers
