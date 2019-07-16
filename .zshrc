autoload -U compinit promptinit
compinit

##################
#### Antibody ####
##################
source <(antibody init)
antibody bundle < ~/.zsh_plugins



###################
#### Variables ####
###################
export EDITOR=emacs
export VISUAL=emacs
export GOPATH=~/go
export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
export MYSQL_PS1="\U:\p [\d]: "
tmp_PS1=$PS1



#################
#### Aliases ####
#################
alias :q='exit'
alias zz='exit'
alias pacaur='sudo pacman -Sy'
alias pacinstall='sudo pacman -S'
alias ls='ls --color=auto'


###################
#### Functions ####
###################
rule0(){ #print an horizontal line
    LINE=$COLUMNS
    printf '\e[5m\e[90m%*s\n' "${LINE:-$(tput cols)}" '' | tr ' ' -
}
precmd(){ #execute before the prompt
    eval "rule0"
}
preexec(){ #execute after the prompt
    
}
