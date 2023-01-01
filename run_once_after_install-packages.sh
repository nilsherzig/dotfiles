#!/usr/bin/bash
# ┌───────────────────┐
# │ required packages │
# └───────────────────┘

packages=(
    qt5-wayland
    sshfs
    rclone
    bluetuith
    zoxide
    mullvad-vpn-bin
    zoxide
    # wm / compositor 
    hyprland-git
    wlroots-git
    swaybg

    # themes
    lxappearance
    gtk-engine-murrine

    # misc
    netdata
    jq
    gammastep
    unzip
    age
    pavucontrol
    brightnessctl
    qalculate-gtk
    wofi 
    blueman
    ranger
    wl-clipboard
    openssh
    neofetch
    htop
    fzf
    zsh
    firefox
    thunderbird
    kitty
    dust

    # fonts
    ttf-iosevka-nerd
    
    # programming / languages 
    python
    python-pip


    # media / recording
    swappy
    mpv
    feh 
    obs-studio
    grim
    slurp
    wireplumber
    pipewire

    # portals
    xdg-desktop-portal
    xdg-desktop-portal-wlr

    # social 
    discord

    # amd tools
    radeontop

    # neovim setup incl linters and lsp servers
    neovim
    typescript-language-server
    vscode-langservers-extracted
    # vscode-eslint-language-server
    clang
    rust-analyzer

    # notes
    obsidian
    kodi
    visual-studio-code-bin
)

# ┌────────────────────────────────────┐
# │ chezmoi apply scripts are starting │
# └────────────────────────────────────┘

Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# ┌──────────────────────────────────────────────┐
# │ check for yay and install if it doesnt exist │
# └──────────────────────────────────────────────┘

echo    "┌─────────────────────────────────┐"
echo    "│ checking for packages           │"
echo -e "│ ${Green}Installed${Color_Off}                       │"
echo -e "│ ${Red}Not Installed${Color_Off}                   │"
echo    "└─────────────────────────────────┘"
if pacman -Q "yay" > /dev/null 2>&1; then 
	echo -e "${Green}yay${Color_Off}" 
else
 	sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git ~/yay && cd ~/yay && makepkg -si
    yay
fi


# ┌────────────────────────────┐
# │ check and install packages │
# └────────────────────────────┘

toBeInstalled=()

for package in ${packages[@]}; do 
	if pacman -Q "$package" > /dev/null 2>&1; then 
		echo -e "${Green}${package}${Color_Off}" 
	else 
		echo -e "${Red}${package}${Color_Off}" 
        toBeInstalled+="${package} "
	fi
done

echo "installing: $toBeInstalled"
yay -S $toBeInstalled --noconfirm

echo "┌──────────────────┐"
echo "│ check icon theme │"
echo "└──────────────────┘"

cd ~/.icons

DIRECTORY="Tela-grey-dark"
if [[ -d "$DIRECTORY" ]]
then
    echo -e "${Green}${DIRECTORY} exists on your filesystem.${Color_Off}"
else
    echo -e "${Red}${DIRECTORY} doesn't exist on your filesystem.${Color_Off}"
    tar xf "./Tela-grey.tar.xz" && echo "unpacking worked, icons should be loaded"
fi

echo "┌─────────────┐"
echo "│ chsh to zsh │"
echo "└─────────────┘"
if grep nils /etc/passwd | grep zsh > /dev/null
then
    echo "shell is already set to zsh" 
else 
    chsh -s $(which zsh)
fi

echo "┌───────────────────────────────────────────────────────────────┐"
echo "│ change chezmoi repo remote origin to use ssh instead of https │"
echo "└───────────────────────────────────────────────────────────────┘"

cd ~/.local/share/chezmoi
git remote set-url origin "git@github.com:nilsdev/dotfiles.git"
