# fuzzy grep open
function nvg
    set match $(
        ag --nobreak --noheading -i $argv |
        fzf -0 -1 |
        awk -F: '{print $1, $2}'
    )

    set path $(echo $match | cut --delimiter=' ' -f1)
    set line $(echo $match | cut --delimiter=' ' -f2)

    if test -e $path
        nvim "$path" +"$line"
    end
end
