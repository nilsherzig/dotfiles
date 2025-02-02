#!/usr/bin/bash

# Function to show a random mindfulness question
show_random_question() {
    questions=(
    "Ist diese Handlung mit deinen langfristigen Zielen abgestimmt?"
    "Wird dies bedeutungsvoll zu deiner Zukunft beitragen?"
    "Ist dies gerade die wichtigste Aufgabe?"
    "Vermeidest du etwas Wichtigeres?"
    "Ist dies produktive Arbeit oder produktive Prokrastination?"
    "Hast du heute deine Prioritäten bedacht?"
    "Bringt dich das deinen Zielen näher?"
)

# Get random question from array
random_index=$((RANDOM % ${#questions[@]}))
selected_question="${questions[$random_index]}"

# Print question with some styling
echo -e "\n\033[1;33m=== ADHD Checkpoint ===\033[0m"
echo -e "\033[1;36m$selected_question\033[0m"
}

# Function to validate input
validate_answer() {
while true; do
    echo -e "\033[1;37mBitte gib deine Antwort ein (mindestens 5 Wörter):\033[0m"
    read -r answer

    # Count words in answer
    word_count=$(echo "$answer" | wc -w)

    if [ "$word_count" -lt 5 ]; then
        echo -e "\033[1;31mBitte gib eine ausführlichere Antwort (mindestens 5 Wörter).\033[0m"
    else
        echo -e "\033[1;32mDanke fürs Nachdenken! Fahre fort...\033[0m"
        break
    fi
done
}

# Main trigger function
check_trigger_conditions() {
current_path=$(pwd)
# projects_path="${HOME}Documents/projects"
projects_path="${HOME}Documents"

# Only proceed if in projects directory
[[ "$current_path" != "$projects_path"/* ]] && return

# Get current timestamp
current_time=$(date +%s)

# Read last check timestamp from temp file
last_check_file="/tmp/adhd_last_check"
last_check_time=0
last_message_file="/tmp/adhd_last_message"
last_message_time=0
[[ -f $last_check_file ]] && last_check_time=$(cat "$last_check_file")
[[ -f $last_message_file ]] && last_message_time=$(cat "$last_message_file")

# Time-based check - 10 min interval
time_interval=$((10 * 60))
if [[ $((current_time - last_check_time)) -ge $time_interval ]]; then
    echo "$current_time" > "$last_check_file"
    show_random_question
    validate_answer
    return
else
    # Only show message if more than 60 seconds since last message
    if [[ $((current_time - last_message_time)) -ge 60 ]]; then
        time_remaining=$(( time_interval - (current_time - last_check_time) ))
        minutes=$(( time_remaining / 60 ))
        seconds=$(( time_remaining % 60 ))
        echo -e "\033[1;34mNächste Prüfung in ${minutes}m ${seconds}s\033[0m"
        echo "$current_time" > "$last_message_file"
    fi
fi

# Check for long-running commands
if [[ $BASH_COMMAND =~ ^(npm|yarn|docker|build|make|gradle|kind).* ]]; then
    show_random_question
    validate_answer
fi
}

# Add this to your .bashrc or .zshrc:
# export PROMPT_COMMAND="source ~/dotfiles/scripts/adhd.sh; check_trigger_conditions"
# Or for zsh:
# precmd() { source ~/dotfiles/scripts/adhd.sh; check_trigger_conditions }
