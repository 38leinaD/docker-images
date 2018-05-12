#!/bin/bash
set -e

if [ ! -f postgresql-9.4.1209.jar ]; then
    curl -O https://jdbc.postgresql.org/download/postgresql-9.4.1209.jar
fi

if [ ! -f ojdbc7.jar ]; then
    echo "Download ojdbc7.jar from http://www.oracle.com/technetwork/database/features/jdbc/jdbc-drivers-12c-download-1958347.html"
    exit 1
fi

docker build -t 38leinad/wildfly-10-jdbc:latest .