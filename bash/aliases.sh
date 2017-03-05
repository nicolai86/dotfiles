#!/bin/bash
# shorthands
alias ret="RAILS_ENV=test"
alias retc="ret be rails c"
alias red="RAILS_ENV=development"
alias redc="red be rails c"
alias t="theca"
# git aliases
alias git_week="git log --since '7 day ago' --no-merges --author 'Raphael Randschau'"

# docker shorthands
alias irssi="docker run --rm -it --name irssi -e TERM -u $(id -u):$(id -g) --log-driver=none -v $HOME/.irssi:/home/user/.irssi nicolai86/irssi"
