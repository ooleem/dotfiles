# oh-my-zsh configuration
ZSH_THEME="ooleem"
plugins=(rails3 git ooleem thor bundler ruby)
DISABLE_AUTO_UPDATE="true"

alias ssh='ssh -Y'
alias .='pwd'
alias ..='cd ..'
alias rspec='rspec -c'
alias rm='rm -i'
alias cp='cp -i'

set -o vi
bindkey -v
unsetopt correct_all
