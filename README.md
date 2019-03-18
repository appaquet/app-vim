# This repo isn't used anymore. See my new [`dotfiles`](https://github.com/appaquet/dotfiles).


# Easy installation
Download & Execute installer
========
	curl https://raw.githubusercontent.com/appaquet/app-vim/master/installer.sh | sh

# Manual installation

Checkout
========
	git clone --recursive https://github.com/appaquet/app-vim.git ~/.app-vim

VIM setup
=========
Dependencies
 * Ubuntu: `apt-get install cmake python-dev`
```
	ln -s ~/.app-vim/.vim ~/.vim
	ln -s ~/.app-vim/.vimrc ~/.vimrc
	vim +BundleInstall +qall
	cd ~/.vim/bundle/YouCompleteMe/
	./install.sh   (you may need to install cmake & python-dev)
```

ZSH setup
=========
```
	ln -s ~/.app-vim/oh-my-zsh ~/.oh-my-zsh
	ln -s ~/.app-vim/.zshrc ~/.zshrc
	touch ~/.zshrc_local    (put your own configs in it, equivalent of .profile)
```

TMUX setup
==========
Dependencies
 * OSX: Install GNU GREP: `brew install https://raw.github.com/Homebrew/homebrew-dupes/master/grep.rb` (see https://github.com/erikw/tmux-powerline)
```
	ln -s ~/.app-vim/.tmux.conf ~/.tmux.conf
	ln -s ~/.app-vim/.tmux-powerline ~/.tmux-powerline
	ln -s ~/.app-vim/.tmux-powerlinerc ~/.tmux-powerlinerc
  cp ~/.app-vim/tmux-theme.sh ~/.tmux-powerline/theme/
```

Environment setup
=================
Either ln ~/.app-vim/bin to ~/bin and then add ~/bin to your path (.zshrc_local) or
add ~/.app-vim/bin to your path directly

