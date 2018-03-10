#!/usr/bin/env bash
set -ex

export GOPATH=$PWD/gopath
export PATH=$GOPATH/bin:$PATH
mkdir $GOPATH/bin

cd $GOPATH/src/github.com/onsi/gomega
go get -v ./...
go get github.com/onsi/ginkgo
go install github.com/onsi/ginkgo/ginkgo

ginkgo -r -nodes=4 --randomizeAllSpecs --randomizeSuites --failOnPending --race && go vet
