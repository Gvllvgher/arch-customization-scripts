#!/bin/bash

pacmanApps=(
    "exa" \
    )

pacman -S ${pacmanApps} --noconfirm > /dev/null 
