export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"

# ensure proper GOPATH setup
if [[ ! -d "$GOPATH/pkg" ]]; then
  mkdir "$GOPATH/pkg"
fi

if [[ ! -d "$GOPATH/bin" ]]; then
  mkdir "$GOPATH/bin"
fi

if [[ ! -d "$GOPATH/src" ]]; then
  mkdir "$GOPATH/src"
fi