# Aliases
c() { cd ~/Projects/$1;  }

_c() { _files -W ~/Projects -/; }
compdef _c c
