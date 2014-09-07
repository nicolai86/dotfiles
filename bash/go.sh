export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"
export GOMAXPROCS=8

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

alias gocover="go test -coverprofile=coverage.out && go tool cover -html=coverage.out"