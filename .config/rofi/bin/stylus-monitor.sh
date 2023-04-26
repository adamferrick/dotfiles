#!/bin/bash

desktop="Full Desktop"
displays="$(xrandr | awk '/ connected / {print $1}')"

stylus="Wacom Intuos Pro M Pen stylus"

selection=$(echo -e "$desktop\n$displays" | rofi -dmenu -matching fuzzy -sort-method fzf -sort -i  -p "Map $stylus to: ")

if [[ "$selection" == "$desktop" ]]
then
    xsetwacom set "$stylus" ResetArea
    xsetwacom set "$stylus" MapToOutput 'desktop'
elif ! [[ $selection == "" ]]
then
    xsetwacom set "$stylus" Area 0 0 44800 25200
    xsetwacom set "$stylus" MapToOutput $selection
fi
