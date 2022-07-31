function fish_prompt
    printf '\n'

    set_color black
    set_color -b green
    printf ' %s@%s ' $USER $hostname

    set_color green
    set_color -b yellow
    printf ''

    set_color black
    printf ' %s ' $PWD

    set_color normal
    set_color yellow

    if git rev-parse --git-dir > /dev/null 2>&1
        set_color -b cyan
        printf ''

        set_color black
        printf '%s ' (fish_git_prompt)

        set_color normal
        set_color cyan
    end

    printf ''

    set_color normal
    printf '\n'
    printf '$ '
end
