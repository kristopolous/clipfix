#!/bin/bash
xsel --display :0 -o > /tmp/xsel_output
tmux load-buffer /tmp/xsel_output
tmux paste-buffer
rm /tmp/xsel_output # Clean up immediately
