#!/usr/bin/env bash

options=("$(find /etc/profiles/per-user/nils/bin -printf "%f\n")")

# TODO add logic to handle "special" events like this one (events which cant be run wich exec [name])
options+=('exit')

hyprctl dispatch exec "$(printf "%s\n" "${options[@]}" | fzf)"

