#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias less='less -R' # preserves colors in `less`

# Environment
PS1='[\u@\h: \w]\$ '
export EDITOR=/usr/bin/vim
export PAGER=/usr/bin/less
# Aggressive read/write of history after every command
PROMPT_COMMAND='history -a; history -n'

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
