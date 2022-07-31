#!/bin/bash

poweroff="Power Off"
hibernate="Hibernate"
restart="Restart"
suspend="Suspend"
lock="Lock"
hybrid="Hybrid"

options="$poweroff\n$hibernate\n$restart\n$suspend\n$lock\n$hybrid"

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
    $hibernate)
        ans="$(echo -e 'No\nYes' | rofi -dmenu -i -p "$hibernate"': Are you sure? ')"
        if [[ "$ans" = "Yes" ]]; then
            systemctl hibernate
        fi
        ;;
    $suspend)
        ans="$(echo -e 'No\nYes' | rofi -dmenu -i -p "$suspend"': Are you sure? ')"
        if [[ "$ans" = "Yes" ]]; then
            systemctl suspend
        fi
        ;;
    $hybrid)
        ans="$(echo -e 'No\nYes' | rofi -dmenu -i -p "$hybrid"': Are you sure? ')"
        if [[ "$ans" = "Yes" ]]; then
            systemctl hybrid-sleep
        fi
        ;;
esac
