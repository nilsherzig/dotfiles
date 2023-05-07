#!/usr/bin/sh

pkill swaybg
cp "$1" ./currentwallpaper
swaybg -i ~/Pictures/wallpaper/currentwallpaper -m fill & 
