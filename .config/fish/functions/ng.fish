# fuzzy grep open with ripgrep
function ng
    set line $(
        rg --color=always --trim --colors 'match:none' --colors 'match:style:underline' --line-number --no-heading --smart-case $argv |
        fzf --ansi \
            --delimiter : \
            --layout "reverse" \
            --height '95%' \
            --preview 'bat --color=always {1} --highlight-line {2}' \
            --preview-window 'down,60%,border-top,+{2}+3/3,~3' \
    ) && nvim $(echo "$line" | cut -d : -f1) +$(echo "$line" | cut -d : -f2)
end
