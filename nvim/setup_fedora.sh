#!/usr/bin/env bash
set -xe

sudo apt-get install -y build-essential

# basic tools and package managers which are needed to download the lsp servers
sudo apt-get install -y make automake gcc git nodejs cargo

# msp430 bullshit
sudo dnf copr enable nielsenb/msp430-development-tools -y
sudo dnf install -y msp430-elf-gcc msp430-elf-binutils msp430-elf-gdb mspds msp430flasher msp430-gcc-support-files dos2unix libusb readline

cd /tmp
git clone https://github.com/dlbeer/mspdebug
cd /tmp/mspdebug
