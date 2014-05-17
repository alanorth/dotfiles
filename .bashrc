#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls -F --color=auto'
alias less='less -R' # preserves colors in `less`

# Environment
PS1='[\u@\h: \w]\$ '
export EDITOR=/usr/bin/vim
export PAGER=/usr/bin/less
# sequence to set the terminal title to "user@hostname: pwd"
TITLEBAR='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
PROMPT_COMMAND="$TITLEBAR"
# don't add commands starting with space to the history
HISTCONTROL=ignorespace
# ignore common commands in bash history
HISTIGNORE='ls:bg:fg:history'

# If a private bin directory exists, add it to PATH
[[ -d ~/bin ]] && PATH="$PATH:~/bin"

# solarized dircolors
[[ -r ~/.dircolors.ansi-dark ]] && eval `dircolors ~/.dircolors.ansi-dark`

# Settings
# Don't exit when accidentally pressing ^D
set -o ignoreeof

# Append, rather than overwrite history files
# Useful for when multiple bash sessions are running
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
