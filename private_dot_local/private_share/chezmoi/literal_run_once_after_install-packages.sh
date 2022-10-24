#!/usr/bin/bash
#
# this config assumes a minimal archinstall

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

# ┌───────────────────┐
# │ required packages │
# └───────────────────┘

packages=(
    openssh
	neovim
	htop
	fzf
	zsh
	firefox
	kitty

	hyprland-git
	wlroots-git
    swaybg

	ranger
	wl-clipboard
	lxappearance-gtk3
	pavucontrol
    brightnessctl
    wofi 
    qalculate-gtk
    flameshot
    ttf-iosevka-nerd
    blueman
	python
    python-pip

    slurp
    wireplumber
    pipewire
    xdg-desktop-portal-wlr
)

# ┌────────────────────────────┐
# │ check and install packages │
# └────────────────────────────┘

for package in ${packages[@]}; do 
	if pacman -Q "$package" > /dev/null 2>&1; then 
		# echo -e "$package \t-> is installed" 
		echo -e "${Green}${package}${Color_Off}" 
	else 
		echo -e "${Red}${package}${Color_Off}" 
		yay -S "$package" --noconfirm
	fi
done

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
