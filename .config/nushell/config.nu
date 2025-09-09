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
