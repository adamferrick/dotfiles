if status is-interactive
    # Commands to run in interactive sessions can go here
end



# Start X at login

if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end



set -g fish_greeting



fish_add_path ~/.ghcup/bin



# Settings for vi emulation in the shell REPL

fish_vi_key_bindings

function fish_mode_prompt
end

set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace underscore



abbr -a --position anywhere ntags ctags --excmd=number
abbr -a --position anywhere ff firefox --new-window



# Color scheme for fzf

set -l black '#26282a'
set -l red '#ff8878'
set -l green '#b4fb73'
set -l yellow '#fffcb7'
set -l blue '#8bbce5'
set -l magenta '#ffb2fe'
set -l cyan '#a2e1f8'
set -l white '#f1f1f1'
set -l bright_black '#6f6f6f'
set -l bright_red '#fe978b'
set -l bright_green '#d6fcba'
set -l bright_yellow '#fffed5'
set -l bright_blue '#c2e3ff'
set -l bright_magenta '#ffc6ff'
set -l bright_cyan '#c0e9f8'
set -l bright_white '#ffffff'

set -l FZF_NON_COLOR_OPTS

for arg in (echo $FZF_DEFAULT_OPTS | tr " " "\n")
    if not string match -q -- "--color*" $arg
        set -a FZF_NON_COLOR_OPTS $arg
    end
end

set -Ux FZF_DEFAULT_OPTS "$FZF_NON_COLOR_OPTS"\
" --color=bg+:$black,bg:$black,spinner:$bright_blue,hl:$red"\
" --color=fg:$blue,header:$magenta,info:$bright_green,pointer:$bright_green"\
" --color=marker:$bright_red,fg+:$cyan,prompt:$bright_green,hl+:$bright_red"
