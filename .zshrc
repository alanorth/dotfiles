HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt append_history           # append
setopt hist_ignore_all_dups     # no duplicate
unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_reduce_blanks       # trim blanks
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit
setopt share_history            # share hist between sessions

# emacs bindings
bindkey -e
# make delete key work
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

# autocomplete
autoload -Uz compinit
compinit

# OS-specific things
if [[ "$OSTYPE" =~ ^darwin.*$ ]]; then
    PATH=$(brew --prefix coreutils)/libexec/gnubin:/usr/local/sbin:$PATH

    if [[ -f $(brew --prefix)/etc/bash_completion ]]; then
        . $(brew --prefix)/etc/bash_completion
    fi
fi

# Aliases
alias ls='ls -F --color=auto'
alias less='less -R' # preserves colors in GNU coreutils' `less`

# Environment
PS1='[%n@%m: %~]$ '
export EDITOR=/usr/bin/vim
export PAGER=/usr/bin/less

# look for Ansible hosts file in current directory
export ANSIBLE_HOSTS=hosts

# look for Node binaries in current directory
# if we have npm, we probably want to use npm binaries
# I don't like installing globally (npm -g), so add local
# node modules' bin to PATH
if which npm >/dev/null 2>&1; then
    export PATH=$PATH:node_modules/.bin
fi

# Enable pyenv
# See: https://github.com/yyuu/pyenv#basic-github-checkout
if [[ -d ~/.pyenv ]]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"

    eval "$(pyenv init -)"
    # optionally enable pyenv-virtualenv
    # See: https://github.com/yyuu/pyenv-virtualenv
    if [[ -d ~/.pyenv/plugins/pyenv-virtualenv ]]; then
        eval "$(pyenv virtualenv-init -)"
    fi
fi

# If a private bin directory exists, add it to PATH
[[ -d ~/bin ]] && PATH="$PATH:~/bin"

# solarized dircolors (needs coreutils from homebrew on Mac OS X)
[[ -r ~/.dircolors.ansi-dark ]] && eval `dircolors ~/.dircolors.ansi-dark`

export PATH
