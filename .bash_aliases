sedline() { for var in "$@"; do echo -n "-e ${var}p "; done; }
gitfile() { git status|grep modified|sed -n `sedline $@`|cut -d':' -f2; }
gd() { git diff `gitfile $@`;}
gc() { git commit -v `gitfile $@`; }

#pretty print json
alias pp="python -mjson.tool | pygmentize -l js"

#git shortcuts
alias gs="git status"
alias gpr="git pull --rebase"
alias gca="git commit --amend"
alias gp="git push"
alias gspp="git stash save && git pull --rebase && git stash pop"
alias gsppp="git stash save && git pull --rebase && git stash pop && git push"
alias gss="git stash save"
alias gsp="git stash pop"
alias gsync="gss && gpr && gp && gsp"
gch() { git checkout -- `gitfile $@`;}
ga() { git add -- `gitfile $@`;}
