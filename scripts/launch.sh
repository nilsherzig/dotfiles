#!/usr/bin/env bash

options=("$(find /etc/profiles/per-user/nils/bin -printf "%f\n")")
options+=('firefox https://discord.com/app/')
options+=('firefox https://web.whatsapp.com')
options+=('firefox https://speed.cloudflare.com')

options+=('hyprctl dispatch exit')
options+=('shutdown now')

hyprctl dispatch exec "$(printf "%s\n" "${options[@]}" | fzf)"

