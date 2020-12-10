
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[black]%}[%{$fg[white]%}%n%{$fg[white]%}@%{$fg[white]%}%M %{$fg[blue]%}%~%{$fg[black]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.


#case $TERM in
#    xterm*|rxvt*|st*|lf*|lfrun*)
#
#	    precmd () {print -Pn "\e]0;$(pwd)\a"}
##		command_in_title(){
##			case "$history" in
##				precmd*) ;;
##				*) precmd() {print -Pn "\e]0;$(echo $(history | tail -n1) | cut -d" " -f 2)\a" }
##					;;
##			esac
#
##			}
#	;;
#esac
#


LANG="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_ALL="en_US.UTF-8"

#MANPAGER
export MANPAGER="/bin/sh -c \"col -b | vim --not-a-term -c 'set ft=man ts=8 nomod nolist noma' -\""

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#alias
alias nnn='nnn -Hd'
alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'

alias ..='cd ..'
alias ../..='cd ../..'
alias xterm!='devour xterm'
alias urxvt!='devour urxvt'
alias alacritty!='devour alacritty'
alias termite!='devour termite'

alias mpv!='devour mpv'
alias sxiv!='devour sxiv'
alias feh!='devour feh'
alias pcmanf!='devour pcmanfm'
alias surf!='devour surf'
alias za='devour zathura'
alias p='sudo pacman'
alias d='devour'
alias n='nvim'
alias v='vim'
alias mdl='youtube-dl -f bestaudio --write-thumbnail'
alias ydl='youtube-dl --add-metadata'

alias cur='devour sxiv ./'

alias lf=' tmp="$(mktemp)" ; lf -last-dir-path="$tmp" "$@" ; if [ -f "$tmp" ]; then dir="$(cat "$tmp")" ; rm -f "$tmp" >/dev/null ; [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir" ; fi'

export VISUAL="/usr/bin/nvim"
export EDITOR="$VISUAL"

alias less=$PAGER
alias zless=$PAGER

alias kc="/usr/lib/kdeconnectd & kdeconnect-app "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

#vimode
bindkey -v
export KEYTIMEOUT=1
#backspace fix
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.





#lf cd

# lfcd () {
#
#
#
#tmp="$(mktemp)"
#    /usr/bin/lf -last-dir-path="$tmp" "$@"
#    if [ -f "$tmp" ]; then
#        dir="$(cat "$tmp")"
#        rm -f "$tmp" >/dev/null
#        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
#    fi
#}

lfcd () {



tmp="$(mktemp)"
    $HOME/.config/lf/lfrun -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}


bindkey -s '^o' 'lfcd\n'


bindkey -s '^b' 'bash\n'
bindkey -s '^a' 'bc -l\n'

bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

bindkey '^[[P' delete-char

#Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line


autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic


[ -f "$HOME/.config/nnn/nnn" ] && source "$HOME/.config/nnn/nnn"
# Load syntax highlighting; should be last.
#source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source $HOME/.title.zsh 2>/dev/null
