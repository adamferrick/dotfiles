# fuzzy grep open with ag
function ng
    set AG_PREFIX ag --nobreak --noheading --silent -i
    ag --nobreak --noheading --silent -i $argv |
        fzf --ansi \
            --disabled --query "$argv" \
            --delimiter : \
            --layout "reverse" \
            --height '95%' \
            --preview 'bat --color=always {1} --highlight-line {2}' \
            --preview-window 'down,60%,border-top,+{2}+3/3,~3' \
            --bind 'enter:become(nvim {1} +{2})'
end
