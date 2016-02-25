# cleaning existing files
rm -rf ~/.app-vim
rm -rf ~/.vim
rm -rf ~/.vimrc
rm -rf ~/.tmux.conf
rm -rf ~/.tmux-powerline
rm -rf ~/.tmux-powerlinerc

# cloning this repo
git clone --recursive https://github.com/appaquet/app-vim.git ~/.app-vim

# vim symlinks
ln -s ~/.app-vim/.vim ~/.vim
ln -s ~/.app-vim/.vimrc ~/.vimrc

# install bundles
vim +BundleInstall +qall
cd ~/.vim/bundle/YouCompleteMe/
./install.sh

ln -s ~/.app-vim/.tmux.conf ~/.tmux.conf
ln -s ~/.app-vim/.tmux-powerline ~/.tmux-powerline
ln -s ~/.app-vim/.tmux-powerlinerc ~/.tmux-powerlinerc

# add bin to path

PATH_SETTINGS="export PATH=\$PATH:~/.vim/bin"
touch .bashrc

if ! grep --quiet "$PATH_SETTINGS" ".bashrc"; then
  echo "$PATH_SETTINGS" > ".bashrc";
fi
