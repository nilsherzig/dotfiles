#!/usr/bin/bash

items=("shutdown now" "reboot")


test () {
    for i in "${items[@]}"
    do 
        echo "$i"
    done | wofi --show dmenu
}



"$(test)"