# Customization notes

## Awesome WM
Install Xorg and awesome
```
pacman -S xorg-server xorg-xinit xterm awesome --noconfirm
```

Tell awesome to execute
```
echo “exec awesome” > ~/.xinitrc
```

Start awesome
```
startx
```

Open terminal
```
Mod4 (Super) + Enter
```

Install some stuff
```
pacman -S firefox xfce4-taskmanager xfce4-power-manager xfce4-settings scrot pcmanfm kitty nitrogen picom file-roller dmenu
```

Create `.config` directory
```
mkdir .config
```

Make awesome directory
```
mkdir ~/.config/awesome
```

Awesome themes
```
git clone --recurse-submodules --remote-submodules --depth 1 -j 2 https://github.com/lcpz/awesome-copycats.git

mv -bv awesome-copycats/{*,.[^.]*} ~/.config/awesome; rm -rf awesome-copycats

# Without git files
mv -bv awesome-copycats/* ~/.config/awesome; rm -rf awesome-copycats
```

Copy theme stuff
```
cd ~/.config/awesome
cp rc.lua.template rc.lua
```

Awesome Components from https://github.com/lcpz/lain
```
yay -Sy lain-git
```

modify RC.lua
```
local lain = require("lain")
```