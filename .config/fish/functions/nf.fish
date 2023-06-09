# fuzzy open in nvim using find
function nf
    set file $(
        fd -t f --color=always $argv |
        fzf \
            --ansi \
            --delimiter : \
            --preview 'bat --color=always {1}' \
            --preview-window 'down,60%,border-top' \
    ) && nvim $(echo "$file" | sed 's/^\.\///')
end
