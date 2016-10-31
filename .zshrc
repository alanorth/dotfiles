HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=2000
setopt append_history           # append
setopt hist_ignore_all_dups     # no duplicate
setopt hist_ignore_space        # ignore space prefixed commands
setopt hist_reduce_blanks       # trim blanks
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit
setopt share_history            # share hist between sessions
setopt ignoreeof                # don't exit the shell on ^D (EOF)

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
    # set homebrew paths
    # see: http://brew.sh/
    PATH=/opt/brew/sbin:/opt/brew/bin:$PATH
    MANPATH=/opt/brew/man:$MANPATH

    # opt out of Homebrew analytics
    # see: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
    export HOMEBREW_NO_ANALYTICS=1
    export HOMEBREW_NO_AUTO_UPDATE=1
    export HOMEBREW_NO_EMOJI=1
    export HOMEBREW_MAKE_JOBS=3
    export HOMEBREW_NO_AUTO_UPDATE=1

    # pass needs umount and diskutil, which are in /sbin and /usr/sbin
    PATH=$PATH:/sbin:/usr/sbin

    # use homebrew's GNU coreutils (prefixed with 'g')
    # requires at least: coreutils findutils gnu-sed
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
    alias dircolors='gdircolors'
    alias sort='gsort'
    alias grep='ggrep'

    # If BasicTeX installation exists, add it to PATH
    # See: https://tug.org/mactex/morepackages.html
    [[ -d /usr/local/texlive/2015basic/bin/x86_64-darwin ]] && PATH=$PATH:/usr/local/texlive/2015basic/bin/x86_64-darwin

elif [[ "$OSTYPE" =~ ^linux.*$ ]]; then
    # aliases
    alias ls='ls -F --color=auto'
fi

alias less='less -R' # preserves colors in GNU coreutils' `less`

# solarized dircolors
[[ -r ~/.dircolors.ansi-dark ]] && eval `dircolors ~/.dircolors.ansi-dark`

# Environment
export PS1='[%n@%m: %~]$ '
export EDITOR=vim
export PAGER=less

# look for Ansible hosts file in current directory
export ANSIBLE_HOSTS=hosts

# Enable node version manager (nvm)
[[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh

# Initialize pyenv if it exists
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Initialize jenv if it exists
if which jenv > /dev/null; then
  export JENV_ROOT=~/.jenv
  eval "$(jenv init -)"
fi

# Enable ruby version manager if it exists
[[ -s ~/.rvm/scripts/rvm ]] && . ~/.rvm/scripts/rvm

# If a private bin directory exists, add it to PATH
[[ -d ~/bin ]] && PATH=$PATH:~/bin

# If a binary go distribution exists, add it to PATH
# From here: http://golang.org/dl/
if [[ -d ~/Downloads/go ]]; then
    export GOROOT=~/Downloads/go
    export GOPATH=~/src/go
    PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi


# resize images using GraphicsMagick
#
#   $ smartresize DSC_0788.JPG 1920x1080 outputdir
#
# Similar to the one from SmashingMagazine, but ported to GraphicsMagick
# see: http://www.smashingmagazine.com/2015/06/efficient-image-resizing-with-imagemagick/
smartresize() {
    gm mogrify -filter Triangle -define filter:support=2 -thumbnail $2 -unsharp 2x0.5+0.7+0 -dither -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace Line -strip -output-directory $3 $1
}

# optimize jpeg using GraphicsMagick
#
#   $ jpegoptimize DSC_0788.JPG outputdir [quality]
#
# Similar to smartresize above, but just optmizes the jpeg
jpegoptimize() {
    if [[ -z $3 ]]; then QUALITY=82; else QUALITY=$3; fi

    gm mogrify -filter Triangle -define filter:support=2 -unsharp 2x0.5+0.7+0 -dither -quality $QUALITY -define jpeg:fancy-upsampling=off -interlace Line -strip -output-directory $2 $1
}

# generate random password 25 characters long:
# 	$ openssl rand -base64 18 | wc -c
#    	  25
genpass() {
    openssl rand -base64 18
}

export PATH
export MANPATH
