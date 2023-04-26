#!/bin/bash

command="rofi -dmenu -matching fuzzy -sort-method fzf -sort -i"

poweroff="Power Off"
restart="Restart"
logout="Log Out"
suspend="Suspend"
lock="Lock"

options="$poweroff\n$restart\n$logout\n$suspend\n$lock"

chosen="$(echo -e "$options" | $command -p '> ')"

case $chosen in
    $poweroff)
        ans="$(echo -e 'No\nYes' | $command -p "$poweroff"': Are you sure? ')"
        if [[ "$ans" = "Yes" ]]; then
            systemctl poweroff
        fi
        ;;
    $restart)
        ans="$(echo -e 'No\nYes' | $command -p "$restart"': Are you sure? ')"
        if [[ "$ans" = "Yes" ]]; then
            systemctl reboot
        fi
        ;;
    $logout)
        ans="$(echo -e 'No\nYes' | $command -p "$logout"': Are you sure? ')"
        if [[ "$ans" = "Yes" ]]; then
            loginctl terminate-session $XDG_SESSION_ID
        fi
        ;;
    $suspend)
        ans="$(echo -e 'No\nYes' | $command -p "$suspend"': Are you sure? ')"
        if [[ "$ans" = "Yes" ]]; then
            systemctl suspend
        fi
        ;;
    $lock)
        ans="$(echo -e 'No\nYes' | $command -p "$lock"': Are you sure? ')"
        if [[ "$ans" = "Yes" ]]; then
            ~/.config/i3/bin/lock.sh
        fi
        ;;
esac
