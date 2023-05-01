# fuzzy open in nvim using find
function nf
    set file $(
        find $argv -type f |
        fzf \
            --delimiter : \
            --layout "reverse" \
            --height '95%' \
            --preview 'bat --color=always {1}' \
            --preview-window 'down,60%,border-top' \
    ) && nvim "$file"
end
