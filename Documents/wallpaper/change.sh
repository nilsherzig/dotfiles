#!/usr/bin/sh

pkill swaybg
cp "$1" ./currentwallpaper
swaybg -i ~/Documents/wallpaper/currentwallpaper -m fill & 
