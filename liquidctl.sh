#!/usr/bin/env bash
set -xe

sudo liquidctl list

sudo liquidctl initialize all


sudo liquidctl initialize --match H100i --pump-mode "$2"
# liquidctl initialize --match H100i --pump-mode quiet
# liquidctl initialize --match H100i --pump-mode balanced
# liquidctl initialize --match H100i --pump-mode extreme


sudo liquidctl --match H100i set fan1 speed "$1"
sudo liquidctl --match H100i set fan2 speed "$1"

sudo liquidctl --match Commander set fan3 speed "$1"
sudo liquidctl --match Commander set fan4 speed "$1"
sudo liquidctl --match Commander set fan5 speed "$1"