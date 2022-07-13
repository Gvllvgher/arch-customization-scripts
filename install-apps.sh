#!/bin/bash

pacmanApps=(
    "exa
    thefuck" \
    )

pacman -S ${pacmanApps} --noconfirm > /dev/null 
