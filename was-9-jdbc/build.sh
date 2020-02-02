#!/bin/bash
set -e

if [ ! -f postgresql-9.4.1209.jar ]; then
    curl -O https://jdbc.postgresql.org/download/postgresql-9.4.1209.jar
fi

if [ ! -f ojdbc7.jar ]; then
    curl -O http://nexus.saas.hand-china.com/content/repositories/rdc/com/oracle/ojdbc7/12.1.0.2/ojdbc7-12.1.0.2.jar
    mv ojdbc7-12.1.0.2.jar ojdbc7.jar
fi

docker build -t 38leinad/was-jdbc:latest .
docker tag 38leinad/was-jdbc:latest 38leinad/was-jdbc:9.0.5.1

if [[ "$1" == "push" ]]; then
    docker push 38leinad/was-jdbc:latest
    docker push 38leinad/was-jdbc:9.0.5.1
fi