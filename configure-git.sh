#!/bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}";    )" &> /dev/null && pwd 2> /dev/null;    )";

cp $SCRIPT_DIR/git/.gitconfig /home/justin/
chown justin:justin /home/justin/.gitconfig
