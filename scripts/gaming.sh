#!/usr/bin/env bash
set -xe

sudo liquidctl list

sudo liquidctl initialize all

if [ "$1" = "off" ]; then
    hyprctl reload
    sudo liquidctl initialize --match H100i --pump-mode quiet
    sudo liquidctl --match H100i set fan1 speed 20
    sudo liquidctl --match H100i set fan2 speed 20

    sudo liquidctl --match Commander set fan3 speed 20
    sudo liquidctl --match Commander set fan4 speed 20
    sudo liquidctl --match Commander set fan5 speed 20
else
    if [ "$1" = "res" ]; then
        hyprctl keyword monitor DP-3,2560x1440@144,0x0,1 
    fi
    sudo liquidctl initialize --match H100i --pump-mode balanced
    sudo liquidctl --match H100i set fan1 speed 40
    sudo liquidctl --match H100i set fan2 speed 40

    sudo liquidctl --match Commander set fan3 speed 40
    sudo liquidctl --match Commander set fan4 speed 40
    sudo liquidctl --match Commander set fan5 speed 40
fi
