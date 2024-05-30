# fuzzy grep open with ripgrep
# usage: kg PATTERN
function kg
    set line $(
        rg --color=always --trim --line-number --no-heading --smart-case $argv |
        fzf --ansi \
            --delimiter : \
            --preview 'bat --color=always {1} --highlight-line {2}' \
            --preview-window 'down,60%,border-top,+{2}+3/3,~3' \
    ) && commandline "kak $(echo "$line" | cut -d : -f1) +$(echo "$line" | cut -d : -f2)"
end
