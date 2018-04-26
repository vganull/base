#umask 0077

# requires `libpam-tmpdir'
export XDG_CACHE_HOME=${TMPDIR}/cache

# History
shopt -s histappend
HISTFILE=~/.bash_history99
HISTCONTROL=ignoreboth:erasedups
HISTIGNORE="h\? *":"h- *":"history *":"kill *":"pkill *":?:??:"* --help"
HISTSIZE=100000
HISTFILESIZE=100000
#export HISTSIZE=-1
#export HISTFILESIZE=-1
#PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"


# PS1

#. ~/bin/bashrc.d/bashrc-gentoo


# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
shopt -s autocd         # Bash 4.0+

export EDITOR=vi
alias e='vi'
# Edit configs
alias e-i3='vi ~/.config/i3/config'
alias e-mpv='vi ~/.config/mpv/mpv.conf'
alias e-vi='vi ~/.config/nvim/init.vim'
alias e-xres='vi ~/.Xresources'
alias e-xsession='vi ~/.xsession'
alias nano='nano --autoindent --linenumbers --nonewlines --smarthome --smooth --softwrap --tabsize=4 --tabstospaces --unix'

set -o vi

# sudo with user aliases
alias sudo='sudo '
alias se='sudo -e'
alias si='sudo -i'
alias dmesg='sudo /usr/bin/dmesg --human'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias less='less -I'
alias e="$EDITOR"

# Colors
alias diff='diff --color=auto'
alias grep='grep --color=auto'

#{{{ Paths
alias ..='cd ..'
alias ...='cd ../..'
alias cdb='cd ~/bin'
cdc() { cd ~/.config/"$1";}
mkcd () { mkdir -p "$1" && cd "$1" ;}
#}}} End Paths

alias df='findmnt -D'			# or '\df -h'
alias f='free -m'

alias h='history 30'
hc() { for i in "$@"; do history -d "$i"; done; history -w; }
alias hon='set -o history'
alias hoff='set +o history'
alias 'hg'='history|grep -i'
alias 'h-'='history -d'
#hr () { for i in $@; do history -d $i; done; history -w; }

alias l='ls -Fv --color=auto --group-directories-first --human-readable'
alias la='l -A'
alias ll='l -l --time-style=long-iso'
alias lla='ll -A'

alias lsblk='lsblk -xNAME'

alias psg='ps aux|grep --color=auto -i'


# Typos
alias grpe='grep'

alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'

alias yg='~/src/you-get/you-get -o /tmp/dl'
alias ygc='~/src/you-get/you-get "$(xsel -p)" -o /tmp/dl'
alias yg-proxychains='proxychains -q ~/src/you-get/you-get -o /tmp/dl'

#  alias yt='/usr/bin/youtube-dl \
#  	--external-downloader aria2c \
#  	--external-downloader-args "-c -j 3 -x 3 -s 3 -k 1M" \
#  	'
alias yd='/usr/bin/youtube-dl \
	--external-downloader aria2c \
	--external-downloader-args "-c -j 8 -x 8 -s 8 -k 1M" \
	'
alias ydc='yd "$(xsel -p)"'
alias mpvc='mpv "$(xsel -p)"'
alias slc='streamlink "$(xsel -p)"'

alias vr='echo "$(xsel -p)"; youtube-dl -F "$(xsel -p)" | grep "fps" | sort -bn -k5'
alias vd='echo "$(xsel -p)"; yd "$(xsel -p)"'
alias vp='echo "$(xsel -p)"; mpv "$(xsel -p)"'

# Aptitude
#
# apt-config dump
#
alias au='sudo aptitude update && sudo aptitude safe-upgrade'
alias aud='sudo aptitude update'
alias asu='sudo aptitude safe-upgrade'
alias adu='sudo aptitude dist-upgrade'
alias as='apt show'
alias av='aptitude versions'
alias ai='aptitude install -R'
alias aw='aptitude why' 
dpkgL () { dpkg -L $@ | sort | less; }


alias zzzzzzzzzzzzz='sudo pm-suspend'

alias extip='dig +short myip.opendns.com @resolver1.opendns.com'


export LESS=-R
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\e[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\e[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline

# googler
alias g='googler -n 7 --noua'
#alias @dm='-w dailymotion.com --url-handler xxxxx'
alias @dm='-w dailymotion.com'

man() {
    env \
        LESS_TERMCAP_mb=$'\e[1;31m' \
        LESS_TERMCAP_md=$'\e[1;31m' \
        LESS_TERMCAP_me=$'\e[0m' \
        LESS_TERMCAP_se=$'\e[0m' \
        LESS_TERMCAP_so=$'\e[1;44;33m' \
        LESS_TERMCAP_ue=$'\e[0m' \
        LESS_TERMCAP_us=$'\e[1;32m' \
            man "$@"
}


#   # enable programmable completion features (you don't need to enable
#   # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
#   # sources /etc/bash.bashrc).
#   if ! shopt -oq posix; then
#     if [ -f /usr/share/bash-completion/bash_completion ]; then
#       . /usr/share/bash-completion/bash_completion
#     elif [ -f /etc/bash_completion ]; then
#       . /etc/bash_completion
#     fi
#   fi
#   
#   
#   # no more alt-1 to 9
#   # "\e-"
#   # "\e0"
#   # "\e1"
#   # "\e2"
#   # "\e3"
#   # "\e4"
#   # "\e5"
#   # "\e6"
#   # "\e7"
#   # "\e8"
#   # "\e9"
#   
#   function nonzero_return() {
#     RETVAL=$?
#     [ $RETVAL -ne 0 ] && echo "[$RETVAL] "
#   }
#   
#   #export PS1="${?##0}\[\e[31m\]\`nonzero_return\`\[\e[m\]\[\e[32m\]\t\[\e[m\] \n$ "
#   #export PS1="\[\e[31m\]${?##0}\[\e[m\]\[\e[32m\]\t\[\e[m\] $ "
#   #export PS1="\e[31m${?##0}\n\[\e[$(((($?>0))*31))m\] $ "
#   #export PS1='\e[31m${?##0}\n\[\e[$(((($?>0))*31))m\] \[\e[32m\]\t\[\e[m\] $ '
#   #export PS1='\e[31m${?##0}\[\e[$(((($?>0))*31))m\]\[\e[32m\]\t\[\e[m\] $ '
#   
#   
#   case "$TERM" in xterm*|rxvt*|screen*)
#       PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#   
#       # Show the currently running command in the terminal title:
#       # http://www.davidpashley.com/articles/xterm-titles-with-bash.html
#       show_command_in_title_bar()
#       {
#           case "$BASH_COMMAND" in
#               *\033]0*)
#                   # The command is trying to set the title bar as well;
#                   # this is most likely the execution of $PROMPT_COMMAND.
#                   # In any case nested escapes confuse the terminal, so don't
#                   # output them.
#                   ;;
#               *)
#                   echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD} \$ ${BASH_COMMAND}\007"
#                   ;;
#           esac
#       }
#       trap show_command_in_title_bar DEBUG
#       ;;
#   *)
#       ;;
#   esac



