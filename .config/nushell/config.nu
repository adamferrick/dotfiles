$env.PATH = ($env.PATH | append '/~/.local/bin/')

$env.PROMPT_COMMAND = { ||
    let branch = if (git branch --show-current | complete).exit_code == 0 {
        $"(ansi bg_red)(ansi def) \((git branch --show-current)\) (ansi red)"
    } else {
        $""
    }
    $"\n(ansi def)(ansi bg_b) (whoami)@(sys host | get hostname) (ansi b)(ansi bg_g)(ansi def) ($env.PWD) (ansi g)($branch)(ansi bg_def)\n"
}

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
