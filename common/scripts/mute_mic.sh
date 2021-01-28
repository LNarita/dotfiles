#! /bin/sh

# With icon indicating the state of the mic
state=`amixer -c 0 set Capture toggle | gawk 'match($0, /Capture.*\[(.*)\]/, a) {print a[1]}'`
if [ $state = "off" ]; then
    icon="audio-input-microphone-muted-symbolic"
else
    icon="audio-input-microphone-symbolic"
fi

notify-send --hint=int:transient:1 -i $icon "Mic switched: $state"
