dropbox-hila()
{
    (
	local HOME=~/.dropboxes/hila
	cd $HOME/Dropbox
	dropbox.py $@ # start -i
    )
}

dropbox-amit()
{
    (
	local HOME=~/.dropboxes/amit
    	cd $HOME/Dropbox
	dropbox.py $@ # start -i
    )
}


ff ()
{
    LC_ALL=he_IL.UTF-8 firefox $@ &
}

# use colors
less ()
{
   /usr/bin/less -R $@
}

envof ()
{
    sed 's:\x0:\n:g' /proc/${1}/environ | sort
}

# help man display characters correctly
man ()
{
   LANG=POSIX /usr/bin/man $@
}


firewall-restart ()
{
    su -c '/etc/init.d/firewall.iptables restart'
}



# Function which adds an alias to the current shell and to
# the ~/.bash_aliases file.
add-alias ()
{
   local name=$1 value="$2"
   echo "" >>~/.bash_aliases
   echo alias $name=\'$value\' >>~/.bash_aliases
   eval alias $name=\'$value\'
   alias $name
}

# "repeat" command.  Like: repeat 10 echo foo
repeat ()
{ 
    local count="$1" i;
    shift;
    for i in $(seq 1 "$count");
    do
        eval "$@";
    done
}

# Subfunction needed by `repeat'.
# amit: not required because of /usr/bin/seq; besides
# it has a bug: it prints extra number
# seq ()
# { 
#     local lower upper output;
#     lower=$1 upper=$2;

#     if [ $lower -ge $upper ]; then return; fi
#     while [ $lower -le $upper ];
#     do
# 	echo -n "$lower "
#         lower=$(($lower + 1))
#     done
#     echo "$lower"
# }

function hlp()
{
    $1 --help
}

function clean_dir()
{
	echo -n "Really clean this directory? ";
	read answer;
	if test "$answer" = "y"; then
	   rm -f \#* *~ .*~ *.bak .*.bak  *.tmp .*.tmp core a.out;
	   echo "Cleaned.";
	else
	   echo "Not cleaned.";
	fi
}

function disk_free()
{
	df |egrep  '/dev/hda'| \
	awk 'BEGIN {sum=0} \
	{ printf "%s  (%-12s):  %20d\n",$1,$6, $3;sum+=$3 } \
	END{print "------------------------------------------------"; \
	print "total:                                   " sum}'
}

function list_files_only()
{
    ls $* $(ls -p | grep -v '[/=@|]$')
}

psgrep()
{
	ps aux | grep $1 | grep -v grep
}

#
# This is a little like `zap' from Kernighan and Pike
#

pskill()
{
	local pid

	pid=$(ps ax | grep $1 | grep -v grep | awk '{ print $1 }')
	echo -n "killing $1 (process $pid)..."
	kill -9 $pid
	echo "slaughtered."
}

term()
{
        TERM=$1
	export TERM
	tset
}

#xtitle () 
#{ 
#	echo -n -e "\033]0;$*\007"
#}

xtitle () 
{ 
  XTITLE=$*
  PROMPT_COMMAND='echo -ne "\033]0;${XTITLE}\007"'
}

xtitle-reset () 
{ 
  PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
}


#cd()
#{
#  builtin cd "$@" && xtitle $HOST: $PWD
#}

bold()
{
	tput smso
}

unbold()
{
	tput rmso
}

if [ -f /unix ] ; then
clear()
{
	tput clear
}
fi

rot13()
{
	if [ $# = 0 ] ; then
		tr "[a-m][n-z][A-M][N-Z]" "[n-z][a-m][N-Z][A-M]"
	else
		tr "[a-m][n-z][A-M][N-Z]" "[n-z][a-m][N-Z][A-M]" < $1
	fi
}

watch()
{
        if [ $# -ne 1 ] ; then
                tail -f nohup.out
        else
                tail -f $1
        fi
}

#
#       Remote login passing all 8 bits (so meta key will work)
#
rl()
{
        rlogin $* -8
}

function setenv()
{
	if [ $# -ne 2 ] ; then
		echo "setenv: Too few arguments"
	else
		export $1="$2"
	fi
}

# function chmog()
# {
# 	if [ $# -ne 4 ] ; then
# 		echo "usage: chmog mode owner group file"
# 		return 1
# 	else
# 		chmod $1 $4
# 		chown $2 $4
# 		chgrp $3 $4
# 	fi
# }



# * Finding the source revision of a tag:
# svn log -v -q --stop-on-copy \
# file:///usr/local/svn/repos/django/ar/arsys/tags/release-0.0 \
#  | grep '  A'

function svn-ls-tags()
{
    svn ls $REPOS_URL/django/$1/$2/tags
}

function svn-tag-info()
{
    svn_path=$REPOS_URL/django/$1/$2/tags/$3
    svn log -v -q --stop-on-copy $svn_path | grep '  A'
}


# Demonstration of format string pipes. Sets the xterm title and returns the
# string unchanged.
#
# Example usage:
# set status_format="mutt_xtitle '%r %f (%L) [Msgs:%?M?%M/?%m%?n? New:%n?%?d? Del:%d?%?F? Flag:%F?%?t? Tag:%t?%?p? Post:%p?%?b? Inc:%b?]'|"
function set_mutt_title()
{
    printf "\033]0;$1\007" > /dev/tty
    echo "$2"
}

function ml()
{
    local geo
    if [ "$1" == "v" ]; then
	geo=100x50+1000+40
    else
	geo=100x36+180+5
    fi

    MUTT_HTML_TEMPLATE_DIR=~/arsys/htmlmail/templates/template.html \
    PYTHONPATH=~/src/python:~/arsys:$PYTHONPATH \
	mlterm  --geometry=$geo --name=my-mail-term &
}

function my-mutt()
{
    MUTT_HTML_TEMPLATE_DIR=~/arsys/htmlmail/templates/template.html \
    PYTHONPATH=~/arsys:$PYTHONPATH mutt
}

function ml2()
{
    MUTT_HTML_TEMPLATE_DIR=~/arsys/htmlmail/templates/template.html \
    PYTHONPATH=~/arsys:$PYTHONPATH \
	mlterm  --geometry=100x50+300+20 --name=my-mail-term &
}


function setkeys()
{
    [ -x /usr/bin/keychain -o -x /usr/local/bin/keychain ] && \
	eval $(keychain --agents ssh --eval --quiet id_rsa)
}


function en2ar()
{
    dict -h localhost -d fd-eng-ara $@ | colorit
}

function tes()
{
    dict -h localhost -d moby-thesaurus $@ | colorit | less
}

# function d()
# {
#     dict -h localhost -d gcide $1
# }

function d()
{
    dict $@ | colorit | less
}


function pdfreducesize()
{
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 \
	-dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH \
	-sOutputFile=$1 $2
}

function my-diff()
{
    diff $@ | pygmentize -l diff
}

function rename-nokia-c2-photos()
{
    for x in *.jpg; do
	mv $x $(echo $x | sed 's/\(.*\)\([0-9]\{4\}\)\(\.jpg\)/ar-\2\3/')
    done
}

# http://www.ehow.com/how_6525570_convert-amr-mp3-ubuntu.html

function amr-to-mp3()
{
    # ffmpeg -i yourfile.amr -ab 128k yourfile.mp3
    ffmpeg -i $1 -ab 128k $2
}


function =()
{
    echo "${1}"|wcalc;
}