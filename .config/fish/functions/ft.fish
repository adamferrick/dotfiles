function ft
    [ -e tags ] &&
    set line $(
        awk 'BEGIN { FS="\t" } !/^!/ {print toupper($4)"\t"$1"\t"$2"\t"$3}' tags |
        fzf \
            --nth=1,2 \
            --with-nth=2 \
            --preview-window="50%" \
            --preview="bat --color=always --line-range \$(echo {4} | tr -d \";\\\"\"): {3}"
    ) && nvim $(echo "$line" | cut -f3) -c "silent tag $(echo "$line" | cut -f2)"
end
