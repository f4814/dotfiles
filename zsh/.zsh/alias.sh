# ls
alias l="ls --color=auto"
alias ls="ls --color=auto"
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

# development
alias g='git'

alias s='stack'
alias lhoogle="stack exec hoogle -- server --port 8080 --local > /dev/null &"

alias vfg="fg %vim"

# package management
alias pcm='pacman'

# udiskie
alias mountu='udiskie-mount'
alias umountu='udiske-umount'

# sudo
alias sry='sudo $(fc -ln -1)'

# exit
alias q="exit"
alias ":q"="exit"
alias c="clear"

# Vim
alias v='vim'
alias vms='vim -S vimsession'

alias md5rec="find . -type f -exec md5sum {} +"
alias ccat='pygmentize -g'

##########################################################################
## Source: http://aur.archlinux.org/packages/lolbash/lolbash/lolbash.sh ##
##########################################################################
alias wtf='dmesg'
alias rtfm='man'
alias visible='echo'
alias invisible='cat'
alias moar='more'
alias icanhas='mkdir'
alias donotwant='rm'
alias dowant='cp'
alias gtfo='mv'
alias hai='cd'
alias plz='pwd'
alias nomz='ps aux | less'
alias nomnom='killall'
alias cya='reboot'
alias kthxbai='halt'
alias fucking='sudo'
