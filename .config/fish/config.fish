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



fish_vi_key_bindings

function fish_mode_prompt
end

set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace underscore
