# First, install iterm2 (iterm2.com/downloads)
# Then, run this script (./config.sh)
# Once it finishes, go to iterm preferences and set the theme to "vital"

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install tmux
brew install ag
brew install macvim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

