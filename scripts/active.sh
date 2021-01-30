#!/bin/sh

name=$(xdotool getactivewindow getwindowname 2>1)

if [ "$name" = "" ]; then
    echo $PINCH
else
    echo $name
fi