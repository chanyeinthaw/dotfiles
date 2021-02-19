#!/bin/sh

name=$(xdotool getactivewindow getwindowname 2>/tmp/active)

if [ "$name" = "" ]; then
    echo $PINCH
else
    len=${#name}
    if [ $len -gt 60 ]; then
        echo $(echo $name | cut -c1-60)...
    else
        echo $name
    fi
fi