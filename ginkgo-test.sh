#!/usr/bin/env bash
set -ex

export GOPATH=$PWD/gopath
export PATH=$GOPATH/bin:$PATH
mkdir $GOPATH/bin

cd $GOPATH/src/github.com/onsi/ginkgo
go get -v -t ./...
go get golang.org/x/tools/cmd/cover
go get github.com/onsi/gomega
go install github.com/onsi/ginkgo/ginkgo

ginkgo -r -nodes=4 --randomizeAllSpecs --randomizeSuites --race --trace && go vet
