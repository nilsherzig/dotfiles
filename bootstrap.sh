#!/usr/bin/env sh

# i hate that this exists, plan is to move everything into nixos
set -xe 
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# change nixos channel to unstable
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
# update
sudo nixos-rebuild switch --upgrade

# create backup of nix config
sudo cp "/etc/nixos/configuration.nix" "/etc/nixos/configuration.nix.bak"

# link 
sudo ln -sf "$SCRIPTPATH/nixos/configuration.nix" "/etc/nixos/configuration.nix"

# rebuild
nixos-rebuild switch --upgrade
