FROM golang:1.8-alpine

RUN apk add --update --no-cache \
  emacs git editorconfig

RUN go get -u golang.org/x/tools/cmd/goimports \
  golang.org/x/tools/cmd/godoc \
  github.com/golang/lint/golint \
  golang.org/x/tools/cmd/... \
  github.com/nsf/gocode \
  github.com/rogpeppe/godef
