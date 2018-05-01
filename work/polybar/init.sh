#!/bin/bash

killall polybar

monitors=($(bspc query -M --names))

for monitor in ${monitors[@]}; do
    MONITOR=$monitor polybar --reload top &
    MONITOR=$monitor polybar --reload bottom &
done
