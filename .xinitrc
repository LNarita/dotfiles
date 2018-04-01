#!/usr/bin/env sh


export _JAVA_AWT_WM_NONREPARENTING=1

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-eval-file
fi

