#!/usr/bin/env sh
monitor=$(hyprctl monitors -j | jq ".[] | .name" | sed 's/"//g' | fzf )

resolutions=(3840x2160 2560x1440)
res=$(printf "%s\n" "${resolutions[@]}" | fzf)

rates=(165 144 60 24)
rate=$(printf "%s\n" "${rates[@]}" | fzf)

echo "${monitor},${res},@${rate},0x0,1"

hyprctl keyword monitor "${monitor},${res}@${rate},0x0,1"
