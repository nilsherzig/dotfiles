#!/usr/bin/env sh
hyprctl dispatch exec "$(find /etc/profiles/per-user/nils/bin/ -printf "%f\n" | fzf)"
