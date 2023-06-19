# fuzzy tags open
function nt
    [ -e tags ] &&
    set line $(
        awk 'BEGIN { FS="\t" } !/^!/ {print $1"\t"$2"\t"$3"\t"$4"\t"$5}' tags |
        column -t |
        string replace -r ';"' '' |
        fzf \
            --with-nth=1,2,3,4,5 \
            --preview-window "down,60%,border-top,+{3}+3/3,~3" \
            --preview "bat --color=always {2} --highlight-line {3}" |
        string replace -a -r '  +' '\t'
    ) && nvim $(echo "$line" | cut -f2) -c "silent tag $(echo "$line" | cut -f1)"
end
