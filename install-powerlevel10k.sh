#!/bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}";    )" &> /dev/null && pwd 2> /dev/null;    )";

cp $SCRIPT_DIR/zsh/.zshrc /home/justin/
chown justin:justin /home/justin/.zshrc

su justin<<EOF
set -e
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/justin/.oh-my-zsh/custom}/themes/powerlevel10k
exit
EOF
