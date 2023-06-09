# fuzzy stylus mapping to output

set desktop "Full Desktop"

set stylus "Wacom Intuos Pro M Pen Stylus"

function sf
    set displays "$(xrandr | awk '/ connected / {print $1}')"
    set selection $(echo -e "$desktop\n$displays" | fzf --header "Map $stylus")

    if test "$selection" = "$desktop"
        xsetwacom set "$stylus" ResetArea
        xsetwacom set "$stylus" MapToOutput 'desktop'
    else if not test "$selection" = ""
        xsetwacom set "$stylus" Area 0 0 44800 25200
        xsetwacom set "$stylus" MapToOutput $selection
    end
end
