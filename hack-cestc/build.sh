#!/usr/bin/env bash

DEST=/Users/duanjiong/SynologyDrive/scripts/trzsz/

SCRIPT_DIR=$(cd $(dirname $0); pwd)
PROJECT_DIR=$(cd $SCRIPT_DIR/..; pwd)

cd $PROJECT_DIR

archs=(amd64 arm64)
for arch in ${archs[@]}; do
    DESTARCH=$DEST/bin/$arch
    GOARCH=$arch CGO_ENABLED=0 GOOS=linux go build -o $DESTARCH/tssh cmd/tssh/main.go
    DESTARCH=$DEST/mac-bin/$arch
    GOARCH=$arch CGO_ENABLED=0 GOOS=darwin go build -o $DESTARCH/tssh cmd/tssh/main.go
done