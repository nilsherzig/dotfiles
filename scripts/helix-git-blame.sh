#!/usr/bin/env bash

# ~/bin/helix-git-blame

HELIX_PANE_ID=$(wezterm cli get-pane-direction Up)
FILE_LINE=$(wezterm cli get-text --pane-id $HELIX_PANE_ID)

RES=$(echo $FILE_LINE | rg -e "(?:NOR|INS|SEL)\s+(\S*)\s[^│]* (\d+):*.*" -o --replace '$1 $2')
FILE=$(echo $RES | choose 0)
LINE=$(echo $RES | choose 1)

echo $LINE

echo $FILE

git blame -L $LINE,+100 $FILE --color-by-age --color-lines | 
  fzf --ansi \
      --border \
      --delimiter ':' \
      --height '100%' \
      --multi \
      --print-query --exit-0 \
      --scrollbar '▍'

sleep 100
