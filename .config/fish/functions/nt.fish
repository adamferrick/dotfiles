# fuzzy tags open
function nt
    [ -e tags ] &&
    set line $(
        awk '
            BEGIN { FS="\t"; OFS="" } !/^!/ {
                switch ($4) {
                    case "C":
                        color = "\033[91m";
                        break
                    case "s":
                        color = "\033[92m";
                        break
                    case "c":
                        color = "\033[92m";
                        break
                    case "f":
                        color = "\033[93m";
                        break
                    default:
                        color = "\033[94m";
                        break
                }
                normal = "\033[94m";
                print color,$1,normal,"\t"$2"\t"$3"\t",color,$4,normal,"\t"$5
            }
        ' tags |
        column -t |
        string replace -r ';"' '' |
        fzf \
            --ansi \
            --preview-window "down,60%,border-top,+{3}+3/3,~3" \
            --preview "bat --color=always {2} --highlight-line {3}" |
        string replace -a -r '  +' '\t'
    ) && nvim $(echo "$line" | cut -f2) -c "silent tag $(echo "$line" | cut -f1)"
end
