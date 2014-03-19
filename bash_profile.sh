# env
if [[ -e "$HOME/.env" ]]; then
  source $HOME/.env
fi

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH=$PATH:$HOME/.bin

# PLs
source $HOME/.dotfiles/bash/go.sh
source $HOME/.dotfiles/bash/ruby.sh
source $HOME/.dotfiles/bash/java.sh
source $HOME/.dotfiles/bash/perl.sh

# time tracking
source $HOME/.dotfiles/bash/traq.sh

# misc
source $HOME/.dotfiles/bash/brew.sh
source $HOME/.dotfiles/bash/npm.sh
source $HOME/.dotfiles/bash/git.sh
source $HOME/.dotfiles/bash/aliases.sh

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