# bash history setup

export HISTSIZE=9000
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignorespace:ignoredups

cd() {
  builtin cd "$@"
  echo -e "\033]50;CurrentDir=$OLDPWD^G"
}

export CDPATH=".:~:~/Workspace"

shopt -s histverify

# bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export GOPATH=$HOME/go

manopt() { man $1 |sed 's/.\x08//g'|sed -n "/^\s\+-\+$2\b/,/^\s*$/p"|sed '$d;';}

# PS_1
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
ruby_version() {
  echo $(rbenv version) | awk '{print $1}'
}
HOSTNAME=$(scutil --get ComputerName)
35
PS1="\[\e[0;37m\]$HOSTNAME@\\W [\[\e[0;36m\]$(date +"%H:%M")\[\e[0;37m\]] \[\e[0;35m\]\$(parse_git_branch)\[\e[0;37m\] \[\e[0;31m\]\$(ruby_version)\[\e[0;37m\] # "

# do not directly execute last commands

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/Applications/wkhtmltopdf/bin/wkhtmltopdf.app/Contents/MacOS:$PATH
export PATH=/Applications/wkhtmltopdf/bin/wkhtmltoimage.app/Contents/MacOS:$PATH
export PATH=/Applications/wkhtmltopdf.app/Contents/MacOS:$PATH
export PATH=/usr/texbin:$PATH
export PATH=./node_modules/.bin:$PATH
export NODE_PATH=/usr/local/lib/node_modules:$NODE_PATH

# custom scripts
export PATH=$PATH:$HOME/.bin

# JRuby, Rubinius
export JRUBY_OPTS=-X+C
export RBXOPT=-X19

# shorthands
alias be="bundle exec $1"
alias bu="bundle update $1"
alias bi="bundle install"
alias migrate-app="bundle exec rake db:migrate"
alias start-app="bundle exec foreman start"
alias test-app="bundle exec rake test RAILS_ENV=test"
alias deploy-app="bundle exec mina deploy"
alias ret="RAILS_ENV=test"
alias retc="ret be rails c"
alias red="RAILS_ENV=development"
alias redc="red be rails c"
alias ssh_rmate="ssh -R 52698:localhost:52698 $1"

export PATH="$HOME/.rbenv/bin:$PATH"

export PATH="/Users/nicolai86/.rbenv/shims:${PATH}"
export PATH="$PATH:/Applications/terminal-notifier.app/Contents/MacOS"
export PATH="$PATH:/usr/local/share/npm/bin"
export PATH="bin:$PATH"

export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
# patched ruby
export RUBY_GC_MALLOC_LIMIT=1000000000

# traq
. $HOME/.traqrc

# java
JAVA_OPTS="-J-Xms512m -J-Xmx512m -J-Xmn128m"
JRUBY_OPTS="-J-Xms512m -J-Xmx512m -J-Xmn128m"

# git aliases
alias git_week="git log --since '7 day ago' --no-merges --author 'Raphael Randschau'"

# stty werase undef
bind '"\C-w":backward-kill-word'
bind '\C-w:unix-filename-rubout'
PATH="$PATH:$GOPATH/bin"

# env
source $HOME/.env

# perlbrew
# source ~/perl5/perlbrew/etc/bashrc
export PERL5LIB=~/perl5/lib/perl5
export PATH=~/perl5/bin:$PATH
