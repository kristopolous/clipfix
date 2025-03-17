#!/bin/bash
test=$(uuidgen)
echo "Here's the code to check, select it with the mouse and I'll tell you what clipboard it has populated:"
echo -e "\n$test\n"
while true; do
    flag=0
    if [[ "$(xsel -po)" == "$test" ]]; then
        flag=1
        printf "Primary | "
    fi
    if [[ "$(xsel -so)" == "$test" ]]; then
        flag=1
        printf "Secondary | "
    fi
    if [[ "$(xsel -bo)" == "$test" ]]; then
        flag=1
        printf "Clipboard | "
    fi
    if pgrep tmux > /dev/null; then
        if [[ "$(tmux show-buffer)" == "$test" ]]; then
            flag=1
            printf "tmux (internal) "
        fi
    fi
    if [[ $flag == "0" ]]; then
        printf "None!"
    fi
    tput el && tput cr
    sleep 1
done
