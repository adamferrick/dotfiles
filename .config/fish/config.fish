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

fish_default_key_bindings

abbr -a --position anywhere ntags ctags --excmd=number
abbr -a --position anywhere wec watchexec -c clear
abbr -a ydp yt-dlp -S "'res:480'" -o "'%(playlist_index)s - %(title)s.%(ext)s'"



# Color scheme for fzf

set -l bg '#0f141a'
set -l fg '#f6f6f6'
set -l black '#0f141a'
set -l red '#b3451d'
set -l green '#769c51'
set -l yellow '#bd7039'
set -l blue '#396c9e'
set -l magenta '#655d91'
set -l cyan '#519ca6'
set -l white '#bbb1b1'
set -l bright_black '#485251'
set -l bright_red '#e06a46'
set -l bright_green '#c3db69'
set -l bright_yellow '#e8c95a'
set -l bright_blue '#549ee3'
set -l bright_magenta '#e89df2'
set -l bright_cyan '#a7e7eb'
set -l bright_white '#f6f6f6'

set -x FZF_DEFAULT_OPTS "--layout 'reverse' --height '95%'"\
" --color=bg+:$bg,bg:$bg,spinner:$bright_blue,hl:bold:underline:italic:-1"\
" --color=fg:$fg,header:$bright_magenta,info:$bright_green,pointer:$bright_blue"\
" --color=marker:$bright_blue,fg+:$fg:bold:underline:italic,prompt:$bright_blue,hl+:reverse:-1"

set -x VCPKG_ROOT ".local/share/vcpkg"
