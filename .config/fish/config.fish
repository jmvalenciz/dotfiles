set TERM "xterm-256color"
set GOPATH "~/go"
set PATH "$PATH:$HOME/go/bin"
set PATH "$HOME/.config/composer/vendor/bin:$PATH:$HOME/.cargo/bin:$HOME/bin:$HOME/.local/bin"
set MYSQL_PS1 "\U:\p [\d]: "
#set CC "clang"
#set CXX "clang++"

alias open "xdg-open"
alias ls "exa"

kitty + complete setup fish | source
starship init fish | source
