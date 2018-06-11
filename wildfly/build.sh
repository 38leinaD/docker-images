#!/bin/bash
set -e

VERSION=13.0.0.Final

docker build -t 38leinad/wildfly:$VERSION .
docker tag 38leinad/wildfly:$VERSION 38leinad/wildfly:latest

if [[ "$1" == "push" ]]; then
    docker push 38leinad/wildfly:$VERSION
    docker push 38leinad/wildfly:latest
fi