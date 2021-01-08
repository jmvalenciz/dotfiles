# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -U compinit promptinit
compinit

source <(antibody init)
antibody bundle < ~/.zsh_plugins

alias open="xdg-open"

#export CC=clang
#export CXX=clang++
export TERM=xterm-256color
export EDITOR=emacs
export VISUAL=emacs
export GOPATH=~/go
export PATH="$PATH:$HOME/go/bin"
export PATH="$HOME/.config/composer/vendor/bin:$PATH:$HOME/.cargo/bin:$HOME/bin:$HOME/.local/bin"
export MYSQL_PS1="\U:\p [\d]: "

eval $(env TERM=xterm256-color dircolors)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
