$env.PROMPT_COMMAND = { ||
    let branch = if (git branch --show-current | complete).exit_code == 0 {
        $"(ansi bg_red)(ansi def) \((git branch --show-current)\) (ansi red)"
    } else {
        $""
    }
    $"\n(ansi def)(ansi bg_b) (whoami)@(sys host | get hostname) (ansi b)(ansi bg_g)(ansi def) ($env.PWD) (ansi g)($branch)(ansi bg_def)\n"
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
