#!/usr/bin/env bash
wpctl set-volume @DEFAULT_AUDIO_SINK@ "$1" && notify-send "volume" -u "critical" -t 1000 -a "test" -h int:value:$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o '[0-9]*\.[0-9]*' | awk '{printf("%.0f\n", $1*100 + 0.5)}')
