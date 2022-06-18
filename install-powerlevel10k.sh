#!/bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}";    )" &> /dev/null && pwd 2> /dev/null;    )";

cp $SCRIPT_DIR/zsh/.zshrc /home/justin/
cp $SCRIPT_DIR/zsh/.p10k.zsh /home/justin
chown justin:justin /home/justin/.zshrc
chown justin:justin /home/justin/.p10k.zsh

su justin<<EOF
set -e
mkdir -p ~/.oh-my-zsh/custom/themes
mkdir -p ~/.oh-my-zsh/custom/plugins
cd ~/.oh-my-zsh/custom/themes
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
exit
EOF
