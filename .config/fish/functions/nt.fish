# fuzzy tags open
function nt
    [ -e tags ] &&
    awk 'BEGIN { FS="\t" } !/^!/ {print toupper($4)"\t"$1"\t"$2"\t"$3}' tags |
    string replace -r ';"$' '' |
    fzf \
        --with-nth=2 \
        --layout "reverse" \
        --height '95%' \
        --preview-window "down,60%,border-top,+{4}+3/3,~3" \
        --preview "bat --color=always {3} --highlight-line {4}" \
        --bind "enter:become(nvim {3} +{4})"
end
