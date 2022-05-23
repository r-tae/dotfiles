eval "$(/opt/homebrew/bin/brew shellenv)"

set fish_greeting ""

set -gx TERM screen-256color

alias ls "ls -p -G"
alias ls "exa --all"
alias ll "exa --long"
alias la "ll --all"

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

command -qv nvim && alias vim nvim

set -gx EDITOR nvim

starship init fish | source

set -gx SHELL $(which fish)
set -gx COLORTERM = truecolor

# Adapted from https://github.com/fish-shell/fish-shell/issues/4434#issuecomment-332626369
# only run in interactive (not automated SSH for example)
if status is-interactive
# don't nest inside another tmux
and not set -q TMUX
  # Adapted from https://unix.stackexchange.com/a/176885/347104
  # Create session 'main' or attach to 'main' if already exists.
  exec tmux new-session -A -s main
	# using `exec' is a tradeoff; it means you don't have to `exit' twice just to close a terminal window but if tmux has errors, fish will be unusable.
end
