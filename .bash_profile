source ~/.bashrc

TERM=xterm-256color
alias tmux='tmux -2'

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
function syncdate () { sudo service ntp stop && sudo ntpdate ntp.ubuntu.com && sudo service ntp start ; }
cd /vagrant/
export DISPLAY=localhost:10.0

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

PROMPT_COMMAND='if [ $? = 0 ]; then STATUS="$GREEN"; else STATUS="$RED"; fi; PS1="$BLUE\d \@$PURPLE\$(__git_ps1)\n$STATUS\u $YELLOW\w$CYAN$BOLD > $RESET"'

source ~/.git-prompt.sh

export PS1="$BLUE\d \@$PURPLE\$(__git_ps1)\n$GREEN\u $YELLOW\w$CYAN$BOLD > $RESET"

# Turn on pretty colors
export CLICOLOR=1

export LSCOLORS=ExFxBxDxCxegedabagacad

alias ls='ls -Gah'

# Make ri use pretty colors
export RI="-f ansi"
export LESS="-R"

export VISUAL=vim
export EDITOR="$VISUAL"

alias ag='ag --smart-case'

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

tmux source-file ~/.tmux.conf
