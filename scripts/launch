#!/usr/bin/env bash

options=("$(find /etc/profiles/per-user/nils/bin -printf "%f\n")")
options+=('firefox https://discord.com/app/')
options+=('firefox https://web.whatsapp.com')
options+=('firefox https://speed.cloudflare.com')
options+=('firefox http://localhost:8384 # syncthing ui')
options+=('firefox http://localhost:7878 # radarr')
options+=('firefox http://localhost:8989 # sonarr')
options+=('firefox http://localhost:9696 # prowlarr')
options+=('firefox http://localhost:8080 # qbit')
options+=('firefox http://localhost:3333 # bitmagnet')
options+=('firefox http://localhost:8787 # readarr')

options+=('hyprctl dispatch exit')
options+=('systemctl suspend')
options+=('shutdown now')
options+=('systemctl suspend')

hyprctl dispatch exec "$(printf "%s\n" "${options[@]}" | fzf)"
