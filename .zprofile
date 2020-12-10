
export LF_ICONS="\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.7z=:\
*.a=:\
*.mkv=:\
"


export PATH="$PATH:/home/vishi/bin"
export PAGER=vimpager



export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"


export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

#export LANG=en_US.utf8
#export LC_CTYPE="en_US.utf8"
#export LC_NUMERIC=\"en_US.utf8\"
#export LC_TIME=en_US.utf8
#export LC_COLLATE=C
#export LC_MONETARY=\"en_US.utf8\"
#export LC_MESSAGES=C
#export LC_PAPER=\"en_US.utf8\"
#export LC_NAME=\"en_US.utf8\"
#export LC_ADDRESS=\"en_US.utf8\"
#export LC_TELEPHONE=\"en_US.utf8\"
#export LC_MEASUREMENT=\"en_US.utf8\"
#export LC_IDENTIFICATION=\"en_US.utf8\"
#export LC_ALL=


#[ "$(tty)" = "/dev/tty1" ] && startx
[ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ] && startx
