#!/usr/bin/env sh

# i hate that this exists, plan is to move everything into nixos
set -xe 
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nixos-rebuild switch --upgrade

sudo cp "/etc/nixos/configuration.nix" "/etc/nixos/configuration.nix.bak"
sudo rm "/etc/nixos/configuration.nix"
sudo ln -s "$SCRIPTPATH/nixos/configuration.nix" "/etc/nixos/configuration.nix"
nixos-rebuild switch --upgrade