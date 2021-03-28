FROM golang:alpine
RUN  \
  apk add --no-cache make git gcc g++ protobuf && \
  go install -v github.com/gogo/protobuf/protoc-gen-gogoslick@latest && \
  git clone https://github.com/AsynkronIT/protoactor-go.git \
  $GOPATH/src/github.com/AsynkronIT/protoactor-go && \
  cd $GOPATH/src/github.com/AsynkronIT/protoactor-go && \
  go get ./... && \
  make
