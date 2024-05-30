# fuzzy open in kakoune using fd
function kf
    set file $(
        fd -t f --color=always $argv |
        fzf \
            --ansi \
            --delimiter : \
            --preview 'bat --color=always {1}' \
            --preview-window 'down,60%,border-top' \
    ) && commandline "kak $(echo "$file" | sed 's/^\.\///')"
end
