# fuzzy path name open
function np
    rm -f /tmp/find-fzf-{r,f}
    set FIND_INLINE 'find {q} -type f'
    find $argv -type f |
        fzf \
            --disabled --query "$argv" \
            --bind "change:reload:sleep 0.1; $FIND_INLINE || true" \
            --bind "ctrl-f:unbind(change,ctrl-f)+change-prompt(2. fzf> )+enable-search+rebind(ctrl-r)+transform-query(echo {q} > /tmp/find-fzf-r; cat /tmp/find-fzf-f)" \
            --bind "ctrl-r:unbind(ctrl-r)+change-prompt(1. find> )+disable-search+reload($FIND_INLINE || true)+rebind(change,ctrl-f)+transform-query(echo {q} > /tmp/find-fzf-f; cat /tmp/find-fzf-r)" \
            --bind "start:unbind(ctrl-r)" \
            --prompt '1. find> ' \
            --delimiter : \
            --header '╱ CTRL-R (find mode) ╱ CTRL-F (fzf mode) ╱' \
            --layout "reverse" \
            --height '95%' \
            --preview 'bat --color=always {1}' \
            --preview-window 'down,60%,border-top' \
            --bind 'enter:become(nvim {1})'
end
