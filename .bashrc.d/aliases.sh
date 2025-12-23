# Some useful aliases.

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

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

alias grep='grep --color=auto'

alias zombie='ps ex | awk "\$3==\"Z\"{print \$1, \$5}"'

alias wttr-ta='curl wttr.in/tel-aviv'
alias wttr-hi='curl wttr.in/haifa'
alias wttr-nt='curl wttr.in/netanya'

case "$OSTYPE" in
    linux*)
	alias df='df -hT -x tmpfs -x devtmpfs -x nfs4'
	;;
    darwin*)
	alias df='df -P -h -T hfs,apfs,exfat,ntfs'
	;;
esac


alias lsblk2='lsblk -o type,name,label,partlabel,size,fstype,model,serial,wwn,uuid'

alias dcup='docker compose up -d'
alias dcdown='docker compose down'
alias dcps='docker compose ps'
alias dclogs='docker compose logs -f'
alias dcrestart='docker compose restart'
alias dcbuild='docker compose build'

alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias dtf='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
