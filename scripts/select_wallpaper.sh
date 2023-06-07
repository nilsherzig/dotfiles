#!/usr/bin/env sh

pkill swaybg
cp ~/Pictures/wallpaper/$(ls ~/Pictures/wallpaper/ | fzf --preview="firefox ~/Pictures/wallpaper/{}") ~/Pictures/wallpaper/currentwallpaper
swaybg -i ~/Pictures/wallpaper/currentwallpaper -m fill & 
