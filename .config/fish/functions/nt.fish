# fuzzy tags open
function nt
    [ -e tags ] &&
    set line $(
        awk 'BEGIN { FS="\t" } !/^!/ {print toupper($4)"\t"$1"\t"$2"\t"$3}' tags |
        string replace -r ';"$' '' |
        fzf \
            --with-nth=1,2,3 \
            --layout "reverse" \
            --height '95%' \
            --preview-window "down,60%,border-top,+{4}+3/3,~3" \
            --preview "bat --color=always {3} --highlight-line {4}"
    ) && nvim $(echo "$line" | cut -f3) -c "silent tag $(echo "$line" | cut -f2)"
end
