#############################
#           _               #
#   _______| |__  _ __ ___  #
#  |_  / __| '_ \| '__/ __| #
# _ / /\__ \ | | | | | (__  #
#(_)___|___/_| |_|_|  \___| #
#                           #
#############################

autoload -U compinit 
compinit

eval "$(starship init zsh)"

alias open="xdg-open"
alias ls="exa"
alias la="ls -la"
alias ll="ls -l"
alias htop="btm"
alias cat="bat"
alias tmux="tmux -2 -u -f ~/.config/tmux/tmux.conf"
alias vim="nvim"
alias paru="paru --bottomup"
#alias docker="podman"
#alias docker-compose="podman-compose"
#alias kubectl="microk8s.kubectl"
alias bc="bc -l"
alias cal="cal --monday"
alias :q="exit"
alias sudo="doas"

# To correct ghost characters using double-width characters with starship.rs
export LC_ALL=en_US.UTF-8

export TERM=xterm-256color
export EDITOR=nvim
export VISUAL=nvim
export GOPATH=~/go
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/bin"
export MYSQL_PS1="\U:\p [\d]: "
export MANPAGER="sh -c 'sed -e s/.\\\\x08//g | bat -l Manpage -p'"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Temporary workaround to ':w !sudo tee %' in nvim
export SUDO_ASKPASS='/usr/lib/ssh/x11-ssh-askpass'

# Hisotry is not being read with zinit so I have to define HISTFILE manually
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# completion menu
zmodload zsh/complist
zstyle ':completion:*' menu yes select

# Case insensitive on tab
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

eval $(env TERM=xterm256-color dircolors)

# colors for completion menu
eval "$(dircolors)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Key Bindings
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3;5~" kill-word
bindkey "^H" backward-kill-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey '^[[3~' delete-char

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

#zinit snippet OMZ::lib/git.zsh
zinit light zsh-users/zsh-autosuggestions
#zinit light zsh-users/zsh-syntax-highlighting
zinit light zdharma/fast-syntax-highlighting
