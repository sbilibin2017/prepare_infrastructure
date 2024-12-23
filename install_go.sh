#!/bin/bash

# Параметры по умолчанию
GO_VERSION="1.21.6"

# Установить Go
wget https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz
sudo tar -xvf go${GO_VERSION}.linux-amd64.tar.gz -C /usr/local
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc
echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.zshrc

go install golang.org/x/tools/cmd/godoc@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install golang.org/x/tools/gopls@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
