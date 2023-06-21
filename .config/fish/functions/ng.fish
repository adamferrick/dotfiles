# fuzzy grep open with ripgrep
function ng
    set line $(
        rg --color=always --trim --line-number --no-heading --smart-case $argv |
        fzf --ansi \
            --delimiter : \
            --preview 'bat --color=always {1} --highlight-line {2}' \
            --preview-window 'down,60%,border-top,+{2}+3/3,~3' \
    ) && nvim $(echo "$line" | cut -d : -f1) +$(echo "$line" | cut -d : -f2)
end
