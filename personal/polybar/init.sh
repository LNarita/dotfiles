#!/bin/sh

killall polybar

polybar top &
polybar bottom &
