[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# env
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

function fkill () {
  ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9}
}
if [[ -e "$HOME/.env" ]]; then
  source $HOME/.env
fi

export EDITOR=subl

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH=$PATH:$HOME/.bin
export PATH=$PATH:$HOME/.dotfiles/ruby

export CURL_CA_BUNDLE=$HOME/.dotfiles/ca-bundle.crt

# PLs
source $HOME/.dotfiles/bash/go.sh
source $HOME/.dotfiles/bash/ruby.sh
source $HOME/.dotfiles/bash/java.sh
source $HOME/.dotfiles/bash/perl.sh
source $HOME/.dotfiles/bash/python.sh

# time tracking
source $HOME/.dotfiles/bash/traq.sh

# misc
source $HOME/.dotfiles/bash/brew.sh
source $HOME/.dotfiles/bash/npm.sh
source $HOME/.dotfiles/bash/git.sh
source $HOME/.dotfiles/bash/aliases.sh

# ask for pending background jobs b4 terminating
# checkjobs

# bash generica
export HISTSIZE=9000
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignorespace:ignoredups

# do not directly execute last commands
shopt -s histverify

cd() {
  builtin cd "$@"
  echo -e "\033]50;CurrentDir=$OLDPWD^G"
}

# bash path completion
export CDPATH=".:~:~/Workspace"

# bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# PS_1
parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
parse_git_dirty() {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
# determine ruby version from rbenv
ruby_version() {
  echo $(rbenv version) | awk '{print $1}'
}
HOSTNAME=$(scutil --get ComputerName)
PS1="\[\e[0;37m\]$HOSTNAME@\\W [\[\e[0;36m\]\A\[\e[0;37m\]] \[\e[0;35m\]\$(parse_git_branch)\[\e[0;37m\] \[\e[0;31m\]\$(ruby_version)\[\e[0;37m\] # "

# stty werase undef
bind '"\C-w":backward-kill-word'
bind '\C-w:unix-filename-rubout'

export HOMEBREW_GITHUB_API_TOKEN=8b0ecdbf3ae535eb7299c069621060b98a19fa45
