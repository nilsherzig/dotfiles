#!/usr/bin/env sh

set -xe

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

ln -sf "$SCRIPT_DIR"/* "$HOME/.config"
