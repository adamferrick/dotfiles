function fish_prompt
    printf '\n'

    set_color normal
    set_color -b blue
    printf ' %s@%s ' $USER $hostname

    set_color blue
    set_color -b green
    printf ''

    set_color normal
    set_color -b green
    printf ' %s ' $PWD

    set_color normal
    set_color green

    if git rev-parse --git-dir > /dev/null 2>&1
        set_color -b red
        printf ''

        set_color normal
        set_color -b red
        printf '%s ' (fish_git_prompt)

        set_color normal
        set_color red
    end

    printf ''

    set_color normal
    printf '\n'
    printf '$ '
end
