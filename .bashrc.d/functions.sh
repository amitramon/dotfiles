
# Add an element to PATH
add_to_path()
{
    if [ -d "$1" ] ; then
	if ! echo $PATH | /usr/bin/egrep -q "(^|:)$1($|:)" ; then
	    if [ "$2" = "last" ] ; then
		PATH=$PATH:$1
	    else
		PATH=$1:$PATH
	    fi
	fi
    fi
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

# Add an alias to the current shell and to
# the aliases file.
add-alias ()
{
    local name=$1 value="$2"
    local aliases=~/.bashrc.d/aliases
    echo "" >> $aliases
    echo alias $name=\'$value\' >> $aliases
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


function list_files_only()
{
    ls $* $(ls -p | grep -v '[/=@|]$')
}

psgrep()
{
	ps aux | grep $1 | grep -v grep
}


# aptitude package management helpers

# list explicitly installed packages (i.e., not throuh dependencies)
function apt_installed()
{
    aptitude search '~i !~M' -F"%p"
}

# search for installed packages by pattern
function apt_regex()
{
    aptitude search "~i~n${1}" -F"%p"
}

# search for installed obsolete packages
function apt_obsolete()
{
    aptitude search ~o -F"%p"
}

# what depends on a package
function apt_rdepends()
{
    aptitude search "~i~D${1}"
}

function apt_not_debian()
{
    aptitude search "~i ! ~Odebian"
}

function apt_log_installed()
{
    sed -n  's/\[INSTALL\] \([^:]\+\):.*/\1/p' $1
}
