#!/bin/bash
export TRAQ_PATH=$GOPATH/src/github.com/nicolai86/traq
export TRAQ_DATA_DIR="$HOME/Library/traq"

# to upload all: aws s3 sync ~/Library/traq/ s3://nicolai86-traq-data
# to download: aws s3 sync s3://nicolai86-traq-data ~/Library/traq/
