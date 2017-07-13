#!/bin/bash
export PATH=$HOME/homebrew/sbin:$HOME/homebrew/bin:$PATH

[ ! -e $(brew --prefix)/etc/bash_completion.d/docker ] && curl -L https://raw.githubusercontent.com/docker/docker/master/contrib/completion/bash/docker -o $(brew --prefix)/etc/bash_completion.d/docker
[ ! -e $(brew --prefix)/etc/bash_completion.d/docker-compose ] && curl -L https://raw.githubusercontent.com/docker/compose/1.9.0/contrib/completion/bash/docker-compose -o $(brew --prefix)/etc/bash_completion.d/docker-compose

[ "$(which kubectl)" != "" ] && source <(kubectl completion bash)
