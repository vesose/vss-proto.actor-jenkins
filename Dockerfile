FROM golang:alpine
ARG GOLANGCI_LINT_VERSION=1.16.0
RUN adduser -u 1000 -D jenkins && \
  wget -O - -q https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh \
  | ash -s v$GOLANGCI_LINT_VERSION && \
  apk add --no-cache make git gcc protobuf && \
  go get -v github.com/AsynkronIT/protoactor-go/... && \
  cd $GOPATH/src/github.com/AsynkronIT/protoactor-go && \
  go get ./... && \
  make && \
  mkdir /.cache && chmod -R 777 /.cache $GOPATH
