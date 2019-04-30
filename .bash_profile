source ~/.bashrc

TERM=xterm-256color
alias tmux='tmux -2'

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
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

export PS1="$BLUE\d \@$PURPLE\$(__git_ps1)\n$GREEN\u $YELLOW\w$CYAN$BOLD > $RESET"

# Turn on pretty colors
export CLICOLOR=1

export LSCOLORS=ExFxBxDxCxegedabagacad

alias ls='ls -Gah'
alias beep="echo -ne '\007'"
alias qemu="qemu-system-x86_64"

# Make ri use pretty colors
export RI="-f ansi"
export LESS="-R"

export LD_LIBRARY_PATH=""

export VISUAL=vim
export EDITOR="$VISUAL"

alias ag='ag --smart-case --ignore elm-stuff/'

alias fzf="fzf --bind 'enter:execute(mvim -v -f {})+abort'"

alias du='du -h'

alias ghcorig='ghc'
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

alias top='top -o cpu'
alias killpython="sudo kill $(ps -A | grep python | awk '{print $1}')"

alias python='python3'
alias pip='pip3'

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
export PATH=$(brew --prefix openssl)/bin:$PATH

export ANDROID_HOME=/Users/mitchellvitez/Library/Android/sdk
tmux source-file ~/.tmux.conf > /dev/null
tmux > /dev/null

clear
clear
clear
