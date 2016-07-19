# First, install iterm2 (iterm2.com/downloads)
# Then, run this script (./config.sh)
# Once it finishes, go to iterm preferences and set the theme to "vital"

cd ~
mv config/* .
rm -rf config/

if [ "$(uname)" == "Darwin" ]; then
  defaults write -g InitialKeyRepeat -int 10
  defaults write -g KeyRepeat -int 1

  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  brew install tmux
  brew install ag
  brew install macvim --with-cscope --with-lua
  brew linkapps macvim
  brew install fzf
fi

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/soyuka/tmux-current-pane-hostname ~/tmux

/usr/local/opt/fzf/install

vim +PluginInstall +qall

source ~/.bash_profile

