
Checkout
========
	git clone --recursive https://github.com/appaquet/app-vim.git ~/.app-vim

VIM setup
=========
	ln -s ~/.app-vim/.vim ~/.vim
	ln -s ~/.app-vim/.vimrc ~/.vimrc
	vim +BundleInstall +qall
	cd ~/.vim/bundle/YouCompleteMe/
	./install.sh   (you may need to install cmake & python-dev)

ZSH setup
=========
	ln -s ~/.app-vim/oh-my-zsh ~/.oh-my-zsh
	ln -s ~/.app-vim/.zshrc ~/.zshrc
	touch ~/.zshrc_local    (put your own configs in it, equivalent of .profile)

TMUX setup
==========
  ln -s ~/.app-vim/.tmux.conf ~/.tmux.conf
  ln -s ~/.app-vim/.tmux-powerline ~/.tmux-powerline
  ln -s ~/.app-vim/.tmux-powerlinerc ~/.tmux-powerlinerc

Environment setup
=================
Either ln ~/.app-vim/bin to ~/bin and then add ~/bin to your path (.bashrc or .profile) or
add ~/.app-vim/bin to your path directly


