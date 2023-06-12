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
fish_add_path ~/.local/bin



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

set -l bg '#0f141a'
set -l fg '#f6f6f6'
set -l black '#131310'
set -l red '#9c3e3e'
set -l green '#788251'
set -l yellow '#d17c32'
set -l blue '#35558c'
set -l magenta '#bd679f'
set -l cyan '#2c9db7'
set -l white '#3f3f4d'
set -l bright_black '#5c6666'
set -l bright_red '#cf6772'
set -l bright_green '#abb58d'
set -l bright_yellow '#e1ae68'
set -l bright_blue '#5c8ecc'
set -l bright_magenta '#e89df2'
set -l bright_cyan '#74ddf2'
set -l bright_white '#edf0e4'

set -l FZF_NON_COLOR_OPTS "--layout 'reverse' --height '95%'"

for arg in (echo $FZF_DEFAULT_OPTS | tr " " "\n")
    if not string match -q -- "--color*" $arg
        set -a FZF_NON_COLOR_OPTS $arg
    end
end

set -Ux FZF_DEFAULT_OPTS "$FZF_NON_COLOR_OPTS"\
" --color=bg+:$bg,bg:$bg,spinner:$bright_blue,hl:$bright_red"\
" --color=fg:$bright_blue,header:$bright_magenta,info:$bright_green,pointer:$bright_green"\
" --color=marker:$bright_red,fg+:$bright_cyan,prompt:$bright_green,hl+:$bright_red"
