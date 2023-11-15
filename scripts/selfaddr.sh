#!/bin/bash

export GO_VER=golang:1.21-alpine3.18
export APP_NAME=selfaddr
export OS_VER=alpine:3.18

export SELFADDR_BUILD_IMAGE=learn-p2p/selfaddr:current
export SELFADDR_CONTAINER_NAME=selfaddr

COMMAND=$1

function build(){
    docker-compose -f ./build/selfaddr/builder.yml build
}

case $COMMAND in
    "build")
        build
        ;;
    "clean")
        clean
        ;;
    "run")
        docker run --name ${SELFADDR_CONTAINER_NAME} --rm ${SELFADDR_BUILD_IMAGE} /usr/local/bin/selfaddr
        ;;
    *)
        echo "Usage: $0 [commands]

command:
    build  native cli app
    clean  remove containers, images and native packages"
        ;;
esac