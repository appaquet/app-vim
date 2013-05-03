
Checkout
========
	git clone --recursive https://github.com/appaquet/app-vim.git ~/.app-vim

VIM setup
=========
	ln -s ~/.app-vim/.vim ~/.vim
	ln -s ~/.app-vim/.vimrc ~/.vimrc
	vim +BundleInstall +qall


ZSH setup
=========
	ln -s ~/.app-vim/.oh-my-zsh ~/.oh-my-zsh

Environment setup
=================
Either ln ~/.app-vim/bin to ~/bin and then add ~/bin to your path (.bashrc or .profile) or
add ~/.app-vim/bin to your path directly


