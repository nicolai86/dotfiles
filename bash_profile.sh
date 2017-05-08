#!/bin/bash
# en
if [[ -e "$HOME/.env" ]]; then
  source "$HOME/.env"
fi

export EDITOR=subl
export VISUAL=vim

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH=$PATH:$HOME/.bin
export PATH=$PATH:$HOME/.dotfiles/ruby

source "$HOME/.dotfiles/bash/brew.sh"

# PLs
source "$HOME/.dotfiles/bash/go.sh"
# source "$HOME/.dotfiles/bash/ruby.sh"
source "$HOME/.dotfiles/bash/rust.sh"
# source "$HOME/.dotfiles/bash/python.sh"

# time tracking
source "$HOME/.dotfiles/bash/traq.sh"

# misc
source "$HOME/.dotfiles/bash/android.sh"
source "$HOME/.dotfiles/bash/npm.sh"
source "$HOME/.dotfiles/bash/git.sh"
source "$HOME/.dotfiles/bash/aliases.sh"

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
[ -f "$(brew --prefix)/etc/bash_completion" ] && source "$(brew --prefix)/etc/bash_completion"

# PS_1
parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
parse_git_dirty() {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
HOSTNAME=$(scutil --get ComputerName)
PS1="\[\e[0;37m\]$HOSTNAME@\\W\[\e[0;35m\] \$(parse_git_branch)\[\e[0;37m\] # "

# stty werase undef
bind '"\C-w":backward-kill-word'
bind '\C-w:unix-filename-rubout'

source $HOME/.iterm2_shell_integration.bash

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/nicolai86/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/nicolai86/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/nicolai86/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/nicolai86/google-cloud-sdk/completion.bash.inc'
fi
