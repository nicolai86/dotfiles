export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export GOMAXPROCS=8
export CDPATH=$GOPATH/src/github.com:$GOPATH/src/code.google.com/p
export PATH=/usr/local/Cellar/go/1.4.2/libexec/bin:$PATH

# much like bundle open
function gocd () {
  cd $(go list -f '{{.Dir}}' $1)
}

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
