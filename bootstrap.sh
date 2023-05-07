#!/usr/bin/env sh
set -xe 
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nixos-rebuild switch --upgrade

# sudo cp "/etc/nixos/configuration.nix" "/etc/nixos/configuration.nix.bak"
# sudo rm "/etc/nixos/configuration.nix"
# sudo ln -s "$PWD/nixos/configuration.nix" "/etc/nixos/configuration.nix"
# nixos-rebuild switch --upgrade