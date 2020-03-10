# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
#export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
export PATH="$HOME/.config/composer/vendor/bin:$PATH:$HOME/.cargo/bin:$HOME/bin"
export MYSQL_PS1="\U:\p [\d]: "
tmp_PS1=$PS1

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
