#!/usr/bin/env bash
set -xe

cat << EOF | sudo tee /etc/dnf/dnf.conf
[main]
gpgcheck=True
installonly_limit=3
clean_requirements_on_remove=True
best=False
skip_if_unavailable=True
max_parallel_downloads=20
EOF

# install base dev tools and libs
sudo dnf groupinstall -y "Development Tools" "Development Libraries"

# basic tools and package managers which are needed to download the lsp servers
sudo dnf install -y make automake gcc git nodejs cargo

# msp430 bullshit
sudo dnf copr enable nielsenb/msp430-development-tools -y
sudo dnf install -y msp430-elf-gcc msp430-elf-binutils msp430-elf-gdb mspds msp430flasher msp430-gcc-support-files dos2unix libusb readline mspdebug

# export neovim to host system - everything inside neovim will run inside the container
distrobox-export --bin /usr/bin/nvim --export-path ~/.local/bin/
