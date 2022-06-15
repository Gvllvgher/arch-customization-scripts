#! /bin/bash

pacman -Sy zsh --noconfirm
chsh -s $(which zsh) justin

tee -a /home/justin/.zprofile <<EOF
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
EOF

tee -a /home/justin/.bash_profile <<EOF
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
EOF

su justin<<'EOF'
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
exit
EOF