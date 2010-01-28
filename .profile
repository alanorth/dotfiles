# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
    # Shell is non-interactive.  Be done now!
    return  
fi

#shell settings
# PS1 with the escape sequence for dynamic titles in screen
export PS1='\[\033k\033\\\][\u@\h: \w]\$ '
export PATH="/usr/local/bin:/usr/local/sbin:/opt/bin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/games/bin:/opt/bin:/opt/sbin"
export EDITOR=/usr/bin/vim
export PAGER=/usr/bin/less

# don't exit when accidentally pressing ^D
set -o ignoreeof

# append, rather than overwrite history files.
# useful for when multiple bash sessions are running.
shopt -s histappend

#aliases
alias ls='/bin/ls --color=always'
alias l='/bin/ls -l --color=always'
alias less='less -R' # preserves colors in `less`
alias scpresume='rsync --partial --progress --rsh=ssh'
