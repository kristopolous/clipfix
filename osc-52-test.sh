#!/bin/bash
test=$(uuidgen)
printf "Putting $test into OSC-52"
echo -e "\033]52;c;$(printf $test | base64)\a"
if [[ "$(xsel -po)" == "$test" ]]; then
    echo "Primary"
elif [[ "$(xsel -so)" == "$test" ]]; then
    echo "Secondary"
elif [[ "$(xsel -bo)" == "$test" ]]; then
    echo "Clipboard"
else
    echo "None!"
fi
