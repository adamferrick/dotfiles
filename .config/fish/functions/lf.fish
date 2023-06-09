# fuzzy launcher menu
function lf
    set selected $(complete -C | fzf --header "Launch App" --with-nth 1)
    if not test "$selected" = ""
        i3-msg -q "exec --no-startup-id $(echo $selected | cut -f1)"
    end
end
