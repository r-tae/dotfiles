eval "$(/opt/homebrew/bin/brew shellenv)"

if status is-interactive
    if not set -q TMUX
        exec tmux
    end
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

set -gx TERM xterm-256color

alias ls "ls -p -G"
alias ls "exa --all"
alias ll "exa --long"
alias la "ll --all"

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

command -qv nvim && alias vim nvim

set -gx EDITOR nvim

starship init fish | source
