# fuzzy launcher menu
function lf
    set selected $(complete -C | fzf --header "Launch App" --with-nth 1)
    if not test "$selected" = ""
        commandline "i3-launch "$(echo $selected | cut -f1)""
    end
end
