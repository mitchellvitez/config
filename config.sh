# First, install iterm2 (iterm2.com/downloads)
# Then, run this script (./config.sh)
# Once it finishes, go to iterm preferences and set the theme to "vital"

cd ~
mv config/* .
mv config/.* .
rm -rf config/

# mac
if [ "$(uname)" == "Darwin" ]; then
  defaults write -g InitialKeyRepeat -int 10
  defaults write -g KeyRepeat -int 1
  defaults write com.apple.finder AppleShowAllFiles YES

  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  brew install tmux
  brew install ag
  brew install macvim --with-cscope --with-lua
  brew linkapps macvim
  brew install fzf
  /usr/local/opt/fzf/install
fi
# ubuntu
if [ "$(uname)" == "Linux" ]; then
  sudo apt-get install tmux
  sudo apt-get install silversearcher-ag
  sudo apt-get install vim-nox
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/soyuka/tmux-current-pane-hostname ~/tmux
git clone https://github.com/tmux-plugins/tmux-resurrect ~/tmux/resurrect

vim +PluginInstall +qall
rm -rf ~/.git/
rm README.md
source ~/.bash_profile
