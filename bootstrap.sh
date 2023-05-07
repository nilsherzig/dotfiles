#!/usr/bin/env sh
set -xe 
sudo rm "/etc/nixos/configuration.nix"
ln -s "$PWD/nixos/configuration.nix" "/etc/nixos/configuration.nix"