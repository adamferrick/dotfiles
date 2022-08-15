#!/bin/bash

poweroff="Power Off"
restart="Restart"
logout="Log Out"
suspend="Suspend"
lock="Lock"

options="$poweroff\n$restart\n$logout\n$suspend\n$lock"

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
    $logout)
        ans="$(echo -e 'No\nYes' | rofi -dmenu -i -p "$logout"': Are you sure? ')"
        if [[ "$ans" = "Yes" ]]; then
            loginctl terminate-session $XDG_SESSION_ID
        fi
        ;;
    $suspend)
        ans="$(echo -e 'No\nYes' | rofi -dmenu -i -p "$suspend"': Are you sure? ')"
        if [[ "$ans" = "Yes" ]]; then
            systemctl suspend
        fi
        ;;
    $lock)
        ans="$(echo -e 'No\nYes' | rofi -dmenu -i -p "$lock"': Are you sure? ')"
        if [[ "$ans" = "Yes" ]]; then
            ~/.config/i3/bin/lock.sh
        fi
        ;;
esac
