#
# ~/.bashrc
#

[[ $- != *i* ]] && return

colors() {
        local fgc bgc vals seq0

        printf "Color escapes are %s\n" '\e[${value};...;${value}m'
        printf "Values 30..37 are \e[33mforeground colors\e[m\n"
        printf "Values 40..47 are \e[43mbackground colors\e[m\n"
        printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

        # foreground colors
        for fgc in {30..37}; do
                # background colors
                for bgc in {40..47}; do
                        fgc=${fgc#37} # white
                        bgc=${bgc#40} # black

                        vals="${fgc:+$fgc;}${bgc}"
                        vals=${vals%%;}

                        seq0="${vals:+\e[${vals}m}"
                        printf "  %-9s" "${seq0:-(default)}"
                        printf " ${seq0}TEXT\e[m"
                        printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
                done
                echo; echo
        done
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
        xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
                PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
                ;;
        screen*)
                PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
                ;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
        && type -P dircolors >/dev/null \
        && match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
        # Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
        if type -P dircolors >/dev/null ; then
                if [[ -f ~/.dir_colors ]] ; then
                        eval $(dircolors -b ~/.dir_colors)
                elif [[ -f /etc/DIR_COLORS ]] ; then
                        eval $(dircolors -b /etc/DIR_COLORS)
                fi
        fi

        if [[ ${EUID} == 0 ]] ; then
                PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
        else
                PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
        fi

        alias ls='ls --color=auto'
        alias grep='grep --colour=auto'
        alias egrep='egrep --colour=auto'
        alias fgrep='fgrep --colour=auto'
else
        if [[ ${EUID} == 0 ]] ; then
                # show root@ when we don't have colors
                PS1='\u@\h \W \$ '
        else
                PS1='\u@\h \w \$ '
        fi
fi

unset use_color safe_term match_lhs sh

#OLD# export PS1="\[\033[01;32m\][\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] "
#export PS1="\[\033[01;32m\]\u\[\033[01;37m\] \W\[\033[01;32m\]\$\[\033[00m\] "
#export PS1="\033[1m\033[7m\033[93m$\[\033[00m\] \e[47m\[\033[01;34m\]\W\e[40m\[\033[01;93m\]>\[\033[00m\] "
#export PS1="\033[1m\033[7m\033[93m$\[\033[00m\] \[\033[01;37m\]\W\[\033[01;93m\]>\[\033[00m\] "
#export PS1="\033[1m\033[7m\033[93m\u\[\033[00m\] \[\033[01;37m\]\W\[\033[01;93m\]>\[\033[00m\] "
export PS1="\[$(tput bold)\]\[\033[38;5;0m\]\[\033[48;5;11m\]\u\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;255m\]\W\[$(tput sgr0)\]\[\033[38;5;11m\]>\[$(tput sgr0)\] \[$(tput sgr0)\]"

alias cp="cp -i"                          # confirm before overwriting something
alias np='nano -w PKGBUILD'
alias more=less
alias ll='ls -lah --color=auto'
alias ip='ip --color=auto'
alias fixscreen='sxiv -fb /home/dvdmanjaro/Desktop/Files/black.jpg'
alias alpvm='docker run --rm -it alpine'
alias threebe='cd /home/dvdmanjaro/Desktop/Programming/Docker/Git/Threebe; code /home/dvdmanjaro/Desktop/Programming/Docker/Git/Threebe'
alias alpssh='docker run --rm -it alpine'
#alias alpssh='alpsshname=$(docker run --rm -d -t alpine); docker exec -t $alpsshname apk add openssh; docker exec -it $alpsshname sh'
alias hostVPNadd='nmcli connection delete client-wg0; nmcli connection import type wireguard file /home/dvdmanjaro/Desktop/Hacking/others/vps/client-wg0.conf; nmcli con mod client-wg0 connection.autoconnect no'
alias hostVPNedit='echo "" > /home/dvdmanjaro/Desktop/Hacking/others/vps/client-wg0.conf; nano /home/dvdmanjaro/Desktop/Hacking/others/vps/client-wg0.conf'
alias VPNon='python3 /home/dvdmanjaro/Desktop/Hacking/others/vps/tkScripts.py & alpssh; hostVPNedit; hostVPNadd; kill -9 $(ps aux | grep tkScripts | grep -v grep | awk "{print \$2}"); clear'
alias VPNoff='wg-quick down /home/dvdmanjaro/Desktop/Hacking/others/vps/client-wg0.conf; clear'
alias VPSon='python3 /home/dvdmanjaro/Desktop/Hacking/others/vps/tkScripts.py & alpssh; kill -9 $(ps aux | grep tkScripts | grep -v grep | awk "{print \$2}"); clear'
alias startdocker='sudo systemctl start docker'
alias dockergui='docker run --rm -it -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix archlinux'
alias cachec='sudo bash -c "sync; echo 3 > /proc/sys/vm/drop_caches"'
alias gamingcont='docker run --rm -it -e DISPLAY --ipc=host --device /dev/dri/card0 -v /dev/input:/dev/input -v /tmp/.X11-unix:/tmp/.X11-unix --device /dev/snd -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native --group-add audio -v ~/.config/pulse/cookie:/root/.config/pulse/cookie --privileged archlinux'
alias gamingcontsock='docker run --rm -it -e DISPLAY --ipc=host -e XDG_RUNTIME_DIR --device /dev/dri/card0 -v /dev/input:/dev/input -v /tmp/.X11-unix:/tmp/.X11-unix --device /dev/snd -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native --group-add audio -v ~/.config/pulse/cookie:/root/.config/pulse/cookie -v ${XDG_RUNTIME_DIR}:${XDG_RUNTIME_DIR} --privileged archlinux'
alias gaming='docker start "gaming_container" &>/dev/null; docker exec -it "gaming_container" bash && docker stop "gaming_container" &>/dev/null'
alias music_prod='docker start "music_prod" &>/dev/null; docker exec -it "music_prod" bash && docker stop "music_prod" &>/dev/null'
alias contcp='bash ~/Desktop/Files/SomeScripts/contcp.sh'

xhost +local:root > /dev/null 2>&1

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

man() {
    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

    command man "$@"
}
source "$HOME/.cargo/env"
