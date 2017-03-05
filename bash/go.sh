#!/bin/bash
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export GOMAXPROCS=8
export CDPATH=$GOPATH/src/github.com:$GOPATH/src/code.google.com/p

# much like bundle open
function gocd () {
  cd "$(go list -f '{{.Dir}}' "$1")"
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

# ( echo "digraph G {" go list -f '{{range .Imports}}{{printf "\t%q -> %q;\n" $.ImportPath .}}{{end}}' \ $(go list -f '{{join .Deps " "}}' time) time echo "}" ) | dot -Tsvg -o time-deps.svg
# go test $( go list -f '{{if (not .Goroot)}}{{.ImportPath}}{{end}}' $( go list -f '{{join .Deps " "}}' golang.org/x/oauth2 ) )
# go list -e -f '{{with .Error}}{{.}}{{end}}' all package github.com/golang/oauth2: code in directory /Users/adg/src/github.com/golang/oauth2 expects import "golang.org/x/oauth2" ...
