#!/bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}";    )" &> /dev/null && pwd 2> /dev/null;    )";

su justin<<'EOF'
set -e
cp -r $SCRIPT_DIR/vim/.vim_runtime ~/
cp $SCRIPT_DIR/vim/.vimrc ~/
exit
EOF
