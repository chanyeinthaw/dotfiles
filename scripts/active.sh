#!/bin/sh

name=$(xdotool getactivewindow getwindowname 2>1)

if [ "$name" = "" ]; then
    echo Pinch
else
    echo $name
fi