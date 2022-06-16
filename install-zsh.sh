#! /bin/bash

pacman -Sy zsh --noconfirm > /dev/null
chsh -s $(which zsh) justin
