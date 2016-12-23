#!/bin/bash
export PATH=$PATH:$HOME/homebrew/sbin:$HOME/homebrew/bin

curl -L https://raw.githubusercontent.com/docker/docker/master/contrib/completion/bash/docker -o $(brew --prefix)/etc/bash_completion.d/docker
curl -L https://raw.githubusercontent.com/docker/compose/1.9.0/contrib/completion/bash/docker-compose -o $(brew --prefix)/etc/bash_completion.d/docker-compose
