#############################
#           _               #
#   _______| |__  _ __ ___  #
#  |_  / __| '_ \| '__/ __| #
# _ / /\__ \ | | | | | (__  #
#(_)___|___/_| |_|_|  \___| #
#                           #
#############################

eval "$(starship init zsh)"

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

#source /usr/share/nvm/init-nvm.sh
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search

autoload -U compinit 
#autoload -Uz select-word-style
autoload edit-command-line

compinit
#select-word-style bash

#alias sudo="doas"
alias k="kubectl"
alias vim="nvim"
#alias ssh="kitty +kitten ssh"
alias ssh="TERM=xterm ssh"
alias open="xdg-open"
alias ls="exa -Hh"
alias la="ls -la"
alias ll="ls -l"
alias htop="btm"
alias cat="bat"
alias tmux="tmux -2 -u -f ~/.config/tmux/tmux.conf"
#alias vim="nvim"
alias paru="paru --bottomup"
alias crontab="fcrontab"
#alias docker="podman"
#alias docker-compose="podman-compose"
#alias kubectl="microk8s.kubectl"
alias bc="bc -lq"
alias :q="exit"
alias code="codium"
    #alias sudo="doas"

# To correct ghost characters using double-width characters with starship.rs
#export LC_ALL=en_US.UTF-8
export WORDCHARS="*?_.[]~=&;!#$%^{}<>"
#export TERM=xterm
export EDITOR=nvim
export VISUAL=nvim
export GOPATH=~/go
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"
#export JAVA_HOME='/usr/lib/jvm/java-8-openjdk'
#export PATH=$JAVA_HOME/bin:$PATH 

#export MYSQL_PS1="\U:\p [\d]: "
export MANPAGER="sh -c 'sed -e s/.\\\\x08//g | bat -l Manpage -p'"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Temporary workaround to ':w !sudo tee %' in nvim
export SUDO_ASKPASS='/usr/lib/ssh/x11-ssh-askpass'

# Hisotry is not being read with zinit so I have to define HISTFILE manually
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt inc_append_history
setopt inc_append_history_time
#setopt share_history
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

zle_highlight=('paste:none')

# completion menu
zmodload zsh/complist
zstyle ':completion:*' menu yes select

# Case insensitive on tab
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

eval $(env TERM=xterm256-color dircolors)

# colors for completion menu
eval "$(dircolors)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zle -N edit-command-line
zle -N backward-kill-space-word backward-kill-word-match
zle -N kill-space-word kill-word-match
zstyle :zle:backward-kill-space-word word-style space
zstyle :zle:kill-space-word word-style space

# Key Bindings
bindkey "^E" edit-command-line
bindkey "^[[1;5C" forward-word
bindkey "^[[1;3C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;3D" backward-word
bindkey "^[[3;5~" kill-space-word
#bindkey "^W" backward-kill-space-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey '^[[3~' delete-char
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -e

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=default
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=default


## [Completion] 
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/jmvalenciz/.dart-cli-completion/zsh-config.zsh ]] && . /home/jmvalenciz/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

