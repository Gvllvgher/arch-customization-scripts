#! /bin/bash

echo "[multilib]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist"

git -C /opt clone https://aur.archlinux.org/yay-git.git > /dev/null
chown -R justin:justin /opt/yay-git > /dev/null

su justin<<'EOF'
set -e
cd /opt/yay-git
makepkg -si --noconfirm
exit
EOF

echo "installed and updated yay"