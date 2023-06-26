# fuzzy open open from linter results using the ~/,local/bin/quick-lint script
function nq
    set line $(
        quick-lint |
        fzf --ansi \
            --delimiter : \
            --preview 'bat --color=always {1} --highlight-line {2}' \
            --preview-window 'down,60%,border-top,+{2}+3/3,~3' \
    ) && nvim $(echo "$line" | cut -d : -f1) +$(echo "$line" | cut -d : -f2)
end
