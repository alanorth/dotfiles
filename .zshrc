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
    # set pkgsrc paths
    # see: http://pkgsrc.joyent.com/install-on-osx/
    PATH=/usr/pkg/sbin:/usr/pkg/bin:$PATH
    MANPATH=/usr/pkg/man:$MANPATH

    # use pkgsrc's GNU coreutils (prefixed with 'g')
    # requires at least: coreutils findutils gsed
    alias du='gdu'
    alias ls='gls -F --color=auto'
    alias df='gdf'
    alias rm='grm'
    alias cp='gcp'
    alias mv='gmv'
    alias mkdir='gmkdir'
    alias rmdir='grmdir'
    alias chmod='gchmod'
    alias chown='gchown'
    alias ln='gln'
    alias find='gfind'
    alias sed='gsed'

    # solarized dircolors (needs coreutils from pkgsrc)
    [[ -r ~/.dircolors.ansi-dark ]] && eval `gdircolors ~/.dircolors.ansi-dark`

elif [[ "$OSTYPE" =~ ^linux*$ ]]; then
    # aliases
    alias ls='ls -F --color=auto'

    # solarized dircolors
    [[ -r ~/.dircolors.ansi-dark ]] && eval `dircolors ~/.dircolors.ansi-dark`
fi

alias less='less -R' # preserves colors in GNU coreutils' `less`

# Environment
export PS1='[%n@%m: %~]$ '
export EDITOR=vim
export PAGER=less

# look for Ansible hosts file in current directory
export ANSIBLE_HOSTS=hosts

# look for Node binaries in current directory
# if we have npm, we probably want to use npm binaries
# I don't like installing globally (npm -g), so add local
# node modules' bin to PATH
command -v npm >/dev/null 2>&1
if [[ $? -eq 0 ]]; then
    PATH=$PATH:node_modules/.bin
fi

# Enable pyenv
# See: https://github.com/yyuu/pyenv#basic-github-checkout
if [[ -d ~/.pyenv ]]; then
    export PYENV_ROOT="$HOME/.pyenv"
    PATH="$PYENV_ROOT/bin:$PATH"

    eval "$(pyenv init -)"
    # optionally enable pyenv-virtualenv
    # See: https://github.com/yyuu/pyenv-virtualenv
    if [[ -d ~/.pyenv/plugins/pyenv-virtualenv ]]; then
        eval "$(pyenv virtualenv-init -)"
    fi
fi

# If a private bin directory exists, add it to PATH
[[ -d ~/bin ]] && PATH="$PATH:~/bin"

export PATH
export MANPATH
