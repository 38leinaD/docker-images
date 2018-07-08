#!/bin/bash
set -e
docker build -t 38leinad/was:latest .
docker tag 38leinad/was-9:latest 38leinad/was:9.0.0.7

if [[ "$1" == "push" ]]; then
    docker push 38leinad/was:latest
    docker push 38leinad/was:9.0.0.7
fi