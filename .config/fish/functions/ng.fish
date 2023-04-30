# fuzzy grep open with ripgrep
function ng
    rg --color=always --line-number --no-heading --smart-case $argv |
        fzf --ansi \
            --delimiter : \
            --layout "reverse" \
            --height '95%' \
            --preview 'bat --color=always {1} --highlight-line {2}' \
            --preview-window 'down,60%,border-top,+{2}+3/3,~3' \
            --bind 'enter:become(nvim {1} +{2})'
end
