#!/bin/bash

pacmanApps=(
    "exa
    alacritty
    thefuck" \
    )

pacman -S ${pacmanApps} --noconfirm > /dev/null 
