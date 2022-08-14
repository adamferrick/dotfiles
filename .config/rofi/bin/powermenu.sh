#!/bin/bash

poweroff="Power Off"
restart="Restart"
suspend="Suspend"
lock="Lock"

options="$poweroff\n$restart\n$suspend\n$lock"

chosen="$(echo -e "$options" | rofi -dmenu -i -p 'Selection: ')"

case $chosen in
    $poweroff)
        ans="$(echo -e 'No\nYes' | rofi -dmenu -i -p "$poweroff"': Are you sure? ')"
        if [[ "$ans" = "Yes" ]]; then
            systemctl poweroff
        fi
        ;;
    $restart)
        ans="$(echo -e 'No\nYes' | rofi -dmenu -i -p "$restart"': Are you sure? ')"
        if [[ "$ans" = "Yes" ]]; then
            systemctl reboot
        fi
        ;;
    $lock)
        ans="$(echo -e 'No\nYes' | rofi -dmenu -i -p "$lock"': Are you sure? ')"
        if [[ "$ans" = "Yes" ]]; then
            light-locker-command -l
        fi
        ;;
    $suspend)
        ans="$(echo -e 'No\nYes' | rofi -dmenu -i -p "$suspend"': Are you sure? ')"
        if [[ "$ans" = "Yes" ]]; then
            systemctl suspend
        fi
        ;;
esac
