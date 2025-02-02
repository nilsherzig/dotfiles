#!/usr/bin/bash

# Create ADHD log directory if it doesn't exist
ADHD_LOG_DIR="${HOME}/.adhd"
ADHD_LOG_FILE="${ADHD_LOG_DIR}/log.csv"

mkdir -p "$ADHD_LOG_DIR"

# Create log file with headers if it doesn't exist
if [ ! -f "$ADHD_LOG_FILE" ]; then
    echo "timestamp,folder,question,answer" > "$ADHD_LOG_FILE"
fi

# Function to log the interaction
log_interaction() {
    local timestamp="$1"
    local current_folder="$2"
    local question="$3"
    local answer="$4"

    question="${question//,/;}"
    answer="${answer//,/;}"
    current_folder="${current_folder//,/;}"

    formatted_timestamp=$(date -d "@$timestamp" "+%Y-%m-%d %H:%M:%S")
    echo "$formatted_timestamp,$current_folder,$question,$answer" >> "$ADHD_LOG_FILE"
}

# Function to show a random mindfulness question
show_random_question() {
    questions=(
    "Ist diese Handlung mit deinen langfristigen Zielen abgestimmt?"
    "Ist dies gerade die wichtigste Aufgabe?"
    "Vermeidest du etwas Wichtigeres?"
    "Wird dies in einem Jahr noch wichtig sein?"
    "Was ist das schlimmste, was passieren könnte, wenn du das jetzt nicht machst?"
    )

    random_index=$((RANDOM % ${#questions[@]}))
    CURRENT_QUESTION="${questions[$random_index]}"

    echo -e "\n\033[1;33m=== ADHD Checkpoint ===\033[0m"
    echo -e "\033[1;36m$CURRENT_QUESTION\033[0m"
}

# Function to validate input
validate_answer() {
    local current_folder="$1"
    local timestamp="$2"

    while true; do
        echo -e "\033[1;37mBitte gib deine Antwort ein (mindestens 5 Wörter):\033[0m"
        read -r answer

        word_count=$(echo "$answer" | wc -w)

        if [ "$word_count" -lt 5 ]; then
            echo -e "\033[1;31mBitte gib eine ausführlichere Antwort (mindestens 5 Wörter).\033[0m"
        else
            echo -e "\033[1;32mDanke fürs Nachdenken! Fahre fort...\033[0m"
            log_interaction "$timestamp" "$current_folder" "$CURRENT_QUESTION" "$answer"
            break
        fi
    done
}

# Function to check for recent file modifications
check_recent_modifications() {
    local dir="$1"
    local today_stats_file="${ADHD_LOG_DIR}/$(date +%Y-%m-%d)_time.txt"
    local last_increment_file="${ADHD_LOG_DIR}/last_increment_time"
    local current_time=$(date +%s)

    # Erstelle Stats-Datei falls nicht vorhanden
    if [ ! -f "$today_stats_file" ]; then
        echo "0" > "$today_stats_file"
    fi

    # Erstelle last_increment_file falls nicht vorhanden
    if [ ! -f "$last_increment_file" ]; then
        echo "$current_time" > "$last_increment_file"
    fi

    # Prüfe ob Stats-Datei vom aktuellen Tag ist
    local file_date=$(basename "$today_stats_file" | cut -d_ -f1)
    local current_date=$(date +%Y-%m-%d)
    if [ "$file_date" != "$current_date" ]; then
        echo "0" > "$today_stats_file"
    fi

    # Prüfe auf Dateiänderungen in den letzten 5 Minuten
    local recent_changes=$(find "$dir" -maxdepth 3 -not -path "**/.git/**" -not -path "**/node_modules/**" -type f -mmin -5 2>/dev/null | wc -l)

    if [ "$recent_changes" -gt 0 ]; then
        # Lese aktuelle Tageszeit und letzten Inkrementierungszeitpunkt
        local current_minutes=$(<"$today_stats_file")
        local last_increment_time=$(<"$last_increment_file")

        # Berechne vergangene Zeit seit letzter Inkrementierung (in Minuten)
        local time_diff_minutes=$(( (current_time - last_increment_time) / 60 ))

        # Begrenze die Differenz auf maximal 5 Minuten
        if [ "$time_diff_minutes" -gt 5 ]; then
            time_diff_minutes=5
        fi

        # Addiere Zeit nur wenn mindestens 1 Minute vergangen ist
        if [ "$time_diff_minutes" -ge 1 ]; then
            local new_total=$((current_minutes + time_diff_minutes))
            echo "$new_total" > "$today_stats_file"
            echo "$current_time" > "$last_increment_file"

            echo -e "\033[1;35m🔧  $recent_changes Datei(en) in den letzten 5 Minuten geändert\033[0m"
            echo -e "\033[1;32m⏲️️  Heute bereits $new_total Minuten aktiv\033[0m"
        fi

        return 0
    fi

    return 1
}

# Main trigger function
check_trigger_conditions() {
    current_path=$(pwd)
    project_paths=(
        "${HOME}Documents/*"
        "${HOME}dotfiles"
    )

    for pathVar in "${project_paths[@]}"; do
        [[ "$current_path" == "$pathVar" ]] && break
    done || return

    current_time=$(date +%s)

    last_check_file="/tmp/adhd_last_check"
    last_check_time=0
    last_message_file="/tmp/adhd_last_message"
    last_message_time=0
    [[ -f $last_check_file ]] && last_check_time=$(cat "$last_check_file")
    [[ -f $last_message_file ]] && last_message_time=$(cat "$last_message_file")

    # Check for recent modifications
    check_recent_modifications "$current_path"
    has_recent_changes=$?

    time_interval=$((10 * 60))
    if [[ $((current_time - last_check_time)) -ge $time_interval ]]; then
        echo "$current_time" > "$last_check_file"
        while true; do
            trap 'continue' INT
            show_random_question
            validate_answer "$current_path" "$current_time"
            trap - INT
            break
        done
        return
    else
        if [[ $((current_time - last_message_time)) -ge 60 ]]; then
            time_remaining=$(( time_interval - (current_time - last_check_time) ))
            minutes=$(( time_remaining / 60 ))
            seconds=$(( time_remaining % 60 ))
            echo -e "⏰ \033[1;34mNächste Frage in ${minutes}m ${seconds}s\033[0m"
            echo "$current_time" > "$last_message_file"
        fi
    fi

    if [[ $BASH_COMMAND =~ ^(npm|yarn|docker|build|make|gradle|kind).* ]]; then
        while true; do
            trap 'continue' INT
            show_random_question
            validate_answer "$current_path" "$current_time"
            trap - INT
            break
        done
    fi
}
# Add this to your .bashrc or .zshrc:
# export PROMPT_COMMAND="source ~/dotfiles/scripts/adhd.sh; check_trigger_conditions"
# Or for zsh:
# precmd() { source ~/dotfiles/scripts/adhd.sh; check_trigger_conditions }
