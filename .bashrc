alias ls='ls -G'
alias g='git'
# source git-completion.bashのpath
# source git-promptのpath

# git補完周りのpath
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=true
# bashプロンプトのカスタマイズ
export PS1='\[\033[0;33m\]\w \[\033[1;32m\]$(__git_ps1)\[\033[0m\]\n \[\033[1;32m\]$ \[\033[0m\]'

alias minicom="mkdir -p ~/minilog ; LANG=C minicom -C ~/minilog/`date +%y%m%d_%H%M%S`.log"
alias vi='vim'