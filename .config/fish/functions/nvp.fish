function nvp
    set file $(
        find $argv -type f |
        fzf \
            --preview-window="50%" \
            --preview="bat --color=always {1}"
    ) && nvim $(echo "$file")
end
