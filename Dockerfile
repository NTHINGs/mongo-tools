FROM golang:1.12-alpine

USER root

WORKDIR /home/root/go/src/github.com/mongodb/

ENV GOROOT=/usr/local/go 

RUN apk --no-cache --update add bash perl git build-base && \
    git clone https://github.com/mongodb/mongo-tools && \
    cd mongo-tools && \
    . ./set_goenv.sh && \
    set_goenv && \
    mkdir bin && \
    go build -o bin/mongodump mongodump/main/mongodump.go && \
    go build -o bin/mongorestore mongorestore/main/mongorestore.go && \
    cp bin/mongodump /usr/local/bin/mongodump && \
    cp bin/mongorestore /usr/local/bin/mongorestore