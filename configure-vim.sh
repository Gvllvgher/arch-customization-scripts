#!/bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}";    )" &> /dev/null && pwd 2> /dev/null;    )";

cp -r $SCRIPT_DIR/vim/.vim_runtime /home/justin/
cp $SCRIPT_DIR/vim/.vimrc /home/justin/
chown -R justin:justin /home/justin/.vim_runtime
chown justin:justin /home/justin/.vimrc
