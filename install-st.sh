#! /bin/bash

su justin<<'EOF'
set -e
cd ~/.config
git clone https://github.com/siduck/st
cd st
sudo make install
exit
EOF
