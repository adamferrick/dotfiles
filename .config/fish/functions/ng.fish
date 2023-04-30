# fuzzy grep open with ag
function ng
    rm -f /tmp/ag-fzf-{r,f}
    set AG_PREFIX ag --nobreak --noheading --silent -i
    $AG_PREFIX $argv |
        fzf --ansi \
            --color "hl:-1:underline,hl+:-1:underline:reverse" \
            --disabled --query "$argv" \
            --bind "change:reload:sleep 0.1; $AG_PREFIX {q} || true" \
            --bind "ctrl-f:unbind(change,ctrl-f)+change-prompt(2. fzf> )+enable-search+rebind(ctrl-r)+transform-query(echo {q} > /tmp/ag-fzf-r; cat /tmp/ag-fzf-f)" \
            --bind "ctrl-r:unbind(ctrl-g)+change-prompt(1. grep> )+disable-search+reload($AG_PREFIX {q} || true)+rebind(change,ctrl-f)+transform-query(echo {q} > /tmp/ag-fzf-f; cat /tmp/ag-fzf-r)" \
            --bind "start:unbind(ctrl-g)" \
            --prompt '1. grep> ' \
            --delimiter : \
            --header '╱ CTRL-R (grep mode) ╱ CTRL-F (fzf mode) ╱' \
            --preview 'bat --color=always {1} --highlight-line {2}' \
            --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
            --bind 'enter:become(nvim {1} +{2})'
end
