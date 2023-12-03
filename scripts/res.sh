#!/usr/bin/env sh
monitor=$(hyprctl monitors -j | jq ".[] | .name" | sed 's/"//g' | fzf )

resolutions=(3840x2160 2560x1440 1920x1080 1680x1050 1600x900 1440x900 1366x768 1280x1024 1280x800 1280x720 1024x768 800x600 640x480)
res=$(printf "%s\n" "${resolutions[@]}" | fzf)

rates=(165 144 60 24)
rate=$(printf "%s\n" "${rates[@]}" | fzf)

echo "${monitor},${res},@${rate},0x0,1"

hyprctl keyword monitor "${monitor},${res}@${rate},0x0,1"
