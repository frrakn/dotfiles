mkdir ~/.vim/undodir
mkdir ~/.vim/backup
mkdir ~/.vim/temp
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s $HOME/dotfiles/.bash_profile ~/
ln -s $HOME/dotfiles/.vimrc ~/
ln -s $HOME/dotfiles/.gitconfig ~/
ln -s $HOME/dotfiles/.git-completion.bash ~/
