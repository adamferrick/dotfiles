# fuzzy path name open
function np
    find $argv -type f |
        fzf \
            --delimiter : \
            --layout "reverse" \
            --height '95%' \
            --preview 'bat --color=always {1}' \
            --preview-window 'down,60%,border-top' \
            --bind 'enter:become(nvim {1})'
end
