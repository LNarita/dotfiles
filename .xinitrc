#!/usr/bin/env sh


if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-eval-file
fi

