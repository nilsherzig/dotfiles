```
┌──────────────────────────────────────────────────────────┐
│ i left a lot of comments like this one in my dotfiles :) │
└──────────────────────────────────────────────────────────┘
``` 
The current install script expects a minimal arch install.

Download and bootstrap my settings via `chezmoi init --apply nilsdev`. 

### does:
- installs packages in [install-packages.sh](https://github.com/nilsdev/dotfiles/blob/main/run_once_after_install-packages.sh)
- loads dotfiles for these packages
- downloads and enables / installs gtk themes, icons, fonts and cursors
- changes shell to zsh
- installs hyprland as a window manager and changes some env vars to make everything run under wayland

### doesn't: 
- preserve your current settings, make a backup before running the bootstrap script / chezmoi init
