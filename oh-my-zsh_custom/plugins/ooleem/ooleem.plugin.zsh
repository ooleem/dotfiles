# Aliases
alias ggraph='git log --graph --date-order -C -M --pretty=format:"<%h> %ad [%an] %Cgreen%d%Creset %s" --all --date=short'

c() { cd ~/Projects/$1;  }

_c() { _files -W ~/Projects -/; }
compdef _c c
