#!/usr/bin/env sh
set -xe 
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nixos-rebuild switch --upgrade

sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home
sudo nix-channel --update
sudo nixos-rebuild switch

nix-shell '<home-manager>' -A install
ln -s "$SCRIPTPATH"/home-manager /home/"$USER"/.config/
home-manager switch

# sudo cp "/etc/nixos/configuration.nix" "/etc/nixos/configuration.nix.bak"
# sudo rm "/etc/nixos/configuration.nix"
# sudo ln -s "$PWD/nixos/configuration.nix" "/etc/nixos/configuration.nix"
# nixos-rebuild switch --upgrade