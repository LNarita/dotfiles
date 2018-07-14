#!/bin/zsh

FIFO_FILE="/tmp/mpd.fifo"

killall -s SIGKILL mopidy;

mopidy & 
{
    [[ -p $FIFO_FILE ]] || mkfifo $FIFO_FILE
} && {
    while :; do; yes $’\n’ | nc -lu 127.0.0.1 5555 > $FIFO_FILE; done
}
