#!/bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}";    )" &> /dev/null && pwd 2> /dev/null;    )";

git clone https://github.com/archcraft-os/archcraft-wallpapers
mkdir /usr/share/backgrounds
cp $SCRIPT_DIR/archcraft-wallpapers/archcraft-backgrounds/files/*.jpg /usr/share/backgrounds/
rm -rf $SCRIPT_DIR/archcraft-wallpapers
