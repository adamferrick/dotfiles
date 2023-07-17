# fuzzy stylus mapping to output

set desktop "Full Desktop"

set devices "Wacom Intuos Pro M Pen stylus" "Wacom Intuos Pro M Pen eraser"

function sf
    set displays "$(xrandr | awk '/ connected / {print $1}')"
    set selection $(echo -e "$desktop\n$displays" | fzf --header "Map $stylus")

    if test "$selection" = "$desktop"
        for device in $devices
            xsetwacom set "$device" ResetArea
            xsetwacom set "$device" MapToOutput 'desktop'
        end
    else if not test "$selection" = ""
        for device in $devices
            xsetwacom set "$device" Area 0 0 44800 25200
            xsetwacom set "$device" MapToOutput $selection
        end
    end
end
