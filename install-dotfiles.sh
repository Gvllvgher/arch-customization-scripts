#!/bin/bash

dotfilesUrl="https://github.com/Gvllvgher/dotfiles"

su $LOCAL_USER<<EOF
set -e
mkdir -p /home/$LOCAL_USER/git
git -c /home/$LOCAL_USER/git clone ${dotfilesUrl} > /dev/null
/home/$LOCAL_USER/dotfiles/link.sh
EOF
