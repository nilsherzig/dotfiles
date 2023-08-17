#!/usr/bin/env sh

pkill swaybg
cp "$(find "$HOME"/Pictures/wallpaper/| fzf)" ~/Pictures/wallpaper/currentwallpaper
swaybg -i ~/Pictures/wallpaper/currentwallpaper -m fill & 
