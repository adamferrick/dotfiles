# fuzzy power menu

set poweroff "Power Off"
set restart "Restart"
set logout "Log Out"
set suspend "Suspend"
set lock "Lock"

set options "$poweroff\n$restart\n$logout\n$suspend\n$lock"

function run_command
    switch $argv[1]
        case $poweroff
            systemctl poweroff
        case $restart
            systemctl reboot
        case $logout
            loginctl terminate-session $XDG_SESSION_ID
        case $suspend
            systemctl suspend
        case $lock
            lock
    end
end

function validate
    echo $(echo -e "No\nYes" | fzf --header "$argv[1]: Are you sure?")
end

function pf
    set selected $(echo -e "$options" | fzf --header "System Power Menu")

    if not test "$selected" = ""; and test $(validate "$selected") = "Yes"
        run_command "$selected"
    end
end
