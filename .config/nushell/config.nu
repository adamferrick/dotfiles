$env.PATH = ($env.PATH | append '/~/.local/bin/')

$env.PROMPT_COMMAND = { ||
    let branch = if (git branch --show-current | complete).exit_code == 0 {
        $"(ansi bg_red)(ansi def) \((git branch --show-current)\) (ansi red)"
    } else {
        ""
    }
    $"\n(ansi def)(ansi bg_b) (whoami)@(sys host | get hostname) (ansi b)(ansi bg_g)(ansi def) ($env.PWD) (ansi g)($branch)(ansi bg_def)\n"
}

$env.PROMPT_COMMAND_RIGHT = ""

$env.config.show_banner = false

let bg = '#0f141a'
let fg = '#f6f6f6'
let black = '#0f141a'
let red = '#b3451d'
let green = '#769c51'
let yellow = '#bd7039'
let blue = '#396c9e'
let magenta = '#655d91'
let cyan = '#519ca6'
let white = '#bbb1b1'
let bright_black = '#485251'
let bright_red = '#e06a46'
let bright_green = '#c3db69'
let bright_yellow = '#e8c95a'
let bright_blue = '#549ee3'
let bright_magenta = '#e89df2'
let bright_cyan = '#a7e7eb'
let bright_white = '#f6f6f6'

$env.FZF_DEFAULT_OPTS = $"
    --layout 'reverse'
    --height '95%'
    --color=bg+:($bg)
    --color=bg:($bg)
    --color=spinner:($bright_blue)
    --color=hl:bold:underline:italic:-1
    --color=hl+:reverse:-1
    --color=fg+:($fg):bold:underline:italic
    --color=fg:($fg)
    --color=header:($bright_magenta)
    --color=info:($bright_green)
    --color=pointer:($bright_blue)
    --color=marker:($bright_blue)
    --color=prompt:($bright_blue)
"

def lf [] {
    let program = try {(
        $env.PATH |
            where { |p| $p | path exists } |
            each { |p| ls $p | get name | path basename } |
            flatten |
            str join "\n" |
            fzf --header "Launch app"
    )} catch { "" }

    if $program != "" {
        commandline edit $"i3-launch ($program)"
    }
}

def kf --wrapped [...argv] {
    let file = try {(
        fd -t f --color=always ...$argv |
        fzf
            --ansi
            --delimiter :
            --preview 'bat --color=always {1}'
            --preview-window 'down,60%,border-top'
    )} catch { "" }

    if $file != "" {
        commandline edit $"kak ($file)"
    }
}

def kg --wrapped [...argv] {
    let match = try {(
        rg --color=always --trim --line-number --no-heading --smart-case ...$argv |
        fzf --ansi
            --delimiter :
            --preview 'bat --color=always {1} --highlight-line {2}'
            --preview-window 'down,60%,border-top,+{2}+3/3,~3'
    )} catch { "" }

    if $match != "" {
        let split = $match | split row :
        let file = { path: $split.0, line: $split.1 }
        commandline edit $"kak ($file.path) +($file.line)"
    }
}

def kt [] {
    let color = { |kind|
        match $kind {
            "C" => (ansi lr),
            "s" => (ansi lg),
            "c" => (ansi lg),
            "e" => (ansi lg),
            "g" => (ansi lg),
            "t" => (ansi lg),
            "i" => (ansi lg),
            "P" => (ansi ly),
            "f" => (ansi ly),
            _ => (ansi def)
        }
    }

    let process_line = { |line|
        let fields = $line | split row --regex "\\s+"
        let tag = {
            name: $fields.0
            path: $fields.1
            number: ($fields.2 | str substring ..-3)
            kind: $fields.3
            info: (if ($fields | length) == 5 { $" ($fields.4)" } else { "" })
        }
        $"(do $color $tag.kind)($tag.name) (ansi lp)($tag.path) (ansi lg)($tag.number) (ansi def)($tag.kind)($tag.info)"
    }

    let tag = try {(
        open tags |
            lines |
            where not ($it starts-with "!_") |
            each { do $process_line $in } |
            str join "\n" |
            column -t |
            fzf
                --ansi
                --delimiter "\\s+"
                --preview 'bat --color=always {2} --highlight-line {3}'
                --preview-window 'down,60%,border-top,+{3}+3/3,~3'
    )} catch { "" }

    if $tag != "" {
        let split = $tag | split row --regex "\\s+"
        let file = { path: $split.1, line: $split.2 }
        commandline edit $"kak ($file.path) +($file.line)"
    }
}
