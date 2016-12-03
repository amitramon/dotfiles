
# custom prompt start...
if [ "$UID" = "0" ]; then
    COLOR1="\[\033[1;31m\]"	# root's special color
else
    COLOR1="\[\033[0;32m\]"	# ordinary user
fi

COLOR2="\[\033[0;32m\]"
COLOR3="\[\033[0;33m\]"
COLOR4="\[\033[0m\]"

if [ "$BASH" ] && [ "$BASH" != "/bin/sh" ]; then
    PS1="\n$COLOR1\u$COLOR2@\h $COLOR3\w$COLOR4\n\\$ "
else
    if [ $(/usr/bin/id -u) -eq 0 ]; then
	PS1='# '
    else
	PS1='$ '
    fi
fi

# color values
# Black        0;30
# Dark Gray    1;30
# Red          0;31
# Light Red    1;31
# Green        0;32
# Light Green  1;32
# Brown        0;33
# Yellow       1;33
# Blue         0;34
# Light Blue   1;34
# Purple       0;35
# Light Purple 1;35
# Cyan         0;36
# Light Cyan   1;36
# Light Gray   0;37
# White        1;37

# custom prompt end
