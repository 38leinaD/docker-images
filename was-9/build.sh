#!/bin/bash
set -e
docker build -t 38leinad/was:latest .
docker tag 38leinad/was:latest 38leinad/was:9.0.5.1

if [[ "$1" == "push" ]]; then
    docker push 38leinad/was:latest
    docker push 38leinad/was:9.0.5.1
fi