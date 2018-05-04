#!/bin/zsh

killall mopidy;

FIFO_FILE=/tmp/mpd.fifo 
[[ -p $FIFO_FILE ]] ||  mkfifo $FIFO_FILE

nc -kluw 1 127.0.0.1 5555 > $FIFO_FILE & trap "kill $!" EXIT; mopidy
