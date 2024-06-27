#!/usr/bin/env bash
HELIX_PANE_ID=$(wezterm cli get-pane-direction Up)
FILE_LINE=$(wezterm cli get-text --pane-id "$HELIX_PANE_ID")

RES=$(echo "$FILE_LINE" | rg -e "(?:NOR|INS|SEL)\s+(\S*)\s[^│]* (\d+):*.*" -o --replace '$1 $2')
FILE_PATH=$(echo "$RES" | choose 0)
LINE_NUMBER=$(echo "$RES" | choose 1)

# Extract the current Git branch name
BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)

# Extract the base URL for the remote repository (GitLab or GitHub)
REMOTE_URL=$(git remote get-url origin)

# Determine if the remote URL is for GitLab or GitHub
if [[ $REMOTE_URL == *"gitlab.com"* ]]; then
    # GitLab
    BASE_URL=$(echo "$REMOTE_URL" | sed -e 's/git@gitlab.com://' -e 's/.git$//' -e 's/:/\//g')
    COMPLETE_URL="https://gitlab.com/${BASE_URL}/-/blame/${BRANCH_NAME}/${FILE_PATH}#L${LINE_NUMBER}"
elif [[ $REMOTE_URL == *"github.com"* ]]; then
    # GitHub
    BASE_URL=$(echo "$REMOTE_URL" | sed -e 's/git@github.com://' -e 's/.git$//' -e 's/:/\//g')
    COMPLETE_URL="https://github.com/${BASE_URL}/blame/${BRANCH_NAME}/${FILE_PATH}#L${LINE_NUMBER}"
else
    echo "Remote repository is not supported. Only GitLab and GitHub URLs are supported."
    exit 1
fi

# Open in the default web browser
xdg-open "$COMPLETE_URL" || open "$COMPLETE_URL"
