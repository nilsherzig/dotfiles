#!/usr/bin/env bash


check_todoist() {
    # API endpoint
    API_URL="https://api.todoist.com/rest/v2/tasks?filter=today"

    # Make the API request
    response=$(curl -s -H "Authorization: Bearer $TODOIST_TOKEN" "$API_URL" | jq || return 0) 
    length=$(echo "$response" | jq length)

    # Check if the response is empty or contains tasks
    if [ "$length" -gt 0 ]; then
        echo "You have $length open tasks. 🦀"
        echo "$response" | jq '.[] | "\(.content) - Due: \(.due.string)"'
        return 0
    else
        return 1
    fi
}

# Function to check if current directory is a subdirectory of "projects"
is_projects_subdir() {
    local current_path

    current_path=$(pwd)
    case $current_path in
        *"/projects"*) return 0 ;;
        *) return 1 ;;
    esac
}

old_is_not_projects_subdir() {
    local current_path

    current_path=$OLDPWD
    case $current_path in
        *"/projects"*) return 1 ;;
        *) return 0 ;;
    esac
}

# Main function to be called when entering a directory
digital_wellbeing_check() {
    return 0
    if is_projects_subdir && old_is_not_projects_subdir; then
        if check_todoist; then
            cd "$HOME" || return
            echo "
Denk daran, wie gut es sich anfühlt erstmal alles fertig
zu haben und wie scheiße es ist, wenn man andere Leute 
hängen lässt.
Für mehr von den guten Momenten, in denen ich mit guten
Gewissen nichts tun kann.
"
        fi
    fi
}

# Add the following lines to your .zshrc or .bashrc file to hook the function
#
# source /path/to/wellbeing.sh
# chpwd_functions=(${chpwd_functions[@]} "digital_wellbeing_check") # triggers on directory change
# digital_wellbeing_check # Call the function once to check when the shell is loaded (optional)
