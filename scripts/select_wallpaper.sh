#!/usr/bin/env sh

pkill swaybg
cp ~/Pictures/wallpaper/$(ls ~/Pictures/wallpaper/ | fzf --preview="kitty icat --clear --place 200x40@0x0 --transfer-mode file ~/Pictures/wallpaper/{}") ~/Pictures/wallpaper/currentwallpaper
swaybg -i ~/Pictures/wallpaper/currentwallpaper -m fill & 
