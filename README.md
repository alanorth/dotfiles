# Alan's dotfiles
Dotfiles for pretty much every Linux system I have access to. After setting up a new host, I do:

```console
$ mkdir ~/src/git
$ cd ~/src/git
$ git clone https://github.com/alanorth/dotfiles.git
$ cd ~
$ ln -sf ~/src/git/dotfiles/.bashrc .
$ ln -sf ~/src/git/dotfiles/.vim .
$ ln -sf ~/src/git/dotfiles/.vimrc .
$ ln -sf ~/src/git/dotfiles/.tmux.conf .
$ ln -sf ~/src/git/dotfiles/.zshrc .
$ mkdir -p ~/.config
$ ln -sf ~/src/git/dotfiles/sway .config
$ ln -sf ~/src/git/dotfiles/mako .config
$ ln -sf ~/src/git/dotfiles/kanshi .config
```

## .bashrc
Configures the shell to have a custom PS1 prompt, adds paths for Homebrew, adds some common aliases, Selenized dircolors, etc.

## .tmux.conf
Solarized color scheme with key bindings like GNU screen.

## .vim + .vimrc
Syntax highlighting, Selenized color scheme, tab stops to four spaces, etc.

## .zshrc
Configures the shell to have a custom PS1 prompt, adds paths for Homebrew, adds some common aliases, Selenized dircolors, etc.

## License
Copyright (C) 2015–2020  Alan Orth

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
