```
┌──────────────────────────────────────────────────────────┐
│ i left a lot of comments like this one in my dotfiles :) │
└──────────────────────────────────────────────────────────┘
``` 
The current install script expects a minimal arch install.

Open tty, run `sudo pacman -S chezmoi && chezmoi init --apply nilsdev`, wait for my scripts to finish and now you can run `~/launch.sh` to get a beautiful and working hyprland env. 


TODOs: 
- [ ] get discord / webcord screenshare working
- [x] fix obs 
- [x] fix firefox context menus

### does:
- installs packages defined in [install-packages.sh](https://github.com/nilsdev/dotfiles/blob/main/run_once_after_install-packages.sh)
- loads dotfiles for these packages
- downloads and enables / installs gtk themes, icons, fonts and cursors
- changes shell to zsh
- installs hyprland as a window manager and changes some env vars to make everything run under wayland
- downloads some wallpapers

### doesn't: 
- preserve your current settings, make a backup before running the bootstrap script / chezmoi init
