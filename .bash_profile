source ~/.bashrc
source ~/.secrets

export TERM=xterm-256color
alias tmux='tmux -2'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

HISTCONTROL=ignoreboth

function syncdate () { sudo service ntp stop && sudo ntpdate ntp.ubuntu.com && sudo service ntp start ; }
export DISPLAY=localhost:10.0

function pycheck () {
  pycodestyle $1 && pydocstyle $1;
}

# Set prompt colors and format
BLUE="\[\e[34m\]"
YELLOW="\[\e[33m\]"
GREEN="\[\e[32m\]"
CYAN="\[\e[36m\]"
PURPLE="\[\e[35m\]"
RED="\[\e[31m\]"
BOLD="\[\e[1m\]"
RESET="\[\e[0m\]"
STATUS="$GREEN"

PROMPT_COMMAND='if [ $? = 0 ]; then STATUS="$GREEN"; else STATUS="$RED"; fi; PS1="$BLUE\d \@$PURPLE\$(__git_ps1)\n$STATUS\u $YELLOW\w$CYAN$BOLD λ $RESET"'

source ~/.git-prompt.sh

alias gcm='git checkout master'
alias gd1='git diff HEAD~1 HEAD'
alias gd2='git diff HEAD~2 HEAD'
alias gd3='git diff HEAD~3 HEAD'
alias gdm='git diff master...HEAD'
alias gb='git branch'
alias gd='git diff'
alias gs='git status'
alias gl='git log --graph --decorate --abbrev-commit'

alias tags='ctags -R -f ./.git/tags --exclude=.git --exclude=log --exclude=elm-stuff --exclude=node_modules .'

alias be='bundle exec'
alias bi='bundle install'
alias cons='bundle exec rails c'
alias spec='bundle exec rspec'

export PS1="$BLUE\d \@$PURPLE\$(__git_ps1)\n$GREEN\u $YELLOW\w$CYAN$BOLD > $RESET"

# Turn on pretty colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

alias ls='ls -Gah --color=auto'
alias beep="echo -ne '\007'"
alias qemu="qemu-system-x86_64"

# Make ri use pretty colors
export RI="-f ansi"
export LESS="-R"

export LD_LIBRARY_PATH=""

export VISUAL=vim
export EDITOR="$VISUAL"

alias ag='ag --smart-case --color-match=33 --color-line-number=34'

alias fzf="fzf --bind 'enter:execute(vim -v -f {}; echo {})+abort'"
alias f=fzf

alias du='du -h --max-depth=1'

alias ghc='ghc -O2 -Wall -freverse-errors'
alias ghci='ghci -freverse-errors'

ghct() { ghc -O2 -Wall -freverse-errors -optc-O3 -fno-warn-missing-signatures -fno-warn-name-shadowing -fno-warn-unused-do-bind $1 && time ./$1; }
ghcx() { ghc -O2 -Wall -freverse-errors -optc-O3 -fno-warn-missing-signatures -fno-warn-name-shadowing -fno-warn-unused-do-bind $1 && ./$1; }

alias gpoh='git push origin HEAD'

function v() {
  CMD="cd /vagrant; $@";
  vagrant ssh -c "$CMD"
}

source ~/.git-completion.bash

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

alias update='git checkout master; git pull; v bundle install; v npm install; v rake db:migrate RAILS_ENV=test'

if [ "$(uname)" == "Darwin" ]; then
  alias vim='mvim -v'
fi

alias top='top -o %CPU'
alias killpython="sudo kill $(ps -A | grep python | awk '{print $1}')"

alias python='python3'
alias pip='pip3'

alias bp='vim ~/.bash_profile'
alias sbp='source ~/.bash_profile'

man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;36m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"

export ANDROID_HOME=/Users/mitchellvitez/Library/Android/sdk
tmux source-file ~/.tmux.conf > /dev/null
tmux > /dev/null

clear
clear
clear
