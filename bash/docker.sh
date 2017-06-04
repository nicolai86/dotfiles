#!/bin/bash

# see https://github.com/jessfraz/dotfiles/blob/master/.dockerfunc
dcleanup(){
  local containers
  containers=( $(docker ps -aq 2>/dev/null) )
  docker rm "${containers[@]}" 2>/dev/null
  local volumes
  volumes=( $(docker ps --filter status=exited -q 2>/dev/null) )
  docker rm -v "${volumes[@]}" 2>/dev/null
  local images
  images=( $(docker images --filter dangling=true -q 2>/dev/null) )
  docker rmi "${images[@]}" 2>/dev/null
}

del_stopped(){
  local name=$1
  local state
  state=$(docker inspect --format "{{.State.Running}}" "$name" 2>/dev/null)

  if [[ "$state" == "false" ]]; then
    docker rm "$name"
  fi
}

relies_on(){
  for container in "$@"; do
    local state
    state=$(docker inspect --format "{{.State.Running}}" "$container" 2>/dev/null)

    if [[ "$state" == "false" ]] || [[ "$state" == "" ]]; then
      echo "$container is not running, starting it for you."
      $container
    fi
  done
}

export DOCKER_REPO_PREFIX=nicolai86

aws(){
  docker run -it --rm \
    -v "${HOME}/.aws:/root/.aws" \
    --log-driver none \
    --name aws \
    ${DOCKER_REPO_PREFIX}/awscli "$@"
}

# docker shorthands
irssi() {
  del_stopped irssi
  # relies_on notify_osd

  docker run --rm -it \
    --user root \
    -v "${HOME}/.irssi:/home/user/.irssi" \
    ${DOCKER_REPO_PREFIX}/irssi \
    chown -R user /home/user/.irssi

  docker run --rm -it \
    -v /etc/localtime:/etc/localtime:ro \
    -v "${HOME}/.irssi:/home/user/.irssi" \
    --read-only \
    --name irssi \
    ${DOCKER_REPO_PREFIX}/irssi
}
# alias irssi="docker run --rm -it --name irssi -e TERM -u $(id -u):$(id -g) --log-driver=none -v $HOME/.irssi:/home/user/.irssi nicolai86/irssi"
alias irssi_sidebar="docker exec -it irssi perl .irssi/scripts/adv_windowlist.pl"
