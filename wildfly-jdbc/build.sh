#!/bin/bash
set -e

VERSION=13.0.0.Final

if [ ! -f postgresql-9.4.1209.jar ]; then
    curl -O https://jdbc.postgresql.org/download/postgresql-9.4.1209.jar
fi

if [ ! -f ojdbc7_g.jar ]; then
    echo "Download ojdbc7_g.jar from http://www.oracle.com/technetwork/database/features/jdbc/jdbc-drivers-12c-download-1958347.html"
    exit 1
fi

docker build -t 38leinad/wildfly-jdbc:$VERSION .
docker tag 38leinad/wildfly-jdbc:$VERSION 38leinad/wildfly-jdbc:latest

if [[ "$1" == "push" ]]; then
    docker push 38leinad/wildfly-jdbc:$VERSION
    docker push 38leinad/wildfly-jdbc:latest
fi