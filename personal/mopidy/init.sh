#!/bin/zsh

killall mopidy;

FIFO_FILE=/tmp/mpd.fifo 
[[ -p $FIFO_FILE ]] ||  mkfifo $FIFO_FILE

nc -kluw 1 127.0.0.1 5555 > $FIFO_FILE & trap "kill $!" EXIT; ~/dev-tools/pyenv/versions/2.7.14/bin/mopidy
