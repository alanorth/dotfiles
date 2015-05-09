## Alan's dotfiles
Dotfiles for pretty much every Linux system I have access to.  After setting up a new host, I do:

```console
$ mkdir ~/src/git
$ cd ~/src/git
$ git clone https://github.com/alanorth/dotfiles.git
$ cd ~
$ ln -sf ~/src/git/dotfiles/.bashrc .
$ ln -sf ~/src/git/dotfiles/.vim .
$ ln -sf ~/src/git/dotfiles/.vimrc .
$ ln -sf ~/src/git/dotfiles/.tmux.conf .
$ ln -sf ~/src/git/dotfiles/.dircolors.ansi-dark .
$ ln -sf ~/src/git/dotfiles/.zshrc .
```

### .bashrc
Configures the shell to have a custom PS1, add paths for NPM and Homebrew, setup pyenv for virtualenvs, some common aliaes, Solarized dircolors, etc.

### .tmuxrc
Solarized configuration

### .vimrc
Syntax highlighting, Solarized color scheme, tab stops to 4 spaces, etc.

### .zshrc
Configures a custom prompt, adds paths for pkgsrc on Mac OS X, sets up pyenv, adds aliases, Solarized dircolors, etc.
