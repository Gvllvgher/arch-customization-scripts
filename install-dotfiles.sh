#!/bin/bash

dotfilesUrl="https://github.com/Gvllvgher/dotfiles"

su $LOCAL_USER<<EOF
set -e
mkdir -p ~/git
cd ~/git
git clone ${dotfilesUrl} > /dev/null
/dotfiles/link.sh
EOF
