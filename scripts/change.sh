#!/usr/bin/sh

pkill swaybg
cp "$1" ~/Pictures/wallpaper/currentwallpaper
swaybg -i ~/Pictures/wallpaper/currentwallpaper -m fill & 
