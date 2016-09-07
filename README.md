# Alan's dotfiles
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

## .bashrc
Configures the shell to have a custom PS1, add paths for NPM and Homebrew, setup pyenv for virtualenvs, some common aliaes, Solarized dircolors, etc.

## .tmuxrc
Solarized configuration

## .vimrc
Syntax highlighting, Solarized color scheme, tab stops to 4 spaces, etc.

## .zshrc
Configures a custom prompt, adds paths for pkgsrc on Mac OS X, sets up pyenv, adds aliases, Solarized dircolors, etc.

## License
Copyright (C) 2015  Alan Orth

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
