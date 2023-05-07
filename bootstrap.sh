#!/usr/bin/env sh
set -xe 
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
nixos-rebuild switch --upgrade

sudo cp "/etc/nixos/configuration.nix" "/etc/nixos/configuration.nix.bak"
sudo rm "/etc/nixos/configuration.nix"
ln -s "$PWD/nixos/configuration.nix" "/etc/nixos/configuration.nix"
nixos-rebuild switch --upgrade