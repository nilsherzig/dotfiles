#!/usr/bin/env bash
set -xe

sudo liquidctl list

sudo liquidctl initialize all


export color1=231942
export color2=5E548E

# sudo liquidctl --match Commander set sync color clear
sudo liquidctl --match Commander set sync color off
# sudo liquidctl --match Commander set sync color color_shift $color1 $color2 --start-led 0 


sudo liquidctl set led color off --match H100i 
# sudo liquidctl --match H100i set led color fixed $color1
