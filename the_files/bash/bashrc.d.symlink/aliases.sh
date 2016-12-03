# -*- shell-script -*-
# Some useful aliases.

# alias tmux='TERM=xterm-256color tmux'

alias mygit='git --git-dir=$HOME/.myconfig.git/ --work-tree=$HOME'

alias texclean='rm -f *.toc *.aux *.log *.cp *.fn *.tp *.vr *.pg *.ky'

alias j="jobs -l"

#alias la='ls -A'
#alias l='ls -CF'

alias l='ls -l'
alias ll='ls -l'
alias llf='ls -lF'
alias lsf='ls -F'
alias la='ls -a'
alias dot='ls -d .[a-zA-Z0-9_]*'

# dot ()
# {
#     ls -d $1/.[a-zA-Z0-9_]*
# }

alias c='clear;date'
alias a=alias

# alias h='history'
alias h='fc -l' #history
alias r='fc -s'

alias x=exit

alias pd='cd $OLDPWD'
alias pu="pushd"
alias po="popd"

alias ..='cd ..'
alias cd..='cd ..'
alias lfo=list_files_only
alias lsd='ls -d */'

alias e='run_emacs'
alias e24='run_emacs24'
alias enw='/usr/bin/emacs -nw'
alias e24nw='~/src/emacs/emacs-build/src/emacs -nw --no-desktop --no-splash'
alias e2nw='/usr/local/bin/emacs --no-splash -nw'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

alias grep='grep --color=auto'

alias rt='xterm -bg black -fg wheat -geometry 80x32+150+50 -e "sux -" &'
alias xt='xterm -bg black -fg wheat -geometry 80x32+150+50  &'


alias zombie='ps ex | awk "\$3==\"Z\"{print \$1, \$5}"'


alias ffdev='firefox --no-remote -P amit-dev >/dev/null 2>&1 &'

alias quickweb='python -c "import SimpleHTTPServer;SimpleHTTPServer.test()"'
